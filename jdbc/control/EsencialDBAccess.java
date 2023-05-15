package control;
import com.microsoft.sqlserver.jdbc.SQLServerDataTable;
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
    
    public ArrayList<Recolector> getRecolectores(){
        ArrayList<Recolector> res = new ArrayList<Recolector>();
        try{
            PreparedStatement spGetProductorForRecolector = conexion.prepareStatement("{call dbo.SP_GetRecolectores()}");
            ResultSet rs = spGetProductorForRecolector.executeQuery(); 
            
            while (rs.next()){
                Recolector recolector = new Recolector(rs.getLong("recolectoraId"), rs.getString("nombre"));
                res.add(recolector);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return res;
    }
    
    public ArrayList<Productor> getProductores(long id){
        ArrayList<Productor> res = new ArrayList<Productor>();
        try{
            PreparedStatement spGetProductorForRecolector = conexion.prepareStatement("{call dbo.SP_GetProductorForRecolector(?)}");
            spGetProductorForRecolector.setLong(1, id);  
            ResultSet rs = spGetProductorForRecolector.executeQuery(); 
            
            while (rs.next()){
                Productor productor = new Productor(rs.getLong("contratoId"), rs.getInt("productorId"), rs.getString("descripcion"));
                res.add(productor);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return res;
    }
    
    public ArrayList<Desecho> getDesechos(long id){
        ArrayList<Desecho> res = new ArrayList<Desecho>();
        try{
            PreparedStatement spGetProductorForRecolector = conexion.prepareStatement("{call dbo.SP_GetDesechoForContrato(?)}");
            spGetProductorForRecolector.setLong(1, id);  
            ResultSet rs = spGetProductorForRecolector.executeQuery(); 
            
            while (rs.next()){
                Desecho desecho = new Desecho(rs.getInt("desechoId"), rs.getInt("tipoDesechoId"), rs.getString("nombre"));
                res.add(desecho);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return res;
    }
    
    public ArrayList<TipoRecipiente> getRecipientes(int id, int opc){
        ArrayList<TipoRecipiente> res = new ArrayList<TipoRecipiente>();
        try{
            PreparedStatement spGetProductorForRecolector = conexion.prepareStatement("{call dbo.SP_GetRecipientesForProOrRec(?, ?)}");
            spGetProductorForRecolector.setInt(1, id);  
            spGetProductorForRecolector.setInt(2, opc); 
            ResultSet rs = spGetProductorForRecolector.executeQuery(); 
            while (rs.next()){
                TipoRecipiente rec = new TipoRecipiente(rs.getInt("tipoRecId"), rs.getBigDecimal("capacidad"), rs.getString("description"), rs.getInt("cantidad"));
                res.add(rec);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return res;
    }
    
    public boolean recVsDes(int idRec, int idDes){
        try{
            PreparedStatement spGetProductorForRecolector = conexion.prepareStatement("{call dbo.SP_GetRecipientesForProOrRec(?, ?)}");
            spGetProductorForRecolector.setInt(1, idRec);  
            spGetProductorForRecolector.setInt(2, idDes); 
            ResultSet rs = spGetProductorForRecolector.executeQuery(); 
            return rs.next();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    public void moverRecTVP(ArrayList<Movimiento> carrito, Productor productor, Recolector recolector){
        try{
            SQLServerDataTable movimientos = new SQLServerDataTable();
            movimientos.addColumnMetadata("tipoRecId", java.sql.Types.INTEGER);
            movimientos.addColumnMetadata("cantidadRec", java.sql.Types.BIGINT);
            movimientos.addColumnMetadata("desechoId", java.sql.Types.INTEGER);
            movimientos.addColumnMetadata("cantidadesDes", java.sql.Types.BIGINT);
            movimientos.addColumnMetadata("checksum", java.sql.Types.VARBINARY);
            movimientos.addColumnMetadata("movementTypeId", java.sql.Types.SMALLINT);
            movimientos.addColumnMetadata("productorId", java.sql.Types.INTEGER);
            movimientos.addColumnMetadata("recolectoraId", java.sql.Types.BIGINT);
            movimientos.addColumnMetadata("direccionId", java.sql.Types.BIGINT);
            
            for(Movimiento mov:carrito){
                if(mov.getDes() == null){
                    movimientos.addRow(mov.getRec().getId(), mov.getCantidad(), 
                            null, null, new byte[]{0x00}, 2, productor.getId(), null, 1);
                }else{
                    movimientos.addRow(mov.getRec().getId(), mov.getCantidad(),  
                            mov.getDes().getId(), mov.getRec().getCapacidad().longValue() * mov.getCantidad(),
                            new byte[]{0x00}, 1, null, recolector.getId(), 1);
                }
            }
            PreparedStatement spGetProductorForRecolector = conexion.prepareStatement("{call dbo.SP_MoverRecipiente(?)}");
            spGetProductorForRecolector.setObject(1, movimientos);
            spGetProductorForRecolector.execute();
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
}
