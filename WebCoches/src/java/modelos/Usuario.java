/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

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
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long idUsuario;
    private String dni;
    private String nombre;
    private String correo;
    private int telefono;
    private String direccion;
    @Enumerated(EnumType.STRING)
    private TipoRol rol;
    @OneToMany(mappedBy="usuario")
    private List<Compra> listaCompras;

    public Usuario()
    {
        
    }
    
    public Usuario(Long id, String dni, String nombre, String correo, int telefono, String direccion, TipoRol rol)
    {
        this.idUsuario = id;
        this.dni = dni;
        this.nombre = nombre;
        this.correo = correo;
        this.telefono = telefono;
        this.direccion = direccion;
        this.rol = rol;
    }
    
    public Usuario(Long id, String dni, String nombre, String correo, int telefono, String direccion, TipoRol rol, List<Compra> listaCompras)
    {
        this.idUsuario = id;
        this.dni = dni;
        this.nombre = nombre;
        this.correo = correo;
        this.telefono = telefono;
        this.direccion = direccion;
        this.rol = rol;
        this.listaCompras = listaCompras;
    }

    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public Long getId()
    {
        return this.idUsuario;
    }

    public void setId(Long id)
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

    public String getCorreo()
    {
        return this.correo;
    }

    public void setCorreo(String correo)
    {
        this.correo = correo;
    }

    public int getTelefono()
    {
        return this.telefono;
    }

    public void setTelefono(int telefono)
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
