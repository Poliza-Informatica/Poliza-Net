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
            PreparedStatement st = conn.prepareStatement("SELECT * from siniestros where id_poliza = ? order by expe_agencia desc");
            st.setInt(1, xIDPoliza);
            
            
            ResultSet rs = st.executeQuery();
        
            while (rs.next()) {
                
                 ts.add( new TuplasSiniestros.
                        Builder(rs.getString("expe_agencia")).
                        Expe_cia(rs.getString("expe_cia")).
                        Id_poliza(rs.getString("id_poliza")).
                        Fecha_hora_sini(rs.getString("fecha_hora_sini")).
                        Lugar(rs.getString("lugar")).
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
    
    /**
     * Leer una tupla de siniestro por el expediente de la Agencia
     * @param xExpe
     * @return
     * @throws SQLException 
     */
    public TuplasSiniestros getSinistroByExpeAgencia(String xExpe) throws SQLException{
        
        Connection conn = PGconectar();
        TuplasSiniestros ts = null;
        
        try {
         
            // vista materializada mwpolizas_asegurado
            PreparedStatement st = conn.prepareStatement("SELECT * from siniestros where expe_agencia = ?");
            st.setString(1, xExpe);
            
            
            ResultSet rs = st.executeQuery();
        
            while (rs.next()) {
                
                 ts= new TuplasSiniestros.
                         Builder(rs.getString("expe_agencia")).
                         Expe_cia(rs.getString("expe_cia")).
                         Id_poliza(rs.getString("id_poliza")).
                         Fecha_hora_sini(rs.getString("fecha_hora_sini")).
                         Lugar(rs.getString("lugar")).
                         Cp(rs.getString("cp")).
                         Localidad(rs.getString("localidad")).
                         Provincia(rs.getString("provincia")).
                         Situacion(rs.getString("situacion")).
                         Tipo_siniestro(rs.getString("tipo_siniestro")).
                         Tramitador(rs.getString("tramitador")).
                        build();
                
            }
            
        } catch (SQLException e) {

            System.out.println("siniestros Connection Failed!");

        } finally {

            conn.close();
        }
        
        return ts;
    }
    

    /**
     * 
     * @param buscar
     * @param NumPage
     * @param SizePage
     * @return
     * @throws SQLException 
     */
    public List<TuplasSiniestros> getTuplasBuscarSiniestros(String buscar, int NumPage, int SizePage) throws SQLException
    {
        Connection conn = PGconectar();
        List<TuplasSiniestros> ts = new ArrayList<>();
    
        //System.out.print("Buscar en getTuplasBuscarSiniestros:"+buscar);
        try {
         
            int Offset = SizePage * (NumPage-1);
            PreparedStatement st = conn.prepareStatement("SELECT * from vwsiniestros where buscar ilike ? order by expe_agencia desc LIMIT ? OFFSET ?");
            st.setString(1, "%"+buscar+"%");
            st.setInt(2, SizePage);
            st.setInt(3, Offset);
            
            
            ResultSet rs = st.executeQuery();
        
            while (rs.next()) {
                
                ts.add( new TuplasSiniestros.
                        Builder(rs.getString("expe_agencia")).
                        Expe_cia(rs.getString("expe_cia")).
                        Id_poliza(rs.getString("id_poliza")).
                        Fecha_hora_sini(rs.getString("fecha_hora_sini")).
                        Lugar(rs.getString("lugar")).
                        build()
                );
            }
            
        } catch (SQLException e) {

            System.out.println("vwsiniestros Connection Failed!");

        } finally {

            conn.close();
        }
        
        
        
        return ts;
    }
    
    
}
