/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.siniestros;

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
 * Sentencias SQL para la tabla de siniestros y su seguimiento
 * @author antonio
 */
public class SQLSiniestros extends PoolConn {
    private final String version;

    public SQLSiniestros(String myPool) throws SQLException, NamingException {
        super(myPool);
        this.version = myPool;
    }

    /**
     * Lista de siniestros de una póliza
     * @param xIDPoliza
     * @return
     * @throws SQLException 
     */
    public List<TuplasSiniestros> getSinistroByPolizaID(int xIDPoliza) throws SQLException{
        
        Connection conn = PGconectar();
        List<TuplasSiniestros> ts = new ArrayList<>();
        
        try {
         
            // vista materializada mwpolizas_asegurado
            PreparedStatement st = conn.prepareStatement("SELECT * from siniestros where id_poliza = ? order by id");
            st.setInt(1, xIDPoliza);
            
            
            ResultSet rs = st.executeQuery();
        
            while (rs.next()) {
                
                 ts.add( new TuplasSiniestros.
                        Builder(rs.getString("id")).
                        Id_poliza(rs.getString("id_poliza")).
                        
                        build()
                );
            }
            
        } catch (SQLException e) {

            System.out.println("siniestros Connection Failed!");

        } finally {

            conn.close();
        }
        
        return ts;
    }
    
}
