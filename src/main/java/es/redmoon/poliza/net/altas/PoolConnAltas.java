/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.altas;

/**
 *
 * @author antonio
 */
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;
//import org.checkthread.annotations.ThreadSafe;

/**
 * conecta con la base de datos de configuración y control de acceso
 * @author antonio
 */
//@ThreadSafe
public abstract class PoolConnAltas {
    
    private static DataSource datasource;
    //protected Connection connection;
    
    public PoolConnAltas() throws SQLException, NamingException {
        
            Context ctx = new javax.naming.InitialContext();

            // 	 jdbc/myEmpresa001
            datasource = (DataSource) ctx.lookup("jdbc/myPNSystemConfig");

    }
    
    /**
     * entregar una conexión a PostgreSQL desde el Pool de Glassfish
     * @return una conexión JDBC a PostgreSQL 9.5
     * @throws SQLException
     */
    public static Connection PGconectar() throws SQLException
    {

            Connection connection = null;

            synchronized (datasource) {
			connection = datasource.getConnection();
			}
            
            if (connection == null) {
                System.out.println("no se obtuvo la conexion");
            }
            
        return connection;
    }
    
}

