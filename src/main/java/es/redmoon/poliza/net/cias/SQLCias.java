
package es.redmoon.poliza.net.cias;

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
 *
 * @author antonio
 */
public class SQLCias extends PoolConn {
    private final String version;

    /**
     * Constructor de la clase de compañías
     * @param myPool
     * @throws SQLException
     * @throws NamingException 
     */
    public SQLCias(String myPool) throws SQLException, NamingException {
        super(myPool);
        this.version = myPool;
    }
    
    
    /**
     * Crea una lista de compañías para un des plegable de selección
     * @return
     * @throws SQLException 
     */
    public List<TuplasCias> getListaCias() throws SQLException {
        
        Connection conn = PGconectar();
        List<TuplasCias> tp = new ArrayList<>();
        
        try {
         

            PreparedStatement st = conn.prepareStatement("SELECT * from cias");
            
            ResultSet rs = st.executeQuery();
        
            // Añadir una tupla con todas las Cías
            tp.add( new TuplasCias.
                        Builder("00").
                        Name_cia("Todas las Cías").
                        build()
                         );
            
            while (rs.next()) {
                
                tp.add( new TuplasCias.
                        Builder(rs.getString("code")).
                        Name_cia(rs.getString("nombre")).
                        build()
                         );
            }
            
        } catch (SQLException e) {

            System.out.println("Cías Connection Failed!");

        } finally {

            conn.close();
        }
        
        return tp;
    }
    
}
