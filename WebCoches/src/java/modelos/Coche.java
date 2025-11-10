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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.io.Serializable;

/**
 *
 * @author AAHG-PORTATIL
 */
@Entity
@Table(name="COCHE") // Renombra la entidad en la BD
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
    private String nombreModelo;
    private String matricula;
    private String descripcion;
    private Double precio;
    private Double descuento;
    private float cv;
    private float consumo;
    @Enumerated(EnumType.STRING)
    private TipoCombustible combustible;
    private String color;
    private float km;
    @Enumerated(EnumType.STRING)
    private TipoCambio cajaCambios;
    private String foto;
    @Enumerated(EnumType.STRING)
    private TipoEstado estado;
    @ManyToOne
    private Marca marca;

    public Coche()
    {
        
    }
    
    public Coche(Long id, String nombreModelo, String matricula, String descripcion, Double precio, Double descuento, float cv, float consumo, TipoCombustible combustible, String color, float km, TipoCambio cajaCambios, String foto, TipoEstado estado, Marca marca)
    {
        this.id = id;
        this.nombreModelo = nombreModelo;
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
        this.foto = foto;
        this.estado = estado;
        this.marca = marca;
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

    public String getNombreModelo()
    {
        return nombreModelo;
    }

    public void setNombreModelo(String nombreModelo)
    {
        this.nombreModelo = nombreModelo;
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

    public String getFoto()
    {
        return this.foto;
    }

    public void setFoto(String foto)
    {
        this.foto = foto;
    }

    public TipoEstado getEstado()
    {
        return this.estado;
    }

    public void setEstado(TipoEstado estado)
    {
        this.estado = estado;
    }

    public Marca getMarca()
    {
        return this.marca;
    }

    public void setMarca(Marca marca)
    {
        this.marca = marca;
    }
    
    public String getMarcaModelo()
    {
        String marca_modelo = this.marca + this.nombreModelo;
        
        return marca_modelo;
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
