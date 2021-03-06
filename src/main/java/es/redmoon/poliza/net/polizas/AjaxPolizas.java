/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.polizas;

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
public class AjaxPolizas extends HttpServlet {

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
            case "PolizasByID":
                {
                    SQLPolizas myPoliza = new SQLPolizas(xDataBase);
                    List<TuplasPolizas> ListaPolizas = myPoliza.getTuplasPolizas(Integer.parseInt(pagina),Integer.parseInt(size));
                    response.getWriter().write(gson.toJson(ListaPolizas));
                    break;
                }
            case "PolizasByBuscar":
                {
                    SQLPolizas myPoliza = new SQLPolizas(xDataBase);
                    String buscar = request.getParameter("xBuscar");
                    List<TuplasPolizasBuscar> ListaPolizasBuscar = 
                            myPoliza.getTuplasPolizasByBuscar(buscar.trim(), Integer.parseInt(pagina),Integer.parseInt(size));
                    response.getWriter().write(gson.toJson(ListaPolizasBuscar));
                    break;
                }
            case "PolizasByNIF":
                {
                    SQLPolizas myPoliza = new SQLPolizas(xDataBase);
                    
                    //System.out.print(xNIF);
                    
                    List<TuplasPolizasBuscar> ListaPolizasBuscar = 
                            myPoliza.getTuplasPolizasByNIF(xNIF.trim(), Integer.parseInt(pagina),Integer.parseInt(size));
                    response.getWriter().write(gson.toJson(ListaPolizasBuscar));
                    break;
                }
            case "PolizasByRiesgo":
                {
                    SQLPolizas myPoliza = new SQLPolizas(xDataBase);
                    String riesgo = request.getParameter("xRiesgo");
                    List<TuplasPolizas> ListaPolizas = 
                            myPoliza.getTuplasPolizasByRiesgo(riesgo.trim(), Integer.parseInt(pagina),Integer.parseInt(size));
                    response.getWriter().write(gson.toJson(ListaPolizas));
                    break;
                }
            case "IDFromMVpolizas_asegurado":
                {
                    SQLPolizas myPoliza = new SQLPolizas(xDataBase);
                    String xIDPoliza = request.getParameter("xIDPoliza");
                    TuplasPolizasMV tpPoliza = 
                            myPoliza.getTuplaByIDFromMVpolizas_asegurado(Integer.parseInt(xIDPoliza));
                    response.getWriter().write(gson.toJson(tpPoliza));
                    break;
                }
            case "ProduccionByNumeroVentas":
                {
                    SQLPolizas myPoliza = new SQLPolizas(xDataBase);
                    String xYear = request.getParameter("xYear");
                    List<TuplasProduccionByNumeroVentas> tpBy = 
                                    myPoliza.getProduccionByNumeroVentas(xYear);
                    response.getWriter().write(gson.toJson(tpBy));
                    break;
                }
            case "ProduccionByTotal":
                {
                    SQLPolizas myPoliza = new SQLPolizas(xDataBase);
                    String xYear = request.getParameter("xYear");
                    List<TuplasProduccionByNumeroVentas> tpBy = 
                                    myPoliza.getProduccionByTotal(xYear);
                    response.getWriter().write(gson.toJson(tpBy));
                    break;
                }
            case "ProduccionByComision":
                {
                    SQLPolizas myPoliza = new SQLPolizas(xDataBase);
                    String xYear = request.getParameter("xYear");
                    List<TuplasProduccionByNumeroVentas> tpBy = 
                                    myPoliza.getProduccionByComision(xYear);
                    response.getWriter().write(gson.toJson(tpBy));
                    break;
                }
            case "ProduccionAll":
                {
                    SQLPolizas myPoliza = new SQLPolizas(xDataBase);
                    String xYear = request.getParameter("xYear");
                    String respuesta = 
                                    myPoliza.ProduccionAll(xYear);
                    response.getWriter().write(respuesta);
                    break;
                }
            case "ProduccionRamos":
                {
                    SQLPolizas myPoliza = new SQLPolizas(xDataBase);

                    String respuesta = 
                                    myPoliza.ProduccionRamos();
                    response.getWriter().write(respuesta);
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
