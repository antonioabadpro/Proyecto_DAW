package controladores;

import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
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
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
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
        String vista=null;
        String pathInfo = request.getPathInfo();
        
        String[] pathInfo_partes = pathInfo.split("/");
        String pathInfo_accion = "/" + pathInfo_partes[1];
        
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
            }
            else // Si tiene sesion iniciada, comprobamos que sea de tipo "Admin"
            {
                String rol = u.getRol().toString();
                if(rol.equals("Admin")) // Si el Usuario tiene el Rol de Admin
                {
                    switch(pathInfo_accion)
                    {
                        case "/insertar":
                        {
                            List<Marca> listaMarcas = obtenerMarcas();
                            request.setAttribute("listaMarcas", listaMarcas);
                    
                            vista = "VistaInsertarCoche";
                        }; break;

                        case "/eliminar":
                        {
                            if(pathInfo_partes.length > 1)
                            {
                                String idCocheEliminar_string = pathInfo_partes[2];
                                Long idCocheEliminar = Long.valueOf(idCocheEliminar_string);

                                // Buscamos el Coche con el 'idCoche' obtenido en la 'VistaGestionCoche' en la BD
                                Coche cocheEliminar = this.em.find(Coche.class, idCocheEliminar);

                                request.setAttribute("coche", cocheEliminar);
                            }
                            
                            vista = "VistaEliminarCoche";
                        }; break;

                        case "/modificar":
                        {
                            if(pathInfo_partes.length > 1)
                            {
                                List<Marca> listaMarcas = obtenerMarcas();
                                request.setAttribute("listaMarcas", listaMarcas);
                            
                                String idCocheModificar_string = pathInfo_partes[2];
                                Long idCocheModificar = Long.valueOf(idCocheModificar_string);

                                // Buscamos el Coche con el 'idCoche' obtenido en la 'VistaGestionCoche' en la BD
                                Coche cocheModificar = this.em.find(Coche.class, idCocheModificar);
                                
                                request.setAttribute("coche", cocheModificar);
                            }
                            
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
        
        String[] pathInfo_partes = pathInfo.split("/");
        String pathInfo_accion = "/" + pathInfo_partes[1];
        
        HttpSession sesion = request.getSession();
        
        switch(pathInfo_accion)
        {
            case "/insertar":
            {
                // Obtenemos los valores del formulario de Insertar Coche
                String matricula = request.getParameter("matricula");
                String nombreModelo = request.getParameter("nombreModelo");
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
                int descuento = Integer.parseInt(descuento_string);
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
                
                boolean esValido = validarDatosInsertar(matricula, nombreModelo, color, combustible, cajaCambios, estado, consumo_string, cv_string, km_string, fecha_string, precio_string, descuento_string, idMarca_string);
                    
                if(esValido == false) // Si los campos NO son validos
                {
                    String textoValidacion = "Los campos NO son válidos, verfícalos antes de enviar el formulario";
                    request.setAttribute("textoValidacion", textoValidacion);
                    // Para poder cargar todos los campos con los valores que tenian antes de mostrarse el mensaje de error
                    List<Marca> listaMarcas = obtenerMarcas();
                    request.setAttribute("listaMarcas", listaMarcas);
                    request.setAttribute("coche", nuevoCoche);
                    // Refrescamos la Vista dentro de la misma peticion
                    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/vistas/VistaInsertarCoche.jsp");
                    rd.forward(request, response);
                    return;
                }
                else // Si los campos son validos
                {
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
                }
            }; break;

            case "/eliminar":
            {
                if(pathInfo_partes.length > 1)
                {
                    String idCocheEliminar_string = pathInfo_partes[2];
                    Long idCocheEliminar = Long.valueOf(idCocheEliminar_string);
                    
                    // Buscamos el Coche que queremos eliminar para poder mostrar su matricula como mensaje de Feedback tras la eliminacion
                    Coche c = this.em.find(Coche.class, idCocheEliminar);

                    try
                    {
                        // Eliminamos el Coche de la BD
                        eliminarCoche(idCocheEliminar);
                        String textoExito = "El Coche con matrícula '" + c.getMatricula() + "' se ha eliminado del sistema con éxito";
                        sesion.setAttribute("textoResultado", textoExito); // Ponemos el Atributo en el Ambito de la Sesion para que sea accesible desde la 'VistaGestionCoches' a la que vamos a redireccionar
                        sesion.setAttribute("tipoMensaje", "success");
                    }
                    catch (Exception e)
                    {
                        String textoError = "NO se ha podido realizar la eliminación del Coche con matrícula '" + c.getMatricula() + "'";
                        sesion.setAttribute("textoResultado", textoError); // Ponemos el Atributo en el Ambito de la Sesion para que sea accesible desde la 'VistaGestionCoches' a la que vamos a redireccionar
                        sesion.setAttribute("tipoMensaje", "danger");
                        Logger.getLogger(ControladorCRUDCoches.class.getName()).log(Level.SEVERE, null, e);
                    }
                }

            }; break;

            case "/modificar":
            {
                if(pathInfo_partes.length > 1)
                {
                    String idCocheModificar_string = pathInfo_partes[2];
                    Long idCocheModificar = Long.valueOf(idCocheModificar_string);
                    
                    // Obtenemos los valores del formulario de Insertar Coche
                    String matricula = request.getParameter("matricula");
                    String nombreModelo = request.getParameter("nombreModelo");
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
                    int descuento = Integer.parseInt(descuento_string);
                    String idMarca_string = request.getParameter("marca");

                    Long idMarca = Long.valueOf(idMarca_string);                    

                    // Buscamos el objeto en la BD
                    Marca marca = this.em.find(Marca.class, idMarca);

                    // Buscamos el Coche que queremos modificar para poder mostrar su matricula como mensaje de Feedback tras la eliminacion
                    Coche cocheModificado = this.em.find(Coche.class, idCocheModificar);
                    cocheModificado.setNombreModelo(nombreModelo);
                    cocheModificado.setDescripcion(descripcion);
                    cocheModificado.setPrecio(precio);
                    cocheModificado.setEstado(Coche.TipoEstado.valueOf(estado));
                    cocheModificado.setDescuento(descuento);
                    cocheModificado.setCv(cv);
                    cocheModificado.setConsumo(consumo);
                    cocheModificado.setCombustible(Coche.TipoCombustible.valueOf(combustible));
                    cocheModificado.setColor(color);
                    cocheModificado.setFecha(fecha);
                    cocheModificado.setKm(km);
                    cocheModificado.setCajaCambios(Coche.TipoCambio.valueOf(cajaCambios));
                    cocheModificado.setMarca(marca);
                    
                    // Insertamos la imagen en nuestro Proyecto
                    String rutaImagenProyecto = getServletContext().getRealPath("/img_coches");

                    for(int i=0; i<2; i++)
                    {
                        String nombreFoto = "foto" + (i+1);

                        // Obtenemos la ruta local desde donde el admin quiere subir la imagen (la que recuperamos del formulario)
                        Part informacionImagen = request.getPart(nombreFoto);
                        System.out.println("informacionImagen: " + informacionImagen);

                        if(informacionImagen != null && informacionImagen.getSize() > 0)
                        {
                            String nombreImagenGuardada = subirImagen(informacionImagen, rutaImagenProyecto);

                            if(i==0) cocheModificado.setFoto1(nombreImagenGuardada);
                            if(i==1) cocheModificado.setFoto2(nombreImagenGuardada);
                        }
                    }
                    
                    boolean esValido = validarDatosModificar(nombreModelo, color, combustible, cajaCambios, estado, consumo_string, cv_string, km_string, fecha_string, precio_string, descuento_string, idMarca_string);
                    
                    if(esValido == false) // Si los campos NO son validos
                    {
                        String textoValidacion = "Los campos NO son válidos, verfícalos antes de enviar el formulario";
                        request.setAttribute("textoValidacion", textoValidacion);
                        
                        // Para poder cargar todos los campos con los valores que tenian antes de mostrarse el mensaje de error
                        List<Marca> listaMarcas = obtenerMarcas();
                        request.setAttribute("listaMarcas", listaMarcas);
                        request.setAttribute("coche", cocheModificado);
                        // Refrescamos la Vista dentro de la misma peticion
                        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/vistas/VistaModificarCoche.jsp");
                        rd.forward(request, response);
                        return;
                    }
                    else // Si los campos son validos
                    {
                        try
                        {
                            // Modificamos el Coche de la BD
                            modificarCoche(cocheModificado);
                            String textoExito = "El Coche con matrícula '" + cocheModificado.getMatricula() + "' ha sido modificado en el sistema con éxito";
                            sesion.setAttribute("textoResultado", textoExito); // Ponemos el Atributo en el Ambito de la Sesion para que sea accesible desde la 'VistaGestionCoches' a la que vamos a redireccionar
                            sesion.setAttribute("tipoMensaje", "success");
                        }
                        catch (Exception e)
                        {
                            String textoError = "NO se ha podido realizar la modificacion del Coche con matrícula '" + cocheModificado.getMatricula() + "'";
                            sesion.setAttribute("textoResultado", textoError); // Ponemos el Atributo en el Ambito de la Sesion para que sea accesible desde la 'VistaGestionCoches' a la que vamos a redireccionar
                            sesion.setAttribute("tipoMensaje", "danger");
                            Logger.getLogger(ControladorCRUDCoches.class.getName()).log(Level.SEVERE, null, e);
                        }
                    }
                }
            }; break;
            
            case "/comprobarMatricula": // Peticion Fetch proveniente del campo 'Usuario' del formulario de Registro
            {
                String resultadoConsulta;
                String matricula = request.getParameter("matriculaFetch");
                
                // Realizamos una Consulta para comprobar si el correo existe en la BD
                Coche c = buscarCochePorMatricula(matricula);
                
                if(c == null) // Si NO existe un Coche con esa matricula en la BD
                {
                    resultadoConsulta = "NOexisteMatricula";
                }
                else // Si existe un Coche con esa matricula en la BD
                {
                    resultadoConsulta = "existeMatricula";
                }
                response.getWriter().write(resultadoConsulta); // Enviamos la respuesta a la funcion JS
                return;
            }
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
     * Elimina un Coche de la BD
     * @param idCocheEliminar id del Coche que queremos eliminar de la BD
     * @throws jakarta.transaction.NotSupportedException
     * @throws jakarta.transaction.SystemException
     * @throws jakarta.transaction.RollbackException
     * @throws jakarta.transaction.HeuristicMixedException
     * @throws jakarta.transaction.HeuristicRollbackException
     */
    public void eliminarCoche(Long idCocheEliminar) throws NotSupportedException, SystemException, RollbackException, HeuristicMixedException, HeuristicRollbackException
    {
        this.utx.begin();
        // Buscamos el Coche con el 'idCoche' obtenido en la 'VistaGestionCoche' en la BD
        Coche cocheEliminar = this.em.find(Coche.class, idCocheEliminar);
        this.em.remove(cocheEliminar); // Elimina el Coche
        this.utx.commit();
    }
    
    /**
     * Modifica o Actualiza un Coche en la BD
     * @param cocheModificar id del Coche que queremos modificar en la BD
     * @throws jakarta.transaction.NotSupportedException
     * @throws jakarta.transaction.SystemException
     * @throws jakarta.transaction.RollbackException
     * @throws jakarta.transaction.HeuristicMixedException
     * @throws jakarta.transaction.HeuristicRollbackException
     */
    public void modificarCoche(Coche cocheModificar) throws NotSupportedException, SystemException, RollbackException, HeuristicMixedException, HeuristicRollbackException
    {
        this.utx.begin();
        // Buscamos el Coche con el 'idCoche' obtenido en la 'VistaGestionCoche' en la BD
        //Coche cocheModificar = this.em.find(Coche.class, idCocheEliminar);
        this.em.merge(cocheModificar); // Modifico el Coche
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
        System.out.println("nombreArchivo: " + nombreArchivo);

        // Realizamos una Limpieza básica, ya que a veces el navegador Edge envía rutas completas
        nombreArchivo = new java.io.File(nombreArchivo).getName();
        System.out.println("nombreArchivo Limpio: " + nombreArchivo);
        
        // Definimos la Ruta de Destino donde queremos subir la imagen en nuestro proyecto
        java.nio.file.Path rutaDestino = java.nio.file.Paths.get(rutaImagenProyecto, nombreArchivo);
        System.out.println("rutaDestino: " + rutaDestino);

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
    
    /**
     * Realiza una Consulta Nombrada en la Entidad Coche para buscar un Usuario por su campo 'matricula'
     * Utilizado para el Fetch del campo 'matricula' del Formulario de Insertar Coche
     * @param matricula Matricula del Coche que queremos buscar en la BD
     * @return Devuelve el Coche cuya matricula coincida con la 'matricula' introducida por parametro
     */
    public Coche buscarCochePorMatricula(String matricula)
    {
        Coche c = null;

        String consulta = "SELECT c FROM Coche c WHERE c.matricula = :matricula";
        TypedQuery<Coche> q = this.em.createQuery(consulta, Coche.class);
        q.setParameter("matricula", matricula);

        try
        {
            c = (Coche) q.getSingleResult();
        }
        catch (NoResultException e)
        {
            System.err.println("NO hay ningun Coche con la 'matricula': " + matricula);
        }
        return c;
    }
    
    /**
     * Valida los campos basándose en el formato establecido en JavaScript.
     * @return Devuelve 'true' si los campos del formulario de Insertar Coche son validos y 'false' en caso contrario
     */
    private boolean validarDatosInsertar(String matricula, String modelo, String color, String combustible, String cajaCambios, String estado, String consumo_string, String cv_string, String km_string, String fecha_string, String precio_string, String descuento_string, String idMarca_string)
    {
        boolean esValido = true;
        
        System.out.println("Validando...");
        
        String formatoMatricula = "^\\d{4}[A-Z]{3}$";
        String formatoModelo = "//d+";
        String formatoColor = "^[a-zA-ZñÑáéíóúÁÉÍÓÚ\\s]+$";
        
        if (matricula == null || matricula.trim().isEmpty() || matricula.matches(formatoMatricula) || buscarCochePorMatricula(matricula)!=null) esValido = false;
        if (modelo == null || modelo.trim().isEmpty() || modelo.matches(formatoModelo)) esValido = false;
        if (color == null || color.trim().isEmpty() || color.matches(formatoColor)==false) esValido = false;
        if (combustible == null || combustible.trim().isEmpty()) esValido = false;
        if (cajaCambios == null || cajaCambios.trim().isEmpty()) esValido = false;
        if (estado == null || estado.trim().isEmpty()) esValido = false;
        if (idMarca_string == null || idMarca_string.trim().isEmpty()) esValido = false;

        // Validamos los campos numericos
        try
        {
            float precio = Float.parseFloat(precio_string);
            if (precio < 500) esValido = false;
            
            int descuento = Integer.parseInt(descuento_string);
            if (descuento < 0 || descuento > 100) esValido = false;
            
            float consumo = Float.parseFloat(consumo_string);
            if (consumo < 0) esValido = false;
            
            int cv = Integer.parseInt(cv_string);
            if (cv < 1) esValido = false;
            
            int km = Integer.parseInt(km_string);
            if (km < 0) esValido = false;
            
            int fecha = Integer.parseInt(fecha_string); // Año
            if (fecha < 1980 || fecha > 2025) esValido = false;

        } catch (NumberFormatException e)
        {
            esValido = false;
            throw new IllegalArgumentException("Uno de los campos numéricos tiene un formato incorrecto o está vacío.");
        }
        return esValido;
    }
    
    /**
     * Valida los campos basándose en el formato establecido en JavaScript.
     * La diferencia con el metodo 'validarDatos()' es que este metodo NO valida la matricula, por eso se utiliza en el formulario de Modificar
     * @return Devuelve 'true' si los campos del formulario de Modificar Coche son validos y 'false' en caso contrario
     */
    private boolean validarDatosModificar(String modelo, String color, String combustible, String cajaCambios, String estado, String consumo_string, String cv_string, String km_string, String fecha_string, String precio_string, String descuento_string, String idMarca_string)
    {
        boolean esValido = true;
        
        System.out.println("Validando...");
        
        // Validamos los campos vacíos (Strings)
        if (modelo == null || modelo.trim().isEmpty() || modelo.matches("//d+")) esValido = false;
        if (color == null || color.trim().isEmpty() || color.matches("^[a-zA-ZñÑáéíóúÁÉÍÓÚ\\s]+$")==false) esValido = false;
        if (combustible == null || combustible.trim().isEmpty()) esValido = false;
        if (cajaCambios == null || cajaCambios.trim().isEmpty()) esValido = false;
        if (estado == null || estado.trim().isEmpty()) esValido = false;
        if (idMarca_string == null || idMarca_string.trim().isEmpty()) esValido = false;

        // Validamos los campos numericos
        try
        {
            float precio = Float.parseFloat(precio_string);
            if (precio < 500) esValido = false;
            
            int descuento = Integer.parseInt(descuento_string);
            if (descuento < 0 || descuento > 100) esValido = false;
            
            float consumo = Float.parseFloat(consumo_string);
            if (consumo < 0) esValido = false;
            
            int cv = Integer.parseInt(cv_string);
            if (cv < 1) esValido = false;
            
            int km = Integer.parseInt(km_string);
            if (km < 0) esValido = false;
            
            int fecha = Integer.parseInt(fecha_string); // Año
            if (fecha < 1980 || fecha > 2025) esValido = false;

        } catch (NumberFormatException e)
        {
            throw new IllegalArgumentException("Uno de los campos numéricos tiene un formato incorrecto o está vacío.");
        }
        return esValido;
    }

}
