/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

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
import modelos.Coche;

/**
 *
 * @author AAHG-PORTATIL
 */
@WebServlet(name = "ControladorDetalle", urlPatterns = {"/detalle", "/detalle/*"})
public class ControladorDetalle extends HttpServlet
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

        if (rutaServlet == null)
        {
            rutaServlet = "/detalle"; // Vista por defecto
        }

        switch (rutaServlet)
        {
            case "/detalle":
            {
                String pathInfo = request.getPathInfo();
                String pathInfo_split[] = pathInfo.split("/");
                String idCoche_string = pathInfo_split[1];
                Long idCoche = Long.valueOf(idCoche_string);
        
                // Obtenemos los datos del Coche para mostrarlos en la Vista
                Coche c = buscarCochePorId(idCoche);
                if(c != null)
                {
                    request.setAttribute("coche", c);
                }
                else
                {
                    System.out.println("NO hay ningun Coche con el id '" + idCoche + "'");
                }
                
                vista="VistaDetalle2";
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

}
