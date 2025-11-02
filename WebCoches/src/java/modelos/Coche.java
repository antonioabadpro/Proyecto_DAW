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
        PorReparar // Si esta averiado
    }
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String matricula;
    private String descripcion;
    private Double precio;
    private Double descuento;
    private float cv;
    private float consumo;
    private TipoCombustible combustible;
    private String color;
    private float km;
    private TipoCambio cajaCambios;
    private String[] fotos;
    private TipoEstado estado;    

    public Coche(Long id, String matricula, String descripcion, Double precio, Double descuento, float cv, float consumo, TipoCombustible combustible, String color, float km, TipoCambio cajaCambios, String[] fotos, TipoEstado estado)
    {
        this.id = id;
        this.matricula = matricula;
        this.descripcion = descripcion;
        this.precio = precio;
        this.descuento = descuento;
        this.cv = cv;
        this.consumo = consumo;
        this.combustible = combustible;
        this.color = color;
        this.km = km;
        this.cajaCambios = cajaCambios;
        this.fotos = fotos;
        this.estado = estado;
    }
    
    public Long getId()
    {
        return this.id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getMatricula()
    {
        return this.matricula;
    }

    public void setMatricula(String matricula)
    {
        this.matricula = matricula;
    }
    
    public String getDescripcion()
    {
        return this.descripcion;
    }

    public void setDescripcion(String descripcion)
    {
        this.descripcion = descripcion;
    }

    public Double getPrecio()
    {
        return this.precio;
    }

    public void setPrecio(Double precio)
    {
        this.precio = precio;
    }

    public Double getDescuento()
    {
        return this.descuento;
    }

    public void setDescuento(Double descuento)
    {
        this.descuento = descuento;
    }

    public float getCv()
    
    {
        return this.cv;
    }

    public void setCv(float cv)
    {
        this.cv = cv;
    }

    public float getConsumo()
    {
        return this.consumo;
    }

    public void setConsumo(float consumo)
    {
        this.consumo = consumo;
    }

    public TipoCombustible getCombustible()
    {
        return this.combustible;
    }

    public void setCombustible(TipoCombustible combustible)
    {
        this.combustible = combustible;
    }

    public String getColor()
    {
        return this.color;
    }

    public void setColor(String color)
    {
        this.color = color;
    }

    public float getKm()
    {
        return this.km;
    }

    public void setKm(float km)
    {
        this.km = km;
    }

    public TipoCambio getCajaCambios()
    {
        return this.cajaCambios;
    }

    public void setCajaCambios(TipoCambio cajaCambios)
    {
        this.cajaCambios = cajaCambios;
    }

    public String[] getFotos()
    {
        return this.fotos;
    }

    public void setFotos(String[] fotos)
    {
        this.fotos = fotos;
    }

    public TipoEstado getEstado()
    {
        return this.estado;
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
