/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.recibos;

import es.redmoon.poliza.net.polizas.AjaxPolizas;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author antonio
 */
public class AjaxRecibos extends HttpServlet {

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
            throws ServletException, IOException, SQLException, NamingException {
        
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession(); 
        String xDataBase = (String) sesion.getAttribute("xDataBaseName");
        String xNIF = (String) sesion.getAttribute("NIF");
        Gson gson = new Gson();
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        
        String pagina = request.getParameter("pagina");
        String size = request.getParameter("size");
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        switch (accion) {
            case "RecibosByPoliza":
                {
                    SQLRecibos myRecibo = new SQLRecibos(xDataBase);
                    String xIDPoliza = request.getParameter("xIDPoliza");
                    //System.out.print(xIDPoliza);
                    List<TuplasRecibos> ListaRecibos = myRecibo.getReciboByPolizaID(Integer.parseInt(xIDPoliza));
                    response.getWriter().write(gson.toJson(ListaRecibos));
                    break;
                }
            case "ReciboByID":
                {
                    SQLRecibos myRecibo = new SQLRecibos(xDataBase);
                    String xIDRecibo = request.getParameter("xIDRecibo");
                    TuplasVWrecibos_clientes myTupla = 
                            myRecibo.getReciboByID(Integer.parseInt(xIDRecibo));
                    response.getWriter().write(gson.toJson(myTupla));
                    break;
                }
            default:
                response.getWriter().write("Error, mensaje no conteplado: "+accion);
                break;
        }
        
        
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
            Logger.getLogger(AjaxPolizas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(AjaxPolizas.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AjaxPolizas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(AjaxPolizas.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Consultas de Polizawin";
    }// </editor-fold>
}
