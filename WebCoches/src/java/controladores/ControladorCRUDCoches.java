package controladores;

import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import jakarta.transaction.HeuristicMixedException;
import jakarta.transaction.HeuristicRollbackException;
import jakarta.transaction.NotSupportedException;
import jakarta.transaction.RollbackException;
import jakarta.transaction.SystemException;
import jakarta.transaction.UserTransaction;
import java.util.List;
import modelos.Coche;
import modelos.Marca;
import modelos.Usuario;

/**
 *
 * @author AAHG-PORTATIL
 */
@WebServlet(name = "ControladorCRUDCoches", urlPatterns = {"/gestion/*"})
@MultipartConfig (fileSizeThreshold = 1024 * 1024 * 1, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 20)
public class ControladorCRUDCoches extends HttpServlet
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
            
            if(u == null) // Si NO tiene la Sesion iniciada, lanzamos un error 401
            {
                String textoErrorSesion = "El Usuario NO tiene la Sesion iniciada";
                response.sendError(401, textoErrorSesion);
                return;
            }
            else // Si tiene sesion iniciada, comprobamos que sea de tipo "Admin"
            {
                String rol = u.getRol().toString();
                if(rol.equals("Admin")) // Si el Usuario tiene el Rol de Admin
                {
                    switch(pathInfo)
                    {
                        case "/insertar":
                        {
                            List<Marca> listaMarcas = obtenerMarcas();
                    
                            request.setAttribute("listaMarcas", listaMarcas);
                    
                            vista = "VistaInsertarCoche";
                        }; break;

                        case "/eliminar":
                        {
                            vista = "VistaEliminarCoche";

                        }; break;

                        case "/modificar":
                        {
                            List<Marca> listaMarcas = obtenerMarcas();
                    
                            request.setAttribute("listaMarcas", listaMarcas);
                            
                            vista = "VistaModificarCoche";
                        }; break;
                    }

                    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/vistas/" + vista + ".jsp");
                    rd.forward(request, response);
                }
                else // Si el Usuario NO tiene el Rol de Admin, lanzamos un error 403
                {
                    String textoErrorRol = "NO eres Admin, NO puedes realizar esta operacion";
                    response.sendError(403, textoErrorRol);
                }
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
        String pathInfo = request.getPathInfo();
        HttpSession sesion = request.getSession(); // Para mostrar los mensajes de Feedback despues de realizar la operacion CRUD en la 'VistaGestionCoches'
        
        switch(pathInfo)
        {
            case "/insertar":
            {
                // Obtenemos los valores del formulario de Insertar Coche
                String matricula = request.getParameter("matricula");
                String nombreModelo = request.getParameter("modelo");
                String color = request.getParameter("color");
                String descripcion = request.getParameter("descripcion");
                String combustible = request.getParameter("combustible");
                String consumo_string = request.getParameter("consumo");
                float consumo = Float.parseFloat(consumo_string);
                String cv_string = request.getParameter("cv");
                int cv = Integer.parseInt(cv_string);
                String cajaCambios = request.getParameter("cajaCambios");
                String km_string = request.getParameter("km");
                int km = Integer.parseInt(km_string);
                String fecha_string = request.getParameter("fecha");
                int fecha = Integer.parseInt(fecha_string);
                String estado = request.getParameter("estado");
                String precio_string = request.getParameter("precio");
                float precio = Float.parseFloat(precio_string);
                String descuento_string = request.getParameter("descuento");
                float descuento = Float.parseFloat(descuento_string);
                String idMarca_string = request.getParameter("marca");
                
                Long idMarca = Long.valueOf(idMarca_string);
                
                // Buscamos el objeto en la BD
                Marca marca = this.em.find(Marca.class, idMarca);
                
                // Creamos el Nuevo Coche
                Coche nuevoCoche = new Coche();
                nuevoCoche.setNombreModelo(nombreModelo);
                nuevoCoche.setMatricula(matricula);
                nuevoCoche.setDescripcion(descripcion);
                nuevoCoche.setPrecio(precio);
                nuevoCoche.setEstado(Coche.TipoEstado.valueOf(estado));
                nuevoCoche.setDescuento(descuento);
                nuevoCoche.setCv(cv);
                nuevoCoche.setConsumo(consumo);
                nuevoCoche.setCombustible(Coche.TipoCombustible.valueOf(combustible));
                nuevoCoche.setColor(color);
                nuevoCoche.setFecha(fecha);
                nuevoCoche.setKm(km);
                nuevoCoche.setCajaCambios(Coche.TipoCambio.valueOf(cajaCambios));
                nuevoCoche.setMarca(marca);
                
                // Insertamos la imagen en nuestro Proyecto
                String rutaImagenProyecto = getServletContext().getRealPath("/img_coches");

                for(int i=0; i<2; i++)
                {
                    String nombreFoto = "foto" + (i+1);
                    
                    // Obtenemos la ruta local desde donde el admin quiere subir la imagen (la que recuperamos del formulario)
                    Part informacionImagen = request.getPart(nombreFoto);
                    
                    if(informacionImagen != null && informacionImagen.getSize() > 0)
                    {
                        String nombreImagenGuardada = subirImagen(informacionImagen, rutaImagenProyecto);
                        
                        if(i==0) nuevoCoche.setFoto1(nombreImagenGuardada);
                        if(i==1) nuevoCoche.setFoto2(nombreImagenGuardada);
                    }
                }
                
                try
                {
                    // Insertamos el Nuevo Coche en la BD
                    insertarCoche(nuevoCoche);

                    String textoExito = "El Coche con matrícula '" + matricula + "' se ha registrado en el sistema con éxito";
                    sesion.setAttribute("textoResultado", textoExito); // Ponemos el Atributo en el Ambito de la Sesion para que sea accesible desde la 'VistaGestionCoches' a la que vamos a redireccionar
                    sesion.setAttribute("tipoMensaje", "success");

                } catch (Exception e)
                {
                    String textoError = "NO se ha podido realizar la inserción del Coche con matrícula '" + nuevoCoche.getMatricula() + "'";
                    sesion.setAttribute("textoResultado", textoError); // Ponemos el Atributo en el Ambito de la Sesion para que sea accesible desde la 'VistaGestionCoches' a la que vamos a redireccionar
                    sesion.setAttribute("tipoMensaje", "danger");
                }
                
            }; break;

            case "/eliminar":
            {

            }; break;

            case "/modificar":
            {

            }; break;
        }
        
        response.sendRedirect(request.getContextPath() + "/gestion");
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
     * Realiza una Consulta Estatica en la Entidad Marca para obtener todas las Marcas de la BD
     * @return Devuelve todas las Marcas que hay en la BD
     */
    public List<Marca> obtenerMarcas()
    {
        Query q = this.em.createNamedQuery("Marca.findAll");
        
        List<Marca> listaMarcas = q.getResultList();
        
        return listaMarcas;        
    }
    
    /**
     * Inserta un Nuevo Coche en la BD
     * @param nuevoCoche Coche que queremos insertar en la BD
     * @throws jakarta.transaction.NotSupportedException
     * @throws jakarta.transaction.SystemException
     * @throws jakarta.transaction.RollbackException
     * @throws jakarta.transaction.HeuristicMixedException
     * @throws jakarta.transaction.HeuristicRollbackException
     */
    public void insertarCoche(Coche nuevoCoche) throws NotSupportedException, SystemException, RollbackException, HeuristicMixedException, HeuristicRollbackException
    {
        this.utx.begin();
        this.em.persist(nuevoCoche); // Inserta el Coche
        this.utx.commit();
    }
    
    /**
     * 
     * @param informacionImagen
     * @param rutaImagenProyecto
     * @return Devuelve el nombre de la foto que queremos insertar en nuestro proyecto y en el campo 'foto' del Coche en la BD
     */
    private String subirImagen(Part informacionImagen, String rutaImagenProyecto)
    {
        // Obtenemos el nombre de la imagen que queremos guardar en la BD
        String nombreArchivo = informacionImagen.getSubmittedFileName();

        // Realizamos una Limpieza básica, ya que a veces el navegador Edge envía rutas completas
        nombreArchivo = new java.io.File(nombreArchivo).getName();
        
        // Definimos la Ruta de Destino donde queremos subir la imagen en nuestro proyecto
        java.nio.file.Path rutaDestino = java.nio.file.Paths.get(rutaImagenProyecto, nombreArchivo);

        // Guardamos la imagen en nuestro proyecto (Si existe, la reemplaza)
        try (java.io.InputStream input = informacionImagen.getInputStream())
        {
            java.nio.file.Files.copy(input, rutaDestino, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
        }
        catch (Exception e)
        {
            System.err.println("Error al guardar el archivo: " + nombreArchivo);
            return null;
        }

        return nombreArchivo;
    }

}
