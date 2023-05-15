package control;

import java.math.BigDecimal;

public class TipoRecipiente {
    private int id;
    private BigDecimal capacidad;
    private String name;
    private int cantidad;

    public TipoRecipiente(int id, BigDecimal capacidad, String name, int cantidad) {
        this.id = id;
        this.capacidad = capacidad;
        this.name = name;
        this.cantidad = cantidad;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public BigDecimal getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(BigDecimal capacidad) {
        this.capacidad = capacidad;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}
