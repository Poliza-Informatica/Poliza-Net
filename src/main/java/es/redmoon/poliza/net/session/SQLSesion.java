/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.session;

import static es.redmoon.poliza.net.session.PoolConn.PGconectar;
import es.redmoon.poliza.net.datosper.SQLDatosPer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Locale;
import javax.naming.NamingException;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Soporte para crear el objeto de sesión
 * @author antonio
 */
public class SQLSesion extends PoolConn {
    
    private final String version;
    private int xIDUser;
    private String xUser;
    private String NIF;
    private String RazonSocial;
    private String NIFUser;
    private String NombreUsuario;
    private String UserTipo;
    private String FormaJuridica;
    private String TipoBalance="Abreviado";
    private String year_fiscal;
    private String periodo;
    private String Database;
    private String NumeroMaxUsuarios;
    private String Fecha;
    private String Hoy;
    private String DiasFinPeriodo;
    private String DiasFinYear;
    private String myCertHash;
    private byte[] myCertificado;
    private int tipo_de_cuenta;
    private int NumeroDeRecibos;
    
    private String permisos;
    private Locale myLocale;
    
    // Servicios disponibles
    private String Facturacion="yes"; // yes o premium
    private String Contabilidad="no"; // yes o no
    private String Nominas="no";
    private String NominasApp="no";
    private String Burofax="no";
    private String Impuestos="no";
    private String Firma="no";
    private String Almacenamiento="no";
    private String Indexacion="no";
    private String myHD="yes";
    private String Asesor="no"; // yes, fiscal, laboral, jurídico
    private String LimiteUsuarios="1";
    private String DocumentoIngreso="factura"; // factura, iguala, cuota.
    private String EmiteRemesas="NO";
    private String Presupuestos="NO";
    
    //Terceros
    private int xIDTercero;
    private String xMailTercero;

    public SQLSesion(String DataBase) throws SQLException, NamingException {
        
        super(DataBase);
        this.version=DataBase;
    }

 

      
    /**
     * Comprobar el acceso del usuario a través de la tabla de usuarios
     * @param xUser
     * @return
     * @throws SQLException
     * @throws NamingException 
     */
    public boolean MakeSesionGooglePlus(String xUser) throws SQLException, NamingException
    {
        Connection conn = PGconectar();
        
        try {
            //System.err.println("Error en login usuario:"+xUser);
            PreparedStatement st = conn.prepareStatement("SELECT id,permisos,email,nif,nombre,tipo,certificado,encode(digest(certificado, 'sha512'), 'hex') as CertHash from PersonalRRHH where email=?");
            st.setString(1, xUser.trim());
            //st.setString(2, xPass);
            
            ResultSet rs = st.executeQuery();

                if (rs.next()) {
                    this.xIDUser = rs.getInt("id");
                    this.xUser=rs.getString("email");                   
                    this.NIFUser=rs.getString("nif");
                    this.NombreUsuario=rs.getString("nombre");
                    this.UserTipo=rs.getString("tipo");
                    this.myCertificado=rs.getBytes("certificado");
                    this.myCertHash=rs.getString("certhash");
                    this.permisos=(StringUtils.isEmpty(rs.getString("permisos"))) ? "{\"panel\":\"yes\",\"clientes\":\"yes\",\"ventas\":\"yes\",\"proveedores\":\"yes\",\"compras\":\"yes\",\"nominas\":\"no\",\"bancos\":\"no\",\"contabilidad\":\"no\"}": rs.getString("permisos");
                    
                    // Parte de las variables de sesión de la tabla DatosPer
                    SetSessionVar();
                    
                    // Leer la lista de servicios contratados
                    // Este id no será, sino el de la tabla de Redmoon en la base
                    // de datos de control de acceso a clientes.
                    //getServicios(rs.getInt("id"));

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
            System.out.println("SELECT * from PersonalRRHH Connection Failed!.MakeSesionGooglePlus");
            conn.close();
            return false;
        }
        finally{
            conn.close();
        }
        
        return true;
    }
    
    /**
     * Hacer login en la aplicación mediante el email y la password de la BBDD
     * @param xUser
     * @param xPass
     * @return
     * @throws SQLException
     * @throws NamingException 
     */
    public boolean CheckLogin(String xUser, String xPass) throws SQLException, NamingException
    {
        
        try (Connection conn = PGconectar()) {
            //System.err.println("Error en login usuario:"+xUser);
            // "SELECT email,nif,nombre,tipo,certificado from PersonalRRHH where email=? and encode(digest(certificado, 'sha512'), 'hex')=?"
            PreparedStatement st = conn.prepareStatement("SELECT id,permisos,email,nif,nombre,tipo,certificado from PersonalRRHH where email=?");
            st.setString(1, xUser.trim());
            //st.setString(2, xPass);
            
            ResultSet rs = st.executeQuery();

                if (rs.next()) {
                    this.xIDUser = rs.getInt("id");
                    this.xUser=rs.getString("email");                   
                    this.NIFUser=rs.getString("nif");
                    this.NombreUsuario=rs.getString("nombre");
                    this.UserTipo=rs.getString("tipo");
                    this.myCertificado=rs.getBytes("certificado");
                    this.myCertHash=xPass;
                    this.permisos=(StringUtils.isEmpty(rs.getString("permisos"))) ? "{\"panel\":\"yes\",\"clientes\":\"yes\",\"ventas\":\"yes\",\"proveedores\":\"yes\",\"compras\":\"yes\",\"nominas\":\"no\",\"bancos\":\"no\",\"contabilidad\":\"no\"}": rs.getString("permisos");
                    
                    // Parte de las variables de sesión de la tabla DatosPer
                    SetSessionVar();
                    rs.close();
                    conn.close();
                }
                else
                {
                    //System.err.println("Error en login usuario sql session:"+xUser);
                    rs.close();
                    conn.close();
                    AccionesErrorLogin();
                    return false;
                }
        
           
           
        }
        catch (SQLException e) {
            System.out.println("SELECT * from PersonalRRHH Connection Failed!.CheckLogin");
            return false;
        }
        
        return true;
    }
    
    /**
     * Log de sesión de terceros (sesión de clientes de nuestros clientes)
     * @param IP
     * @param HostName
     * @param URI
     * @param mail
     * @throws SQLException 
     */
     public void LogSesionTerceros(String IP, String HostName, String URI, String mail) throws SQLException
    {
        Connection conn = PGconectar();
        try {
            
          PreparedStatement st = 
          conn.prepareStatement("INSERT INTO LogSesionTerceros (IP,HOSTNAME,URI, mail) VALUES (?,?,?,?)");
          st.setString(1, IP.trim());
          st.setString(2, HostName.trim());
          st.setString(3, URI.trim());
          st.setString(4, mail.trim());
            
           st.execute();
                   
           st.close();
           
        }
        catch (SQLException e) {
            System.out.println("LogSesionTerceros Connection Failed!");
        }
        finally{
            conn.close();
        }
        
        
    }
     
     /**
      * Comprobar que el tercero es un cliente de clientes
      * @param xUser
      * @return
      * @throws SQLException
      * @throws NamingException 
      */
   public int CheckMailGoogleTerceros(String xUser) 
            throws SQLException, NamingException
    {
        Connection conn = PGconectar();
             
        
        try {
            
          PreparedStatement st = 
          conn.prepareStatement("SELECT id,mail from customers where mail=?");
          st.setString(1, xUser.trim());
            
            ResultSet rs = st.executeQuery();

                if (rs.next()) {
                    
                   this.xIDTercero = rs.getInt("id");
                   this.xMailTercero = rs.getString("mail");

                }
        
                else
                {
                    //System.err.println("Error en login usuario sql session:"+xUser);
                    conn.close();
                    return -1;
                }
                   
           rs.close();
        }
        catch (SQLException e) {
            System.out.println("customers Connection Failed!");
            conn.close();
            return -1;
        }
        finally{
            conn.close();
        }
        
        return this.xIDTercero;
    }
    
    /**
     * Refrescar los valores de sesión después de un cambio de datos en la tabla
     * DatosPer, cambiando el NIF y por lo tanto la forma jurídica.
     * 
     * @param xUser
     * @return
     * @throws SQLException
     * @throws NamingException 
     */
    public boolean RefreshSesionVars(String xUser) throws SQLException, NamingException
    {
        Connection conn = PGconectar();
        
        try {

            PreparedStatement st = conn.prepareStatement("SELECT email,nif,nombre,tipo,certificado from PersonalRRHH where email=?");
            st.setString(1, xUser.trim());
            
            ResultSet rs = st.executeQuery();

                if (rs.next()) {
                    
                    this.NIFUser=rs.getString("nif");
                    this.NombreUsuario=rs.getString("nombre");
                    this.UserTipo=rs.getString("tipo");
                    this.myCertificado=rs.getBytes("certificado");
                    
                    // Parte de las variables de sesión de la tabla DatosPer
                    SetSessionVar();
                    
                }
           
           rs.close();
        }
        catch (SQLException e) {
            System.out.println("SELECT * from PersonalRRHH Connection Failed!. RefreshSesionVars");
            conn.close();
            return false;
        }
        finally{
            conn.close();
        }
        
        return true;
    }
    
    /**
     * Establece las variables de sesión de la aplicación de facturación
     * @throws SQLException
     * @throws NamingException 
     */
    private void SetSessionVar() throws SQLException, NamingException
    {
        // Establecer las variables de sesión
        // Lee los datos desde DatosPer
        SQLDatosPer mySQLDatosPer = new SQLDatosPer(version);
        
        this.NIF = mySQLDatosPer.getNif();
        this.RazonSocial=mySQLDatosPer.getNombre();
        this.FormaJuridica=mySQLDatosPer.getForma_juridica();
        this.year_fiscal=mySQLDatosPer.getFiscal_year();
        this.periodo=mySQLDatosPer.getPerido();
        this.EmiteRemesas=mySQLDatosPer.getEmiteRemesas();
        this.NumeroDeRecibos=mySQLDatosPer.getPeriodicidad_er();
        this.Presupuestos=mySQLDatosPer.getPresupuestos();
        this.myLocale=mySQLDatosPer.getMyLocale();
        
        if (this.FormaJuridica.equals("Comunidades de propietarios"))
        {
            this.DocumentoIngreso="cuota";
            this.Presupuestos="SI";
        }
        
        if (this.FormaJuridica.equals("SA"))
        {
            this.TipoBalance="Normal";
        }
        
        // con este datos nos vamos a la tabla PoliticaCuentas        
        this.tipo_de_cuenta=mySQLDatosPer.getTipo_de_cuenta();
        
        // el tipo de cuenta 4 Atún Advisor
        if (this.tipo_de_cuenta==4)
        {
            this.Asesor="yes";
            this.DocumentoIngreso="iguala";
        }
            
        // y leemos la variable JSON servicios autorizados 
        getServicios();
        
        // this.Database=null; de la parte de criptografía
        // this.NumeroMaxUsuarios=null; de la parte de criptografía
        
        this.Fecha=mySQLDatosPer.getFecha();
        this.Hoy=Integer.toString(mySQLDatosPer.getDoy());
        this.DiasFinPeriodo=  Integer.toString(mySQLDatosPer.getDiasPeriodo());
        this.DiasFinYear = Integer.toString(mySQLDatosPer.getDiasEndYear());
        
        mySQLDatosPer = null;
    }
    
    private void AccionesErrorLogin()
    {
        // Realizar acciones despues de un fallo de login
    }
    
    /**
     * Leer la lista de servicios autorizados para el cliente
     * @param xIDUser
     * @throws SQLException 
     */
    private void getServicios() throws SQLException
    {
        Connection conn = PGconectar();
        String servicios;
        
        try {

            PreparedStatement st = conn.prepareStatement("SELECT * from PoliticaCuentas where id=?");
            st.setInt(1, this.tipo_de_cuenta);
            
            ResultSet rs = st.executeQuery();

                if (rs.next()) {
                    
                    servicios=rs.getString("servicios");
                                       
                    JSONObject jsonObject = null;
                    
                    // 
                    try {
                     jsonObject = (JSONObject) new JSONParser().parse(servicios);
                    } catch (ParseException e) {
                     throw new RuntimeException("Unable to parse json " + servicios);
                    }

                    /*
                     * '{   "Contabilidad": "no", 
                            "Impuestos": "yes",
                            "Nominas": "yes",
                            "NominasApp": "no",
                            "Firma": "yes",
                            "Burofax":  "yes",
                            "Almacenamiento": "no",
                            "Indexacion":  "no",
                            "LimiteUsuarios": "1"
                        }'::json
                     */
                    Contabilidad = (String) jsonObject.get("Contabilidad");
                    Impuestos = (String) jsonObject.get("Impuestos");
                    Nominas = (String) jsonObject.get("Nominas");
                    NominasApp = (String) jsonObject.get("NominasApp");
                    Firma = (String) jsonObject.get("Firma");
                    Burofax = (String) jsonObject.get("Burofax");
                    Almacenamiento = (String) jsonObject.get("Almacenamiento");
                    Indexacion = (String) jsonObject.get("Indexacion");
                    myHD = (String) jsonObject.get("myHD");
                    LimiteUsuarios = (String) jsonObject.get("LimiteUsuarios");

                }
           
           rs.close();
           
        }
        catch (SQLException e) {
            System.out.println("SELECT * from PoliticaCuentas Connection Failed!");
        }
        finally{
            conn.close();
        }
    }
    
    
    
    private void MapaOpciones()
    {
        HashMap hMap = new HashMap();
        
        hMap.put("BrowseBancosMovimientos.jsp", "yes");
        
        boolean blnExists = hMap.containsKey("BrowseBancosMovimientos.jsp");
        
    }

    // **************************************************************
    // *********************** getters ******************************
    // **************************************************************
    
    public int getxIDUser() {
        return xIDUser;
    }
    
    public String getxUser() {
        return xUser;
    }

    public String getNIF() {
        return NIF;
    }

    public String getRazonSocial() {
        return RazonSocial;
    }

    public String getFormaJuridica() {
        return FormaJuridica;
    }

    public String getYear_fiscal() {
        return year_fiscal;
    }

    public String getPeriodo() {
        return periodo;
    }

    public String getDatabase() {
        return Database;
    }

    public String getNumeroMaxUsuarios() {
        return NumeroMaxUsuarios;
    }

    public String getFecha() {
        return Fecha;
    }

    public String getHoy() {
        return Hoy;
    }

    public String getDiasFinPeriodo() {
        return DiasFinPeriodo;
    }

    public String getDiasFinYear() {
        return DiasFinYear;
    }

    public String getNIFUser() {
        return NIFUser;
    }

    public String getNombreUsuario() {
        return NombreUsuario;
    }

    public String getUserTipo() {
        return UserTipo;
    }

    public String getFacturacion() {
        return Facturacion;
    }

    public String getContabilidad() {
        return Contabilidad;
    }

    public String getNominas() {
        return Nominas;
    }

    public String getBurofax() {
        return Burofax;
    }

    public String getImpuestos() {
        return Impuestos;
    }

    public String getFirma() {
        return Firma;
    }

    public String getAlmacenamiento() {
        return Almacenamiento;
    }

    public String getIndexacion() {
        return Indexacion;
    }

    public String getAsesor() {
        return Asesor;
    }

    public String getMyCertHash() {
        return myCertHash;
    }

    public byte[] getMyCertificado() {
        return myCertificado;
    }

    public int getTipo_de_cuenta() {
        return tipo_de_cuenta;
    }

    public String getNominasApp() {
        return NominasApp;
    }

    public String getLimiteUsuarios() {
        return LimiteUsuarios;
    }

    public String getMyHD() {
        return myHD;
    }

    public String getDocumentoIngreso() {
        return DocumentoIngreso;
    }

    public String getEmiteRemesas() {
        return EmiteRemesas;
    }

    public String getPresupuestos() {
        return Presupuestos;
    }

    public int getNumeroDeRecibos() {
        return NumeroDeRecibos;
    }

    public String getTipoBalance() {
        return TipoBalance;
    }

    public int getxIDTercero() {
        return xIDTercero;
    }

    public String getxMailTercero() {
        return xMailTercero;
    }

    public String getPermisos() {
        return permisos;
    }

    public Locale getMyLocale() {
        return myLocale;
    }

    
    
    
}
