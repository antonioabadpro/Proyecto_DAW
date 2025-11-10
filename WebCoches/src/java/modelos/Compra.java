/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author AAHG-PORTATIL
 */
@Entity
@Table(name="COMPRA") // Renombra la entidad en la BD
public class Compra implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Date fechaCompra;
    private float precioTotal;
    private String direccionEntrega;
    
    @OneToOne(mappedBy="compra_Coche")
    private Long idCoche;

    public Compra()
    {
        
    }
    
    public Compra(Long id, Date fechaCompra, float precioTotal, String direccionEntrega, Long idCoche)
    {
        this.id = id;
        this.fechaCompra = fechaCompra;
        this.precioTotal = precioTotal;
        this.direccionEntrega = direccionEntrega;
        this.idCoche = idCoche;
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

    public Date getFechaCompra()
    {
        return this.fechaCompra;
    }

    public void setFechaCompra(Date fechaCompra)
    {
        this.fechaCompra = fechaCompra;
    }

    public float getPrecioTotal()
    {
        return this.precioTotal;
    }

    public void setPrecioTotal(float precioTotal)
    {
        this.precioTotal = precioTotal;
    }

    public String getDireccionEntrega()
    {
        return this.direccionEntrega;
    }

    public void setDireccionEntrega(String direccionEntrega)
    {
        this.direccionEntrega = direccionEntrega;
    }

    public Long getIdCoche()
    {
        return this.idCoche;
    }

    public void setIdCoche(Long idCoche)
    {
        this.idCoche = idCoche;
    }
    // </editor-fold>

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Compra)) {
            return false;
        }
        Compra other = (Compra) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelos.Compra[ id=" + id + " ]";
    }
    
}
