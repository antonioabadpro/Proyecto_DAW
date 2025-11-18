package controladores;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelos.Usuario;

/**
 *
 * @author AAHG-PORTATIL
 */
@WebServlet(name = "ControladorCRUDCoches", urlPatterns = {"/gestion/*"})
public class ControladorCRUDCoches extends HttpServlet
{
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
        String pathInfo = request.getPathInfo();
        String vista=null;
        
        HttpSession sesion = request.getSession();
        
        if(sesion == null)
        {
            String textoErrorSesion = "El Usuario NO tiene la Sesion iniciada";
            request.setAttribute("textoErrorRol", textoErrorSesion);
            System.out.println(textoErrorSesion);
            response.sendRedirect(request.getContextPath() + "/inicio");
        }
        else // Si tiene sesion iniciada, comprobamos que sea de tipo "Admin"
        {
            Usuario u = (Usuario) sesion.getAttribute("usuarioLogueado");
            String rol = u.getRol().toString();
            
            if(rol.equals("Admin")) // Si el Usuario tiene el Rol de Admin
            {
                switch(pathInfo)
                {
                    case "/insertar":
                    {

                        vista = "VistaInsertarCoche";
                    }; break;

                    case "/eliminar":
                    {

                    }; break;

                    case "/editar":
                    {

                    }; break;
                }
                
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/vistas/" + vista + ".jsp");
                rd.forward(request, response);
            }
            else // Si el Usuario NO tiene el Rol de Admin
            {
                String textoErrorRol = "NO eres Admin, NO puedes realizar esta operacion";
                request.setAttribute("textoErrorRol", textoErrorRol);
                System.out.println(textoErrorRol);
                response.sendRedirect(request.getContextPath() + "/inicio");
            }
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

}
