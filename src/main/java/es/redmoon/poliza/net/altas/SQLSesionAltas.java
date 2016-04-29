
package es.redmoon.poliza.net.altas;

import static es.redmoon.poliza.net.altas.PoolConnAltas.PGconectar;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.Security;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import org.apache.commons.codec.binary.Hex;
import org.bouncycastle.jce.provider.BouncyCastleProvider;


/**
 *
 * @author antonio
 */
public class SQLSesionAltas extends PoolConnAltas {
    
    
    private String xMail;
    private String ip;
    private String databasename;
    private String passdatabase;
    private String descargo_token;
    private String mode_access;
    private String CADataBaseName; // nombre de la base de datos campo AutoridadCA
    private byte[] certificado;
    
    

    public SQLSesionAltas() throws SQLException, NamingException {
        super();
    }

    /**
     * Control del modo de acceso
     * En la tabla AutoridadCA guardamos un campo denominado mode_access que puede tomar
     * dos valores single para configuraciones de un una sola base de datos
     * shared para un servidor de múltiples bases de datos
     * @throws SQLException 
     */
    public void ModeAccess() throws SQLException
    {
        PreparedStatement st =null;
        Connection conn = PGconectar();
        
        try 
        {
            
          st = conn.prepareStatement("select mode_access,databasename from AutoridadCA where id=1");
          
            
           ResultSet rs = st.executeQuery();
           if (rs.next()) {
               this.mode_access=rs.getString("mode_access");
               this.CADataBaseName=rs.getString("databasename");
           }
           
        }
        catch (SQLException e) {
            System.out.println("AutoridadCA Connection Failed!");
        }
        finally {
            st.close();
           conn.close();
        }
    }
    
    /**
     * Comprobar el acceso del usuario a través de la tabla de usuarios
     * @param xUser
     * @return
     * @throws SQLException
     * @throws NamingException 
     */
    public boolean CheckLogin(String xUser, String xPass, byte[] token) 
            throws SQLException, NamingException, NoSuchAlgorithmException, NoSuchProviderException
    {
        Connection conn = PGconectar();
        
        Security.addProvider(new BouncyCastleProvider());
        
        MessageDigest mda = MessageDigest.getInstance("SHA-512", "BC");
        byte [] digesta = mda.digest(token);

        //System.out.println(digesta);
        char[] sha512 = Hex.encodeHex(digesta);
        //System.out.println(Hex.encodeHex(digesta));

        try {
            
          PreparedStatement st = 
          conn.prepareStatement("SELECT ip,databasename,encode(digest(certificado, 'sha512'), 'hex') as cert from customers_users where mail=?");
          st.setString(1, xUser.trim());
            
            ResultSet rs = st.executeQuery();

                if (rs.next()) {

                    this.xMail=xUser;
                    this.ip=rs.getString("ip");
                    this.databasename=rs.getString("databasename");
                    this.passdatabase=rs.getString("cert");
                    
               
                    // coincide el hash del token con el de customers_user
                    if (sha512.equals(this.passdatabase))
                    {
                        // si coincide
                        System.out.println("OK login:"+xUser);
                    }
                    else
                    {
                        // no coincide
                        //System.err.println("Error en login usuario sql session:"+xUser);
                        conn.close();
                        AccionesErrorLogin();
                        return false;
                    }

                    //MessageDigest.isEqual(digesta, digestb)

                }
                else
                {
                    //System.err.println("Error en login usuario sql session:"+xUser);
                    conn.close();
                    AccionesErrorLogin();
                    return false;
                }
                   
           rs.close();
        }
        catch (SQLException e) {
            System.out.println("customers_users Connection Failed!");
            conn.close();
            return false;
        }
        finally{
            conn.close();
        }
        
        return true;
    }
    
    /**
     * 
     * @param xUser
     * @param token
     * @return
     * @throws SQLException
     * @throws NamingException
     * @throws NoSuchAlgorithmException
     * @throws NoSuchProviderException 
     */
    public boolean CheckLogin(String xUser, byte[] token) 
            throws SQLException, NamingException, NoSuchAlgorithmException, NoSuchProviderException
    {
        Connection conn = PGconectar();
        
        Security.addProvider(new BouncyCastleProvider());
        
        MessageDigest mda = MessageDigest.getInstance("SHA-512", "BC");
        byte [] digesta = mda.digest(token);

        //System.out.println(digesta);
        String sha512 = Hex.encodeHexString(digesta);
        //System.out.println(Hex.encodeHex(digesta));

        try {
            
          PreparedStatement st = 
          conn.prepareStatement("SELECT ip,databasename,encode(digest(certificado, 'sha512'), 'hex') as cert from customers_users where mail=?");
          st.setString(1, xUser.trim());
            
            ResultSet rs = st.executeQuery();

                if (rs.next()) {

                    this.xMail=xUser;
                    this.ip=rs.getString("ip");
                    this.databasename=rs.getString("databasename");
                    this.passdatabase=rs.getString("cert");
               
                    // coincide el hash del token con el de customers_user
                    if (sha512.equals(this.passdatabase))
                    {
                        // si coincide
                        System.out.println("OK login:"+xUser);
                    }
                    else
                    {
                        // no coincide
                        System.err.println("Error en login usuario sql session:"+xUser);
                        System.err.println("Pass Token:"+sha512);
                        System.err.println("Pass DataB:"+this.passdatabase);
                        conn.close();
                        AccionesErrorLogin();
                        return false;
                    }

                    //MessageDigest.isEqual(digesta, digestb)

                }
                else
                {
                    //System.err.println("Error en login usuario sql session:"+xUser);
                    conn.close();
                    AccionesErrorLogin();
                    return false;
                }
                   
           rs.close();
        }
        catch (SQLException e) {
            System.out.println("customers_users Connection Failed!");
            conn.close();
            return false;
        }
        finally{
            conn.close();
        }
        
        return true;
    }
    
    /**
     * 
     * @param xUser
     * @param token
     * @return
     * @throws SQLException
     * @throws NamingException
     * @throws NoSuchAlgorithmException
     * @throws NoSuchProviderException 
     */
    public boolean CheckLoginCert(String varOU, String SerialNumber) 
            throws SQLException, NamingException
    {

        try (Connection conn = PGconectar()) {
            
          PreparedStatement st = 
          conn.prepareStatement("SELECT mail,ip,databasename,encode(digest(certificado, 'sha512'), 'hex') as cert from customers_users where certdatabase=?");
          st.setString(1, "jdbc/"+varOU);
            
            ResultSet rs = st.executeQuery();

                if (rs.next()) {

                    this.xMail=rs.getString("mail");
                    this.ip=rs.getString("ip");
                    this.databasename=rs.getString("databasename");
                    this.passdatabase=rs.getString("cert");

                }
                else
                {
                    //System.err.println("Error en login usuario sql session:"+xUser);
                    conn.close();
                    AccionesErrorLogin();
                    return false;
                }
                   
           rs.close();
           conn.close();
        }
        catch (SQLException e) {
            System.out.println("customers_users Connection Failed!.CheckLoginCert");
            return false;
        }
        
        return true;
    }
    
    /**
     * Login con solo la dirección de correo electrónico identidad federada
     * con Google+, para el alta en el servicio
     * @param xUser
     * @return
     * @throws SQLException
     * @throws NamingException
     * @throws NoSuchAlgorithmException
     * @throws NoSuchProviderException 
     */
    public boolean CheckMailExit(String xUser) 
            throws SQLException, NamingException
    {
             

        try (Connection conn = PGconectar()) {
            
          PreparedStatement st = 
          conn.prepareStatement("SELECT ip,databasename,descargo_token,certificado,encode(digest(certificado, 'sha512'), 'hex') as cert from customers_users where mail=?");
          st.setString(1, xUser.trim());
          
            try (ResultSet rs = st.executeQuery()) {

                if (rs.next()) {

                    this.xMail=xUser;
                    this.ip=rs.getString("ip");
                    this.databasename=rs.getString("databasename");
                    this.passdatabase=rs.getString("cert");
                    this.descargo_token=rs.getString("descargo_token");
                    this.certificado=rs.getBytes("certificado");
                    rs.close();
                    conn.close();

                }
        
                else
                {
                    //System.err.println("Error en login usuario sql session:"+xUser);
                    conn.close();
                    return false;
                }
            }
        }
        catch (SQLException e) {
            System.out.println("customers_users Connection Failed!");
            return false;
        }
        
        return true;
    }
    
    /**
     * 
     */
    private void AccionesErrorLogin()
    {
        // Realizar acciones despues de un fallo de login
    }

    public String getxMail() {
        return xMail.trim();
    }

    public String getIp() {
        return ip.trim();
    }

    public String getDatabasename() {
        return databasename.trim();
    }

    public String getPassdatabase() {
        return passdatabase;
    }

    public String getDescargo_token() {
        return descargo_token;
    }

    public byte[] getCertificado() {
        return certificado;
    }

    public String getMode_access() {
        return mode_access;
    }

    public String getCADataBaseName() {
        return CADataBaseName;
    }
    
    

    
    /**
     * Guardar los datos de acceso en la tabla LogSesion
     * @param IP
     * @param HostName
     * @param URI
     * @throws SQLException 
     */
    public void LogSesion(String IP, String HostName, String URI, String mail) throws SQLException
    {
        PreparedStatement st =null;
        Connection conn = PGconectar();
        
        try 
        {
            
          st = conn.prepareStatement("INSERT INTO LogSesion (IP,HOSTNAME,URI, mail) VALUES (?,?,?,?)");
          st.setString(1, IP.trim());
          st.setString(2, HostName.trim());
          st.setString(3, URI.trim());
          st.setString(4, mail.trim());
            
           st.execute();
           
        }
        catch (SQLException e) {
            System.out.println("LogSesion Connection Failed!");
        }
        finally {
            st.close();
           conn.close();
        }
        
        
    }
    

    /**
     * Activar la cuenta de usuario tras verificar repuesta a nuestro mail
     * de bienvenida
     * @param url_wellcome
     * @throws SQLException 
     */
    public boolean verifyMail(String url_wellcome) throws SQLException
    {
        Connection conn = PGconectar();
        
        boolean resultado=false;
        try {
            
            
            // cambiar por un procedimiento almacenado *****************
            
          PreparedStatement st = 
          conn.prepareStatement("Update customers_users Set estado='activa' where url_wellcome=? and estado='pendiente verificacion mail' ");
          st.setString(1, url_wellcome.trim());
            
            ResultSet rs = st.executeQuery();

                if (rs.next()) {

                    // verificado
                    // además tiene que cambiar el estado a verificado el mail cuenta activa
                    resultado=true;

                }
                   
           rs.close();
        }
        catch (SQLException e) {
            System.out.println("Update customers_users Connection Failed!");
        }
        finally{
            conn.close();
        }
        
        return resultado;
    }
    
}
