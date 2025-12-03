/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author AAHG-PORTATIL
 */
@Entity
@Table(name="USUARIO") // Renombra la entidad en la BD
@NamedQueries({
 @NamedQuery(name="Usuario.findAll", query="SELECT u FROM Usuario u"),
 @NamedQuery(name="Usuario.findById", query="SELECT u FROM Usuario u WHERE u.idUsuario = :id"),
 @NamedQuery(name="Usuario.findByName", query="SELECT u FROM Usuario u WHERE u.nombre = :nombre"),
 @NamedQuery(name="Usuario.findByDni", query="SELECT u FROM Usuario u WHERE u.dni = :dni"),
})
public class Usuario implements Serializable
{
    public enum TipoRol
    {
        Cliente,
        Admin,
    }
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idUsuario;
    @Column(unique=true)
    private String dni;
    private String nombre;
    @Column(unique=true)
    private String nomUsuario;
    @Column(unique=true)
    private String correo;
    private String password;
    private String telefono;
    private String direccion;
    private String codigoPostal;
    private String provincia;
    @Enumerated(EnumType.STRING)
    private TipoRol rol;
    @OneToMany(mappedBy="usuario")
    private List<Compra> listaCompras;

    public Usuario()
    {
        
    }

    public Usuario(Long idUsuario, String dni, String nombre, String nomUsuario, String correo, String password, String telefono, String direccion, String codigoPostal, String provincia, TipoRol rol, List<Compra> listaCompras)
    {
        this.idUsuario = idUsuario;
        this.dni = dni;
        this.nombre = nombre;
        this.nomUsuario = nomUsuario;
        this.correo = correo;
        this.password = password;
        this.telefono = telefono;
        this.direccion = direccion;
        this.codigoPostal = codigoPostal;
        this.provincia = provincia;
        this.rol = rol;
        this.listaCompras = listaCompras;
    }

    public Usuario(Long idUsuario, String dni, String nombre, String nomUsuario, String correo, String password, String telefono, String direccion, String codigoPostal, String provincia, TipoRol rol)
    {
        this.idUsuario = idUsuario;
        this.dni = dni;
        this.nombre = nombre;
        this.nomUsuario = nomUsuario;
        this.correo = correo;
        this.password = password;
        this.telefono = telefono;
        this.direccion = direccion;
        this.codigoPostal = codigoPostal;
        this.provincia = provincia;
        this.rol = rol;
    }

    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public Long getIdUsuario()
    {
        return this.idUsuario;
    }

    public void setIdUsuario(Long id)
    {
        this.idUsuario = id;
    }

    public String getDni()
    {
        return this.dni;
    }

    public void setDni(String dni)
    {
        this.dni = dni;
    }

    public String getNombre()
    {
        return this.nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public String getNomUsuario()
    {
        return this.nomUsuario;
    }

    public void setNomUsuario(String nomUsuario)
    {
        this.nomUsuario = nomUsuario;
    }

    public String getCorreo()
    {
        return this.correo;
    }

    public void setCorreo(String correo)
    {
        this.correo = correo;
    }

    public String getPassword()
    {
        return this.password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getTelefono()
    {
        return this.telefono;
    }

    public void setTelefono(String telefono)
    {
        this.telefono = telefono;
    }

    public String getDireccion()
    {
        return this.direccion;
    }

    public void setDireccion(String direccion)
    {
        this.direccion = direccion;
    }

    public String getCodigoPostal()
    {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal)
    {
        this.codigoPostal = codigoPostal;
    }

    public String getProvincia()
    {
        return this.provincia;
    }

    public void setProvincia(String provincia)
    {
        this.provincia = provincia;
    }

    public TipoRol getRol()
    {
        return this.rol;
    }

    public void setRol(TipoRol rol)
    {
        this.rol = rol;
    }

    public List<Compra> getListaCompras()
    {
        return this.listaCompras;
    }

    public void setListaCompras(List<Compra> listaCompras)
    {
        this.listaCompras = listaCompras;
    }
    // </editor-fold>

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (idUsuario != null ? idUsuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario))
        {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.idUsuario == null && other.idUsuario != null) || (this.idUsuario != null && !this.idUsuario.equals(other.idUsuario)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "modelos.Usuario[ id=" + idUsuario + " ]";
    }
    
}
