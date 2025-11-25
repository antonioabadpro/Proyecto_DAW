/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.UserTransaction;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Coche;
import modelos.Compra;
import modelos.Usuario;

/**
 *
 * @author AAHG-PORTATIL
 */
@WebServlet(name = "ControladorCompraCoche", urlPatterns = {"/comprar", "/comprar/*", "/confirmarCompra/*"})
public class ControladorCompraCoche extends HttpServlet
{
    @PersistenceContext(unitName = "WebCochesPU")
    private EntityManager em;
    @Resource
    private UserTransaction utx; // Atributo para gestionar las transacciones
    
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {    
        String rutaServlet = request.getServletPath();
        
        String vista=null;

        if (rutaServlet == null)
        {
            rutaServlet = "/comprar"; // Vista por defecto
        }

        switch (rutaServlet)
        {
            case "/comprar":
            {
                HttpSession sesion = request.getSession();
                Usuario u = (Usuario) sesion.getAttribute("usuarioLogueado");
                
                if(u == null) // Si NO tiene la Sesion iniciada, lanzamos un error 401
                {
                    vista = "VistaLogin";
                }
                else // Si tiene sesion iniciada, comprobamos que sea de tipo "Cliente"
                {
                    String rol = u.getRol().toString();

                    if(rol.equals("Cliente")) // Si el Usuario tiene el Rol de Cliente
                    {
                        String pathInfo = request.getPathInfo();
                        String pathInfo_split[] = pathInfo.split("/");
                        String idCoche_string = pathInfo_split[1];
                        Long idCocheCompra = Long.valueOf(idCoche_string);

                        Coche c = buscarCochePorId(idCocheCompra);
                        request.setAttribute("coche", c);

                        vista="VistaCompraCoche";
                    }
                    else // Si el Usuario NO tiene el Rol de Cliente, lanzamos un error 403
                    {
                        String textoErrorRol = "NO eres Cliente, NO puedes realizar esta operacion";
                        response.sendError(403, textoErrorRol);
                        return;
                    }
                }
            }; break;
            
            case "/confirmarCompra":
            {
                String pathInfo = request.getPathInfo();
                String pathInfo_split[] = pathInfo.split("/");
                String idCoche_string = pathInfo_split[1];
                String idUsuario_string = pathInfo_split[2];
                Long idUsuario = Long.valueOf(idUsuario_string);
                Long idCoche = Long.valueOf(idCoche_string);
                
                // Buscamos el Usuario y el Coche con el 'id' pillado por parametros para añadirlo a la compra
                Usuario u = this.em.find(Usuario.class, idUsuario);
                Coche c = this.em.find(Coche.class, idCoche);
                
                // Insertamos la Compra en la BD
                Compra compra = new Compra();
                compra.setCoche(c);
                compra.setUsuario(u);
                
                c.setCompra(compra); // Modificamos el campo 'compra' del Coche, es decir, le asignamos al Coche que esta comprado
                
                insertarCompra(compra);
                modificarCoche(c);
                
                request.setAttribute("compra", compra);
                request.setAttribute("coche", c);
                request.setAttribute("usuario", u);
                
                vista="VistaPagoConfirmado";
            }; break;
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/vistas/" + vista + ".jsp");
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }
    
    /**
     * Realiza una Consulta Nombrada en la Entidad Coches para buscar un Coche por su ID
     * @param idCoche id del Coche que queremos buscar
     * @return Devuelve el Coche cuyo 'id' coincida con el 'id' introducido por parametro
     */
    public Coche buscarCochePorId(Long idCoche)
    {
        Coche c = null;
        
        String consultaNombrada = "Coche.findById";
        Query q = this.em.createNamedQuery(consultaNombrada);
        q.setParameter("idCoche", idCoche);
        
        try
        {
            c = (Coche) q.getSingleResult();
        }
        catch (NoResultException e)
        {
            System.err.println("NO hay ningun Coche con el ID: " + idCoche);
        }
        return c;
    }
    
    /**
     * Inserta una nueva Compra en la BD
     * @param nuevaCompra Es la Compra que queremos insertar en la BD
     */
    public void insertarCompra(Compra nuevaCompra)
    {
        try
        {
            this.utx.begin();
            this.em.persist(nuevaCompra); // Inserta la Compra
            this.utx.commit();
            
        } catch (Exception ex)
        {
            Logger.getLogger(ControladorSesion.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("NO se ha podido realizar la insercion de Compra del 'nomUsuario': " + nuevaCompra.getUsuario().getNomUsuario());
        }
    }
    
    /**
     * Modifica un Coche en la BD
     * @param c Es el Coche cuyo campo 'compra' queremos modificar en la BD para que NO salga en el Catalogo una vez que ya haya sido comprado
     */
    public void modificarCoche(Coche c)
    {
        try
        {
            this.utx.begin();
            this.em.merge(c); // Inserta la Compra
            this.utx.commit();
            
        } catch (Exception ex)
        {
            Logger.getLogger(ControladorSesion.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("NO se ha podido realizar la modificacion del Coche con matricula : " + c.getMatricula());
        }
    }

}
