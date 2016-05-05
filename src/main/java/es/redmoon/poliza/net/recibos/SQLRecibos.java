/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.recibos;

import es.redmoon.poliza.net.session.PoolConn;
import static es.redmoon.poliza.net.session.PoolConn.PGconectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 * Gestión de los recibos de una póliza
 * @author antonio
 */
public class SQLRecibos extends PoolConn {
    
    private final String version;

    public SQLRecibos(String myPool) throws SQLException, NamingException {
        super(myPool);
        this.version=myPool;
    }
    
    /**
     * Leer un recibo por su ID
     * @param xIDRecibo
     * @return
     * @throws SQLException 
     */
    public TuplasRecibos getReciboByID(int xIDRecibo) throws SQLException{
        
        Connection conn = PGconectar();
        TuplasRecibos tr = null;
        
        try {
         
            // vista materializada mwpolizas_asegurado
            PreparedStatement st = conn.prepareStatement("SELECT * from recibos where id = ?");
            st.setInt(1, xIDRecibo);
            
            
            ResultSet rs = st.executeQuery();
        
            while (rs.next()) {
                
                 tr = new TuplasRecibos.
                        Builder(rs.getString("id")).
                        Id_poliza(rs.getString("id_poliza")).
                        N_recibo(rs.getString("n_recibo")).
                        Efecto(rs.getString("efecto")).
                        Vencimiento(rs.getString("vencimiento")).
                        build();
                
            }
            
        } catch (SQLException e) {

            System.out.println("recibos Connection Failed!");

        } finally {

            conn.close();
        }
        
        return tr;
    }
    
    
    /**
     * Leer una lista de recibos a través de su número de póliza ordenado por ID
     * @param xIDPoliza
     * @return
     * @throws SQLException 
     */
    public List<TuplasRecibos> getReciboByPolizaID(int xIDPoliza) throws SQLException{
        
        Connection conn = PGconectar();
        List<TuplasRecibos> tr = new ArrayList<>();
        
        try {
         
            // vista materializada mwpolizas_asegurado
            PreparedStatement st = conn.prepareStatement("SELECT * from recibos where id_poliza = ? order by id");
            st.setInt(1, xIDPoliza);
            
            
            ResultSet rs = st.executeQuery();
        
            while (rs.next()) {
                
                 tr.add( new TuplasRecibos.
                        Builder(rs.getString("id")).
                        Id_poliza(rs.getString("id_poliza")).
                        N_recibo(rs.getString("n_recibo")).
                        Efecto(rs.getString("fecha_efecto")).
                        Vencimiento(rs.getString("fecha_vencimiento")).
                        Estado_cliente(rs.getString("estado_cliente")).
                        Total_recibo(rs.getString("total_recibo")).
                        Agente(rs.getString("gestor")).
                        build()
                );
            }
            
        } catch (SQLException e) {

            System.out.println("recibos Connection Failed!");

        } finally {

            conn.close();
        }
        
        return tr;
    }
    
}
