package modelos;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
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
@Table(name="COCHE") // Renombra la entidad en la BD
@NamedQueries({
 @NamedQuery(name="Coche.findAll", query="SELECT c FROM Coche c"),
 @NamedQuery(name="Coche.findById", query="SELECT c FROM Coche c WHERE c.idCoche = :idCoche"),
 @NamedQuery(name="Coche.findByName", query="SELECT c FROM Coche c WHERE c.nombreModelo = :nombreModelo"),
})
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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idCoche;
    private String nombreModelo;
    @Column(unique=true)
    private String matricula;
    private String descripcion;
    private float precio;
    private float descuento;
    private int cv;
    private float consumo;
    @Enumerated(EnumType.STRING)
    private TipoCombustible combustible;
    private String color;
    private int fecha;
    private int km;
    @Enumerated(EnumType.STRING)
    private TipoCambio cajaCambios;
    private String foto1;
    private String foto2;
    @Enumerated(EnumType.STRING)
    private TipoEstado estado;
    @JoinColumn(name = "marcaCoche", referencedColumnName = "idMarca")
    @ManyToOne
    private Marca marca;
    @JoinColumn(name = "compraCoche", referencedColumnName = "idCompra")
    @OneToOne
    private Compra compra;

    public Coche()
    {
        
    }

    public Coche(Long idCoche, String nombreModelo, String matricula, String descripcion, float precio, float descuento, int cv, float consumo, TipoCombustible combustible, String color, int fecha, int km, TipoCambio cajaCambios, String foto1, String foto2, TipoEstado estado, Marca marca)
    {
        this.idCoche = idCoche;
        this.nombreModelo = nombreModelo;
        this.matricula = matricula;
        this.descripcion = descripcion;
        this.precio = precio;
        this.descuento = descuento;
        this.cv = cv;
        this.consumo = consumo;
        this.combustible = combustible;
        this.color = color;
        this.fecha = fecha;
        this.km = km;
        this.cajaCambios = cajaCambios;
        this.foto1 = foto1;
        this.foto2 = foto2;
        this.estado = estado;
        this.marca = marca;
    }

    public Coche(Long idCoche, String nombreModelo, String matricula, String descripcion, float precio, float descuento, int cv, float consumo, TipoCombustible combustible, String color, int fecha, int km, TipoCambio cajaCambios, String foto1, String foto2, TipoEstado estado, Marca marca, Compra compra)
    {
        this.idCoche = idCoche;
        this.nombreModelo = nombreModelo;
        this.matricula = matricula;
        this.descripcion = descripcion;
        this.precio = precio;
        this.descuento = descuento;
        this.cv = cv;
        this.consumo = consumo;
        this.combustible = combustible;
        this.color = color;
        this.fecha = fecha;
        this.km = km;
        this.cajaCambios = cajaCambios;
        this.foto1 = foto1;
        this.foto2 = foto2;
        this.estado = estado;
        this.marca = marca;
        this.compra = compra;
    }
    
    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public Long getIdCoche()
    {
        return this.idCoche;
    }

    public void setIdCoche(Long id)
    {
        this.idCoche = id;
    }

    public String getNombreModelo()
    {
        return this.nombreModelo;
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

    public float getPrecio()
    {
        return this.precio;
    }

    public void setPrecio(float precio)
    {
        this.precio = precio;
    }

    public float getDescuento()
    {
        return this.descuento;
    }

    public void setDescuento(float descuento)
    {
        this.descuento = descuento;
    }

    public int getCv()
    
    {
        return this.cv;
    }

    public void setCv(int cv)
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

    public int getFecha()
    {
        return fecha;
    }

    public void setFecha(int fecha)
    {
        this.fecha = fecha;
    }

    public int getKm()
    {
        return this.km;
    }

    public void setKm(int km)
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

    public String getFoto1()
    {
        return this.foto1;
    }

    public void setFoto1(String foto1)
    {
        this.foto1 = foto1;
    }
    
    public String getFoto2()
    {
        return this.foto2;
    }

    public void setFoto2(String foto2)
    {
        this.foto2 = foto2;
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
        String marca_modelo = this.marca + " " + this.nombreModelo;
        
        return marca_modelo;
    }

    public Compra getCompraCoche()
    {
        return this.compra;
    }

    public void setCompracoche(Compra compra)
    {
        this.compra = compra;
    }
    // </editor-fold>

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (idCoche != null ? idCoche.hashCode() : 0);
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
        if ((this.idCoche == null && other.idCoche != null) || (this.idCoche != null && !this.idCoche.equals(other.idCoche))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "modelos.Coche[ id=" + idCoche + " ]";
    }
    
}
