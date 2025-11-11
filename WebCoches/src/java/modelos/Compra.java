/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
    private Long idCompra;
    private Date fechaCompra;
    private float precioTotal;
    private String direccionEntrega;
    @JoinColumn(name = "usuarioCompra", referencedColumnName = "idUsuario")
    @ManyToOne
    private Usuario usuario;
    @OneToOne(mappedBy="compra")
    private Coche coche;

    public Compra()
    {
        
    }
    
    public Compra(Long id, Date fechaCompra, float precioTotal, String direccionEntrega, Usuario u, Coche c)
    {
        this.idCompra = id;
        this.fechaCompra = fechaCompra;
        this.precioTotal = precioTotal;
        this.direccionEntrega = direccionEntrega;
        this.usuario = u;
        this.coche = c;
    }
    
    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public Long getId()
    {
        return this.idCompra;
    }

    public void setId(Long id)
    {
        this.idCompra = id;
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

    public Coche getCocheCompra()
    {
        return this.coche;
    }

    public void setCocheCompra(Coche coche)
    {
        this.coche = coche;
    }

    public Usuario getUsuarioCompra()
    {
        return this.usuario;
    }

    public void setUsuarioCompra(Usuario usuario)
    {
        this.usuario = usuario;
    }
    // </editor-fold>

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCompra != null ? idCompra.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Compra)) {
            return false;
        }
        Compra other = (Compra) object;
        if ((this.idCompra == null && other.idCompra != null) || (this.idCompra != null && !this.idCompra.equals(other.idCompra))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelos.Compra[ id=" + idCompra + " ]";
    }
    
}
