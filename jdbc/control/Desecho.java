package control;
import java.math.BigDecimal;

public class Desecho {
    private int id;
    private int tipoDesecho;
    private String name;

    public Desecho(int id, int tipoDesecho, String name) {
        this.id = id;
        this.tipoDesecho = tipoDesecho;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTipoDesecho() {
        return tipoDesecho;
    }

    public void setTipoDesecho(int tipoDesecho) {
        this.tipoDesecho = tipoDesecho;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}
