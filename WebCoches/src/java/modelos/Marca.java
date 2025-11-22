/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
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
@Table(name="MARCA") // Renombra la entidad en la BD
@NamedQueries({
 @NamedQuery(name="Marca.findAll", query="SELECT m FROM Marca m"),
 @NamedQuery(name="Marca.findById", query="SELECT m FROM Marca m WHERE m.idMarca = :id"),
 @NamedQuery(name="Marca.findByName", query="SELECT m FROM Marca m WHERE m.nombre = :nombre"),
})
public class Marca implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idMarca;
    @Column(unique=true)
    private String nombre;
    @Column(unique=true)
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
    public Long getIdMarca()
    {
        return this.idMarca;
    }

    public void setIdMarca(Long id)
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
