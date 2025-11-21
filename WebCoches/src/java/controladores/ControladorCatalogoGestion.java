/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import modelos.Coche;
import modelos.Usuario;

/**
 *
 * @author AAHG-PORTATIL
 */
@WebServlet(name = "ControladorCoche", urlPatterns = {"/catalogo", "/gestion"})
public class ControladorCatalogoGestion extends HttpServlet
{
    @PersistenceContext(unitName="WebCochesPU")
    private EntityManager em;

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
        
        if(rutaServlet == null)
        {
            rutaServlet = "/catalogo";
        }
        else
        {
            switch(rutaServlet)
            {
                case "/catalogo":
                {
                    List<Coche> listaCoches = obtenerCoches();
                    
                    request.setAttribute("listaCoches", listaCoches);
                    
                    vista = "VistaCatalogo";
                }; break;
                
                case "/gestion":
                {
                    HttpSession sesion = request.getSession();
                    Usuario u = (Usuario) sesion.getAttribute("usuarioLogueado");
        
                    if(u == null)
                    {
                        String textoErrorSesion = "El Usuario NO tiene la Sesion iniciada";
                        request.setAttribute("textoErrorSesion", textoErrorSesion);
                        System.out.println(textoErrorSesion);
                        response.sendError(401, textoErrorSesion);
                        //response.sendRedirect(request.getContextPath() + "/inicio");
                        return;
                    }
                    else // Si tiene sesion iniciada, comprobamos que sea de tipo "Admin"
                    {
                        String rol = u.getRol().toString();
                        
                        if(rol.equals("Admin")) // Si el Usuario tiene el Rol de Admin
                        {
                            List<Coche> listaCoches = obtenerCoches();
                    
                            request.setAttribute("listaCoches", listaCoches);

                            vista = "VistaGestionCoches";
                        }
                        else // Si el Usuario NO tiene el Rol de Admin
                        {
                            String textoErrorRol = "NO eres Admin, NO puedes realizar esta operacion";
                            request.setAttribute("textoErrorRol", textoErrorRol);
                            System.out.println(textoErrorRol);
                            response.sendError(403, textoErrorRol);
                            //response.sendRedirect(request.getContextPath() + "/inicio");
                            return;
                        }
                    }
                }; break;
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/vistas/" + vista + ".jsp");
            rd.forward(request, response);
        }
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
     * Realiza una Consulta Dinamica Tipada en la Entidad Coches para obtener todos los Coches de la BD
     * @return Devuelve todos los Coches que hay en la BD
     */
    public List<Coche> obtenerCoches()
    {
        String consulta = "SELECT c FROM Coche c";
        TypedQuery<Coche> q = this.em.createQuery(consulta, Coche.class);
        
        List<Coche> listaCoches = q.getResultList();
        
        return listaCoches;        
    }

}
