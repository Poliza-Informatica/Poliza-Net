/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.polizas;

import com.lowagie.text.DocumentException;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author antonio 
 */
public class ServletpdfListadoPolizas extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NamingException, DocumentException {

        HttpSession sesion = request.getSession();
        String xDataBase = (String) sesion.getAttribute("xDataBaseName");
        
        
        String xCode = request.getParameter("xCodeCia");
        String xDesde = request.getParameter("xDesde");
        String xHasta = request.getParameter("xHasta");
        StringBuilder SQLSentencia = new StringBuilder("Select * from mwpolizas_asegurado ");
        
        // Analizar las variables para configurar la sentencia SQL del listado
        if (xCode.equals("00") || xCode.equals("") || xCode==null)
        {
            // Todas las compañias
            SQLSentencia.append("where cia_code!='00'");
        }
        else
        {
            // sólo una compañía
            SQLSentencia.append("where cia_code='");
            SQLSentencia.append(xCode);
            SQLSentencia.append("' ");
        }
        
        DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
        Date dateDesde=null;
        Date dateHasta=null;
        try {
            dateDesde = format.parse(xDesde);
            
        } catch (ParseException ex) {
            Logger.getLogger(ServletpdfListadoPolizas.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            dateHasta = format.parse(xHasta);
        } catch (ParseException ex) {
            Logger.getLogger(ServletpdfListadoPolizas.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if (dateDesde!=null )
        {
            // Desde una fecha
            SQLSentencia.append("and date(efecto) >=date('");
            SQLSentencia.append(xDesde);
            SQLSentencia.append("') ");
        }
        
        if (dateHasta!=null)
        {
            // Hasta una fecha
            SQLSentencia.append("and date(efecto) <=date('");
            SQLSentencia.append(xHasta);
            SQLSentencia.append("') ");
        }
        
        
        byte[] pdfListado = new ListadoPolizas(xDataBase).makeListado(SQLSentencia.toString());
        
        ByteArrayInputStream in = new ByteArrayInputStream(pdfListado);
        
        ByteArrayOutputStream PDFenMemoria = new ByteArrayOutputStream();
        
        IOUtils.copy(in, PDFenMemoria);
        IOUtils.closeQuietly(in);
                
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition"," inline; filename=ListaPolizas.pdf");
        response.setContentLength(PDFenMemoria.size());
        ServletOutputStream out = response.getOutputStream();

        PDFenMemoria.writeTo(out);
        out.flush();
        IOUtils.closeQuietly(PDFenMemoria);
        out.close();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            
            processRequest(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(ServletpdfListadoPolizas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ServletpdfListadoPolizas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (DocumentException ex) {
            Logger.getLogger(ServletpdfListadoPolizas.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            
            processRequest(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(ServletpdfListadoPolizas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ServletpdfListadoPolizas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (DocumentException ex) {
            Logger.getLogger(ServletpdfListadoPolizas.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
