/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package qwery_polizas;

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
 * Consultas de pólizas por varios criterios
 * 
 * @author antonio
 */
public class SQLPolizas extends PoolConn {

    private final String version;
    
    public SQLPolizas(String myPool) throws SQLException, NamingException {
        super(myPool);
        this.version=myPool;
    }
    
    /**
     * Lista de pólizas ordenadas por ID
     * @param NumPage
     * @param SizePage
     */
    public List<TuplasPolizas> getTuplasPolizas(int NumPage, int SizePage) throws SQLException
    {
        Connection conn = PGconectar();
        List<TuplasPolizas> tp = new ArrayList<>();
        
        try {
         
            int Offset = SizePage * (NumPage-1);
            PreparedStatement st = conn.prepareStatement("SELECT * from polizas order by id desc LIMIT ? OFFSET ?");
            st.setInt(1, SizePage);
            st.setInt(2, Offset);
            
            ResultSet rs = st.executeQuery();
        
            while (rs.next()) {
                
                tp.add( new TuplasPolizas.
                        Builder(rs.getString("id")).
                        Id_solicitud(rs.getString("id_solicitud")).
                        Poliza(rs.getString("poliza")).
                        Documento_adhesion(rs.getString("documento_adhesion")).
                        Efecto(rs.getString("efecto")).
                        Vencimiento(rs.getString("vencimiento")).
                        Compania(rs.getString("compania")).
                        Producto(rs.getString("producto")).
                        Riesgo_asegurado(rs.getString("riesgo_asegurado")).
                        Forma_pago(rs.getString("forma_pago")).
                        Canal_pago(rs.getString("canal_pago")).
                        Iban(rs.getString("iban")).
                        Gestor(rs.getString("gestor")).
                        Mediador1(rs.getString("mediador1")).
                        Mediador2(rs.getString("mediador2")).
                        Cobrador(rs.getString("cobrador")).
                        Comercial(rs.getString("comercial")).
                        build()
                         );
            }
            
        } catch (SQLException e) {

            System.out.println("polizas Connection Failed!");

        } finally {

            conn.close();
        }
        
        return tp;
    }
    
    /**
     * Búsquedas por riesgo asegurado
     * @param riesgo
     * @param NumPage
     * @param SizePage
     * @return
     * @throws SQLException 
     */
    public List<TuplasPolizas> getTuplasPolizasByRiesgo(String riesgo, int NumPage, int SizePage) throws SQLException
    {
        Connection conn = PGconectar();
        List<TuplasPolizas> tp = new ArrayList<>();
        
        try {
         
            int Offset = SizePage * (NumPage-1);
            PreparedStatement st = conn.prepareStatement("SELECT * from polizas where riesgo_asegurado ilike ? order by id desc LIMIT ? OFFSET ?");
            st.setString(1, "%"+riesgo+"%");
            st.setInt(2, SizePage);
            st.setInt(3, Offset);
            
            
            ResultSet rs = st.executeQuery();
        
            while (rs.next()) {
                
                tp.add( new TuplasPolizas.
                        Builder(rs.getString("id")).
                        Id_solicitud(rs.getString("id_solicitud")).
                        Poliza(rs.getString("poliza")).
                        Documento_adhesion(rs.getString("documento_adhesion")).
                        Efecto(rs.getString("efecto")).
                        Vencimiento(rs.getString("vencimiento")).
                        Compania(rs.getString("compania")).
                        Producto(rs.getString("producto")).
                        Riesgo_asegurado(rs.getString("riesgo_asegurado")).
                        Forma_pago(rs.getString("forma_pago")).
                        Canal_pago(rs.getString("canal_pago")).
                        Iban(rs.getString("iban")).
                        Gestor(rs.getString("gestor")).
                        Mediador1(rs.getString("mediador1")).
                        Mediador2(rs.getString("mediador2")).
                        Cobrador(rs.getString("cobrador")).
                        Comercial(rs.getString("comercial")).
                        build()
                         );
            }
            
        } catch (SQLException e) {

            System.out.println("polizas Connection Failed!");

        } finally {

            conn.close();
        }
        
        return tp;
    }
}
