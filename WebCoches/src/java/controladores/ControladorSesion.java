package controladores;

import jakarta.annotation.Resource;
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
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.UserTransaction;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Coche;
import modelos.Compra;

/**
 *
 * @author AAHG-PORTATIL
 */
@WebServlet(name = "ControladorSesion", urlPatterns = {"/sesion/*"})
public class ControladorSesion extends HttpServlet
{
    @PersistenceContext(unitName = "WebCochesPU")
    private EntityManager em;
    @Resource
    private UserTransaction utx; // Atributo para gestionar las transacciones

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
        String vista = null;

        if (accion == null)
        {
            accion = "/login"; // Vista por defecto
        }

        switch (accion)
        {
            case "/login":
            {
                vista = "VistaLogin";

            }; break;

            case "/registrar":
            {
                vista = "VistaRegistro";
            }; break;

            case "/cerrarSesion":
            {
                HttpSession sesion = request.getSession();
                sesion.invalidate();
                response.sendRedirect(request.getContextPath() + "/inicio");
                return;
            }
            
            case "/misPedidos":
            {
                HttpSession sesion = request.getSession();
                Usuario u = (Usuario) sesion.getAttribute("usuarioLogueado");
                
                if(u == null) // Si NO tiene la Sesion iniciada, lanzamos un error 401
                {
                    String textoErrorSesion = "El Usuario NO tiene la Sesion iniciada";
                    response.sendError(401, textoErrorSesion);
                    return;
                }
                else // Si tiene sesion iniciada, comprobamos que sea de tipo "Cliente"
                {
                    String rol = u.getRol().toString();

                    if(rol.equals("Cliente")) // Si el Usuario tiene el Rol de Cliente
                    {
                        // Buscamos todos los pedidos del Usuario en la Tabla de Compra
                        List<Compra> listaCompras = obtenerComprasUsuario(u.getIdUsuario());
                        request.setAttribute("listaCompras", listaCompras);

                        vista = "VistaMisPedidos";
                    }
                    else // Si el Usuario NO tiene el Rol de Cliente, lanzamos un error 403
                    {
                        String textoErrorRol = "NO eres Cliente, NO puedes realizar esta operacion";
                        response.sendError(403, textoErrorRol);
                        return;
                    }
                }
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
                String nomUsuario = request.getParameter("nomUsuario");
                String password = request.getParameter("password");

                Usuario u = buscarUsuario(nomUsuario);

                if (u != null && password.equals(u.getPassword())) // Si hemos encontrado el Usuario, guardamos el Usuario en el Ambito de la Sesion
                {
                    //String passwordEncriptada = encriptarPassword(password);

                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("usuarioLogueado", u);
                }
                else
                {
                    String textoError = "Usuario o Contraseña incorrectos.";
                    request.setAttribute("error", textoError);
                    System.out.println(textoError);

                    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/vistas/VistaLogin.jsp");
                    rd.forward(request, response);
                    return;
                }

            }; break;

            case "/registrar":
            {
                // Obtenemos los valores del formulario de Registro
                String nomUsuario = request.getParameter("nomUsuario");
                String password_sinEncriptar = request.getParameter("password");
                String nombre = request.getParameter("nombre");
                String dni = request.getParameter("dni");
                String correo = request.getParameter("correo");
                String telefono_string = request.getParameter("telefono");
                int telefono = Integer.parseInt(telefono_string);
                String direccion = request.getParameter("direccion");
                String codigoPostal = request.getParameter("cp");
                String provincia = request.getParameter("provincia");

                //String passwordEncriptada = encriptarPassword(password_sinEncriptar);
                // Creamos el Nuevo Usuario
                Usuario nuevoUsuario = new Usuario();
                nuevoUsuario.setNomUsuario(nomUsuario);
                nuevoUsuario.setPassword(password_sinEncriptar);
                nuevoUsuario.setNombre(nombre);
                nuevoUsuario.setDni(dni);
                nuevoUsuario.setCorreo(correo);
                nuevoUsuario.setTelefono(telefono);
                nuevoUsuario.setDireccion(direccion);
                nuevoUsuario.setCodigoPostal(codigoPostal);
                nuevoUsuario.setProvincia(provincia);
                nuevoUsuario.setRol(Usuario.TipoRol.Cliente);

                // Insertamos el Nuevo Usuario en la BD
                insertarUsuario(nuevoUsuario);
                System.out.println("El usuaio con 'nomUsuario' " + nomUsuario + " se ha registrado en el sistema con exito");
                
            }; break;
        }
        response.sendRedirect(request.getContextPath() + "/inicio");
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
     * @param nomUsuario Nombre de usuario del Usuario que queremos buscar en la BD
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

    /**
     * Inserta un nuevo Usuario en la BD
     * @param nuevoUsuario Es el Usuario que queremos insertar en la BD
     */
    public void insertarUsuario(Usuario nuevoUsuario)
    {
        try
        {
            this.utx.begin();
            this.em.persist(nuevoUsuario); // Inserta el usuario
            this.utx.commit();
            
        } catch (Exception ex)
        {
            Logger.getLogger(ControladorSesion.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("NO se ha podido realizar la insercion de Usuario con 'nomUsuario': " + nuevoUsuario.getNomUsuario());
        }
    }
    
    /**
     * Realiza una Consulta Dinamica Tipada en la Entidad Compra para obtener las compras que ha realizado un usuario
     * @param idUsuario id del Usuario del que queremos obtener sus compras
     * @return Devuelve las Compras que ha realizado el usuario con el id introducido por parametro
     */
    public List<Compra> obtenerComprasUsuario(Long idUsuario)
    {
        String consulta = "SELECT c FROM Compra c WHERE c.usuario.idUsuario = :idUsuario";
        TypedQuery<Compra> q = this.em.createQuery(consulta, Compra.class);
        q.setParameter("idUsuario", idUsuario);
        
        List<Compra> listaCompras = q.getResultList();
        
        return listaCompras;        
    }

}
