/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelos.Usuario;
import jakarta.inject.Inject;
import jakarta.security.enterprise.identitystore.PasswordHash;
import jakarta.servlet.http.HttpSession;
import static java.lang.System.console;

/**
 *
 * @author AAHG-PORTATIL
 */
@WebServlet(name = "ControladorSesion", urlPatterns = {"/sesion/*"})
public class ControladorSesion extends HttpServlet
{
    @PersistenceContext(unitName="WebCochesPU")
    private EntityManager em;
    
    //@Inject
    //private PasswordHash passwordHash;
    
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
        String accion = request.getPathInfo();
        String vista=null;

        if (accion == null)
        {
            accion = "/login"; // Vista por defecto
        }

        switch (accion)
        {
            case "/login":
            {
                vista="VistaLogin";
                
            }; break;

            case "/registrar":
            {
                vista="VistaRegistro";
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
        String accion = request.getPathInfo();

        if (accion == null)
        {
            accion = "/login"; // Vista por defecto
        }

        switch (accion)
        {
            case "/login":
            {
                // Obtenemos los valores del formulario de Login
                String nomUsuario=request.getParameter("nomUsuario");
                String password=request.getParameter("password");
                
                Usuario u = buscarUsuario(nomUsuario);
                
                if(u != null) // Si hemos encontrado el Usuario, guardamos el Usuario en el Ambito de la Sesion
                {
                    //String passwordEncriptada = encriptarPassword(password);
                    
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("usuarioLogueado", u);
                }
                
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/vistas/VistaInicio.jsp");
                rd.forward(request, response);
                
            }; break;

            case "/registrar":
            {
                // Obtenemos los valores del formulario de Registro
                String nombre = request.getParameter("nombre");
                String dni = request.getParameter("dni");
                String correo = request.getParameter("correo");
                String telefono_string = request.getParameter("telefono");
                String direccion = request.getParameter("direccion");
                String password_sinEncriptar = request.getParameter("password");
                
                //String passwordEncriptada = encriptarPassword(password_sinEncriptar);
                
                int telefono = 0;
                try
                {
                    telefono = Integer.parseInt(telefono_string);
                }
                catch (NumberFormatException e)
                {
                    // Error si el teléfono no es un número
                    System.out.println("Error -> El telefono NO es un numero");
                }

                // Creamos el Nuevo Usuario
                Usuario nuevoUsuario = new Usuario();
                //nuevoUsuario.setNomUsuario(nomUsuario);
                nuevoUsuario.setPassword(password_sinEncriptar);
                nuevoUsuario.setNombre(nombre);
                nuevoUsuario.setDni(dni);
                nuevoUsuario.setCorreo(correo);
                nuevoUsuario.setDireccion(direccion);
                nuevoUsuario.setTelefono(telefono);
                nuevoUsuario.setRol(Usuario.TipoRol.Cliente);
                
                // Guardamos el Nuevo Usuario en la BD
                this.em.persist(nuevoUsuario);
                
            }; break;
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/vistas/VistaInicio.jsp");
        rd.forward(request, response);
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
    
    /*
    public String encriptarPassword(String password_sinEncriptar)
    {
       String passwordEncriptada = this.passwordHash.generate(password_sinEncriptar.toCharArray());
        
        return passwordEncriptada;
    }
    */
    
    /**
     * Realiza una Consulta Nombrada en la Entidad Usuario para buscar un Usuario por su campo 'nomUsuario'
     * @return Devuelve el Usuario cuyo 'nomUsuario' coincida con el 'nomUsuario' introducido por parametro
     */
    public Usuario buscarUsuario(String nomUsuario)
    {
        Usuario u = null;
        
        String consulta = "SELECT u FROM Usuario u WHERE u.nomUsuario = :nomUsuario";
        TypedQuery<Usuario> q = this.em.createQuery(consulta, Usuario.class);
        q.setParameter("nomUsuario", nomUsuario);
        
        try
        {
            u = (Usuario) q.getSingleResult();
        }
        catch (NoResultException e)
        {
            System.err.println("NO hay ningun Usuario con el 'nomUsuario': " + nomUsuario);
        }
        return u;
    }

}
