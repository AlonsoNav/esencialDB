package control;
import java.math.BigDecimal;

public class Desecho {
    private int tipoDesecho;
    private String nombre;
    private BigDecimal salubridad;

    public int getTipoDesecho() {
        return tipoDesecho;
    }

    public void setTipoDesecho(int tipoDesecho) {
        this.tipoDesecho = tipoDesecho;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public BigDecimal getSalubridad() {
        return salubridad;
    }

    public void setSalubridad(BigDecimal salubridad) {
        this.salubridad = salubridad;
    }
}
