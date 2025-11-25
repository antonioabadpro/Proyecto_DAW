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
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import java.io.Serializable;

/**
 *
 * @author AAHG-PORTATIL
 */
@Entity
@Table(name="COMPRA") // Renombra la entidad en la BD
@NamedQueries({
 @NamedQuery(name="Compra.findAll", query="SELECT c FROM Compra c")
})
public class Compra implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idCompra;
    @JoinColumn(name = "usuarioCompra", referencedColumnName = "idUsuario")
    @ManyToOne
    private Usuario usuario;
    @OneToOne(mappedBy="compra")
    private Coche coche;

    public Compra()
    {
        
    }
    
    public Compra(Long id, Usuario u, Coche c)
    {
        this.idCompra = id;
        this.usuario = u;
        this.coche = c;
    }
    
    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public Long getIdCompra()
    {
        return this.idCompra;
    }

    public void setIdCompra(Long id)
    {
        this.idCompra = id;
    }

    public Coche getCoche()
    {
        return this.coche;
    }

    public void setCoche(Coche coche)
    {
        this.coche = coche;
    }

    public Usuario getUsuario()
    {
        return this.usuario;
    }

    public void setUsuario(Usuario usuario)
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
