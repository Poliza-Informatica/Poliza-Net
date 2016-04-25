/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.qwery_polizas;

import java.io.Serializable;

/**
 *
 * @author antonio
 * implements java.io.Serializable
 */
public class BeanPolizas implements Serializable {
    
    private String id;
    private String id_solicitud;
    private String poliza;
    private String documento_adhesion;
    private String efecto;
    private String vencimiento;
    private String compania;
    private String producto;
    private String riesgo_asegurado;
    private String forma_pago;
    private String canal_pago;
    private String iban;
    private String gestor;
    private String mediador1;
    private String mediador2;
    private String cobrador;
    private String comercial;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId_solicitud() {
        return id_solicitud;
    }

    public void setId_solicitud(String id_solicitud) {
        this.id_solicitud = id_solicitud;
    }

    public String getPoliza() {
        return poliza;
    }

    public void setPoliza(String poliza) {
        this.poliza = poliza;
    }

    public String getDocumento_adhesion() {
        return documento_adhesion;
    }

    public void setDocumento_adhesion(String documento_adhesion) {
        this.documento_adhesion = documento_adhesion;
    }

    public String getEfecto() {
        return efecto;
    }

    public void setEfecto(String efecto) {
        this.efecto = efecto;
    }

    public String getVencimiento() {
        return vencimiento;
    }

    public void setVencimiento(String vencimiento) {
        this.vencimiento = vencimiento;
    }

    public String getCompania() {
        return compania;
    }

    public void setCompania(String compania) {
        this.compania = compania;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getRiesgo_asegurado() {
        return riesgo_asegurado;
    }

    public void setRiesgo_asegurado(String riesgo_asegurado) {
        this.riesgo_asegurado = riesgo_asegurado;
    }

    public String getForma_pago() {
        return forma_pago;
    }

    public void setForma_pago(String forma_pago) {
        this.forma_pago = forma_pago;
    }

    public String getCanal_pago() {
        return canal_pago;
    }

    public void setCanal_pago(String canal_pago) {
        this.canal_pago = canal_pago;
    }

    public String getIban() {
        return iban;
    }

    public void setIban(String iban) {
        this.iban = iban;
    }

    public String getGestor() {
        return gestor;
    }

    public void setGestor(String gestor) {
        this.gestor = gestor;
    }

    public String getMediador1() {
        return mediador1;
    }

    public void setMediador1(String mediador1) {
        this.mediador1 = mediador1;
    }

    public String getMediador2() {
        return mediador2;
    }

    public void setMediador2(String mediador2) {
        this.mediador2 = mediador2;
    }

    public String getCobrador() {
        return cobrador;
    }

    public void setCobrador(String cobrador) {
        this.cobrador = cobrador;
    }

    public String getComercial() {
        return comercial;
    }

    public void setComercial(String comercial) {
        this.comercial = comercial;
    }
    
    
}
