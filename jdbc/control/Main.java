package control;

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Desecho> desechosBuscados = EsencialDBAccess.getInstance().getDesechos();
        System.out.println(desechosBuscados.isEmpty());
        for(Desecho desecho : desechosBuscados) {
                System.out.println(desecho.getNombre() + " " + desecho.getSalubridad() + " " + desecho.getTipoDesecho());
        }
    }
}
