/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.io.Serializable;

/**
 *
 * @author AAHG-PORTATIL
 */
@Entity
public class Coche implements Serializable
{
    public enum TipoCombustible
    {
        Gasolina,
        Diesel,
        Electrico,
        Hibrido
    }
    
    public enum TipoCambio
    {
        Manual,
        Automatico
    }
    
    public enum TipoEstado
    {
        Nuevo, // Menos de 100Km
        ComoNuevo, // Menos de 10.000Km
        Usado, // Mas de 10.000Km
        PorReparar     
    }
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String descripcion;
    private Double precio;
    private Double descuento;
    private float cv;
    private float consumo;
    private TipoCombustible Combustible;
    private String color;
    private float km;
    private TipoCambio cajaCambios;
    private String[] fotos;
    private TipoEstado estado;

    
    
    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }
    
    public String getDescripcion()
    {
        return descripcion;
    }

    public void setDescripcion(String descripcion)
    {
        this.descripcion = descripcion;
    }

    public Double getPrecio()
    {
        return precio;
    }

    public void setPrecio(Double precio)
    {
        this.precio = precio;
    }

    public Double getDescuento()
    {
        return descuento;
    }

    public void setDescuento(Double descuento)
    {
        this.descuento = descuento;
    }

    public float getCv()
    
    {
        return cv;
    }

    public void setCv(float cv)
    {
        this.cv = cv;
    }

    public float getConsumo()
    {
        return consumo;
    }

    public void setConsumo(float consumo)
    {
        this.consumo = consumo;
    }

    public TipoCombustible getCombustible()
    {
        return Combustible;
    }

    public void setCombustible(TipoCombustible Combustible)
    {
        this.Combustible = Combustible;
    }

    public String getColor()
    {
        return color;
    }

    public void setColor(String color)
    {
        this.color = color;
    }

    public float getKm()
    {
        return km;
    }

    public void setKm(float km)
    {
        this.km = km;
    }

    public TipoCambio getCajaCambios()
    {
        return cajaCambios;
    }

    public void setCajaCambios(TipoCambio cajaCambios)
    {
        this.cajaCambios = cajaCambios;
    }

    public String[] getFotos()
    {
        return fotos;
    }

    public void setFotos(String[] fotos)
    {
        this.fotos = fotos;
    }

    public TipoEstado getEstado()
    {
        return estado;
    }

    public void setEstado(TipoEstado estado)
    {
        this.estado = estado;
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
        if (!(object instanceof Coche)) {
            return false;
        }
        Coche other = (Coche) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "modelos.Coche[ id=" + id + " ]";
    }
    
}
