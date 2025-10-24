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
import jakarta.persistence.Table;
import java.io.Serializable;

/**
 *
 * @author AAHG-PORTATIL
 */
@Entity
@Table(name="Usuario") // Renombra la entidad en la BD
@NamedQueries({
 @NamedQuery(name="Usuario.findAll", query="SELECT u FROM Usuario u"),
 @NamedQuery(name="Usuario.findByName", query="SELECT u FROM Usuario u WHERE u.nombre = :nombre"),
})
public class Usuario implements Serializable
{
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String dni;
    private String nombre;
    private String correo;
    private int telefono;
    private int rol;
    private String fotoPerfil;

    public Usuario(Long id, String dni, String nombre, String correo, int telefono, int rol, String fotoPerfil)
    {
        this.id = id;
        this.dni = dni;
        this.nombre = nombre;
        this.correo = correo;
        this.telefono = telefono;
        this.rol = rol;
        this.fotoPerfil = fotoPerfil;
    }

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

    public int getRol()
    {
        return this.rol;
    }

    public void setRol(int rol)
    {
        this.rol = rol;
    }

    public String getFotoPerfil()
    {
        return this.fotoPerfil;
    }

    public void setFotoPerfil(String fotoPerfil)
    {
        this.fotoPerfil = fotoPerfil;
    }

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
