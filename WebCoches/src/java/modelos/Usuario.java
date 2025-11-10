/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.io.Serializable;

/**
 *
 * @author AAHG-PORTATIL
 */
@Entity
@Table(name="USUARIO") // Renombra la entidad en la BD
@NamedQueries({
 @NamedQuery(name="Usuario.findAll", query="SELECT u FROM Usuario u"),
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
    private Long id;
    private String dni;
    private String nombre;
    private String correo;
    private int telefono;
    private String direccion;
    private TipoRol rol;
    @OneToMany(mappedBy="usuario_Compra")
    private Long idCompra;

    public Usuario()
    {
        
    }
    
    public Usuario(Long id, String dni, String nombre, String correo, int telefono, String direccion, TipoRol rol)
    {
        this.id = id;
        this.dni = dni;
        this.nombre = nombre;
        this.correo = correo;
        this.telefono = telefono;
        this.direccion = direccion;
        this.rol = rol;
    }
    
    public Usuario(Long id, String dni, String nombre, String correo, int telefono, String direccion, TipoRol rol, Long idCompra)
    {
        this.id = id;
        this.dni = dni;
        this.nombre = nombre;
        this.correo = correo;
        this.telefono = telefono;
        this.direccion = direccion;
        this.rol = rol;
        this.idCompra = idCompra;
    }

    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public Long getId()
    {
        return this.id;
    }

    public void setId(Long id)
    {
        this.id = id;
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

    public Long getIdCompra()
    {
        return this.idCompra;
    }

    public void setIdCompra(Long idCompra)
    {
        this.idCompra = idCompra;
    }
    // </editor-fold>

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
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
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "modelos.Usuario[ id=" + id + " ]";
    }
    
}
