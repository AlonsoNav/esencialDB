package control;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class EsencialDBAccess implements IDataConstants{
    private static EsencialDBAccess instance;
    private Connection conexion;
    
    private EsencialDBAccess(){
        try{
            conexion = DriverManager.getConnection(CONN_STRING);
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
    public synchronized static EsencialDBAccess getInstance() {
        if (instance==null) {
            instance = new EsencialDBAccess();
        }
        return instance;
    }
    
    public ArrayList<Desecho> getDesechos(){
        ArrayList<Desecho> res = new ArrayList<Desecho>();
        try{
            Statement stmt = conexion.createStatement();
            String SQL = "SELECT * FROM desechos";
            ResultSet rs = stmt.executeQuery(SQL);
            
            while (rs.next()){
                Desecho desecho = new Desecho();
                desecho.setNombre(rs.getString("nombre"));
                desecho.setSalubridad(rs.getBigDecimal("salubridad"));
                desecho.setTipoDesecho(rs.getInt("tipoDesechoId"));
                res.add(desecho);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return res;
    }
}
