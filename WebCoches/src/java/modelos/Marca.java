/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author AAHG-PORTATIL
 */
@Entity
@Table(name="MARCA") // Renombra la entidad en la BD
public class Marca implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long idMarca;
    private String nombre;
    private String logo;
    
    @OneToMany(mappedBy="marca")
    private List<Coche> listaCoches;
    
    public Marca()
    {
        
    }

    public Marca(Long id, String nombre, String logo, List<Coche> listaCoches)
    {
        this.idMarca = id;
        this.nombre = nombre;
        this.logo = logo;
        this.listaCoches = listaCoches;
    }
    
    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public Long getId()
    {
        return this.idMarca;
    }

    public void setId(Long id)
    {
        this.idMarca = id;
    }

    public String getNombre()
    {
        return this.nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public String getLogo()
    {
        return this.logo;
    }

    public void setLogo(String logo)
    {
        this.logo = logo;
    }

    public List<Coche> getListaCoches()
    {
        return this.listaCoches;
    }

    public void setListaCoches(List<Coche> listaCoches)
    {
        this.listaCoches = listaCoches;
    }
    // </editor-fold>

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (idMarca != null ? idMarca.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Marca)) {
            return false;
        }
        Marca other = (Marca) object;
        if ((this.idMarca == null && other.idMarca != null) || (this.idMarca != null && !this.idMarca.equals(other.idMarca))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "modelos.Marca[ id=" + idMarca + " ]";
    }
    
}
