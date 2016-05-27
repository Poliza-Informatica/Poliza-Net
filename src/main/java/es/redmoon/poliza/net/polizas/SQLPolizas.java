/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.polizas;

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
                        Code_cia(rs.getString("code_cia")).
                        Poliza(rs.getString("poliza")).
                        Documento_adhesion(rs.getString("documento_adhesion")).
                        Efecto(rs.getString("efecto")).
                        Vencimiento(rs.getString("vencimiento")).
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
                        Code_cia(rs.getString("code_cia")).
                        Poliza(rs.getString("poliza")).
                        Documento_adhesion(rs.getString("documento_adhesion")).
                        Efecto(rs.getString("efecto")).
                        Vencimiento(rs.getString("vencimiento")).
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
     * Leer una tupla de la vista materializada mwpolizas_asegurado por su ID
     * @param xIDPoliza
     * @return
     * @throws SQLException 
     */
    public TuplasPolizasMV getTuplaByIDFromMVpolizas_asegurado(int xIDPoliza) throws SQLException
    {
        Connection conn = PGconectar();
        TuplasPolizasMV tp = null;
        
        try {
         
            // vista materializada mwpolizas_asegurado
            PreparedStatement st = conn.prepareStatement("SELECT * from mwpolizas_asegurado where id = ?");
            st.setInt(1, xIDPoliza);
            
            
            ResultSet rs = st.executeQuery();
        
            while (rs.next()) {
                
                tp = new TuplasPolizasMV.
                        Builder(rs.getString("id")).
                        Nombre(rs.getString("nombre")).
                        Poliza(rs.getString("poliza")).
                        Nif(rs.getString("nif")).
                        Efecto(rs.getString("efecto")).
                        Vencimiento(rs.getString("vencimiento")).
                        Cia_code(rs.getString("cia_code")).
                        Cia_name(rs.getString("cia_name")).
                        En_calidad_de(rs.getString("en_calidad_de")).
                        Riesgo_asegurado(rs.getString("riesgo_asegurado")).
                        Email(rs.getString("email")).
                        Tlf1(rs.getString("tlf1")).
                        Iban(rs.getString("iban")).
                        build();
                
            }
            
        } catch (SQLException e) {

            System.out.println("polizas Connection Failed!");

        } finally {

            conn.close();
        }
        
        return tp;
    }
    /**
     * Búsquedas por la cadena buscar, que es la suma de varios campos de datos
     * @param riesgo
     * @param NumPage
     * @param SizePage
     * @return
     * @throws SQLException 
     */
    public List<TuplasPolizasBuscar> getTuplasPolizasByBuscar(String buscar, int NumPage, int SizePage) throws SQLException
    {
        Connection conn = PGconectar();
        List<TuplasPolizasBuscar> tp = new ArrayList<>();
        
        try {
         
            int Offset = SizePage * (NumPage-1);
            PreparedStatement st = conn.prepareStatement("SELECT * from mwpolizas_asegurado where buscar ilike ? order by id desc LIMIT ? OFFSET ?");
            st.setString(1, "%"+buscar+"%");
            st.setInt(2, SizePage);
            st.setInt(3, Offset);
            
            
            ResultSet rs = st.executeQuery();
        
            while (rs.next()) {
                
                tp.add( new TuplasPolizasBuscar.
                        Builder(rs.getString("id")).
                        Nif(rs.getString("nif")).
                        Nombre(rs.getString("nombre")).
                        Poliza(rs.getString("poliza")).
                        Efecto(rs.getString("efecto")).
                        Riesgo_asegurado(rs.getString("riesgo_asegurado")).
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
     * Buscar las pólizas de un nif
     * @param nif
     * @param NumPage
     * @param SizePage
     * @return
     * @throws SQLException 
     */
    public List<TuplasPolizasBuscar> getTuplasPolizasByNIF(String nif, int NumPage, int SizePage) throws SQLException
    {
        Connection conn = PGconectar();
        List<TuplasPolizasBuscar> tp = new ArrayList<>();
        
        try {
         
            int Offset = SizePage * (NumPage-1);
            PreparedStatement st = conn.prepareStatement("SELECT * from mwpolizas_asegurado where nif = ? order by id desc LIMIT ? OFFSET ?");
            st.setString(1, nif);
            st.setInt(2, SizePage);
            st.setInt(3, Offset);
            
            
            ResultSet rs = st.executeQuery();
        
            while (rs.next()) {
                
                tp.add( new TuplasPolizasBuscar.
                        Builder(rs.getString("id")).
                        Nif(rs.getString("nif")).
                        Nombre(rs.getString("nombre")).
                        Poliza(rs.getString("poliza")).
                        Efecto(rs.getString("efecto")).
                        Riesgo_asegurado(rs.getString("riesgo_asegurado")).
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
     * 
     * @param xYear
     * @return
     * @throws SQLException 
     */
    public List<TuplasProduccionByNumeroVentas> getProduccionByNumeroVentas(String xYear) throws SQLException {
        
        Connection conn = PGconectar();
        List<TuplasProduccionByNumeroVentas> tp = new ArrayList<>();
        
        try {
         
            
            PreparedStatement st = conn.prepareStatement("select extract(MONTH from date(efecto)) as mes, count(*) as unidades from mwpolizas_asegurado where extract(ISOYEAR from date(efecto)) = ? group by mes order by mes");
            
            st.setInt(1, Integer.parseInt(xYear));
            
            ResultSet rs = st.executeQuery();
        
            while (rs.next()) {
                
                tp.add( new TuplasProduccionByNumeroVentas.
                        Builder(rs.getString("mes")).
                        Unidades(rs.getString("unidades")).
                        build()
                         );
            }
            
        } catch (SQLException e) {

            System.out.println("mwpolizas_asegurado Connection Failed!");

        } finally {

            conn.close();
        }
        
        return tp;
    }
}
