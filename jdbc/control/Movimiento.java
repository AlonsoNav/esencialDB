package control;
public class Movimiento {
    private Desecho des;
    private TipoRecipiente rec;
    private int cantidad;

    public Movimiento(Desecho des, TipoRecipiente rec, int cantidad) {
        this.des = des;
        this.rec = rec;
        this.cantidad = cantidad;
    }

    public Desecho getDes() {
        return des;
    }

    public void setDes(Desecho des) {
        this.des = des;
    }

    public TipoRecipiente getRec() {
        return rec;
    }

    public void setRec(TipoRecipiente res) {
        this.rec = res;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}
