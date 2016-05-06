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
        
        String xTipo = request.getParameter("xTipo");
        String xYear = request.getParameter("xYear");
        String xTrimestre = request.getParameter("xTrimestre");
        String xNIF = request.getParameter("xNIF");
        String xNombre = request.getParameter("xNombre");
        
        //ListadoVentas listado = new ListadoVentas();
        //xTipo = "V" entras "C"ompras
        byte[] pdfListado = new ListadoPolizas(xDataBase).makeListado(xTipo,xYear, xTrimestre, xNIF, xNombre);
        //myDoc.PDFDocByID_issued(Integer.parseInt(xID));
        
        ByteArrayInputStream in = new ByteArrayInputStream(pdfListado);
        
        ByteArrayOutputStream PDFenMemoria = new ByteArrayOutputStream();
        
        IOUtils.copy(in, PDFenMemoria);
        IOUtils.closeQuietly(in);
                
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition"," inline; filename=ventas.pdf");
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
