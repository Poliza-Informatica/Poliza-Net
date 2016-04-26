/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.recibos;

import es.redmoon.poliza.net.session.PoolConn;
import java.sql.SQLException;
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
    
    
    
}
