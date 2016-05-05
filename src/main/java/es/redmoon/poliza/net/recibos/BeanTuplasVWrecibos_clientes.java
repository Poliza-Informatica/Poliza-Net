/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.recibos;

import java.beans.*;
import java.io.Serializable;

/**
 *
 * @author antonio
 */
public class BeanTuplasVWrecibos_clientes implements Serializable {
    
    private String id;
    private String id_poliza;
    private String n_recibo;
    private String efecto;
    private String vencimiento;
    private String prima_neta;
    private String total_recibo;
    private String forma_pago;
    private String canal_pago;
    private String tipo;
    private String estado_cliente;
    private String fecha_estado_cliente;
    private String estado_cia;
    private String fecha_estado_cia;
    private String nif;
    private String riesgo_asegurado;
    private String poliza;
    private String nombre;
    private String cia_name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId_poliza() {
        return id_poliza;
    }

    public void setId_poliza(String id_poliza) {
        this.id_poliza = id_poliza;
    }

    public String getN_recibo() {
        return n_recibo;
    }

    public void setN_recibo(String n_recibo) {
        this.n_recibo = n_recibo;
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

    public String getPrima_neta() {
        return prima_neta;
    }

    public void setPrima_neta(String prima_neta) {
        this.prima_neta = prima_neta;
    }

    public String getTotal_recibo() {
        return total_recibo;
    }

    public void setTotal_recibo(String total_recibo) {
        this.total_recibo = total_recibo;
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

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getEstado_cliente() {
        return estado_cliente;
    }

    public void setEstado_cliente(String estado_cliente) {
        this.estado_cliente = estado_cliente;
    }

    public String getFecha_estado_cliente() {
        return fecha_estado_cliente;
    }

    public void setFecha_estado_cliente(String fecha_estado_cliente) {
        this.fecha_estado_cliente = fecha_estado_cliente;
    }

    public String getEstado_cia() {
        return estado_cia;
    }

    public void setEstado_cia(String estado_cia) {
        this.estado_cia = estado_cia;
    }

    public String getFecha_estado_cia() {
        return fecha_estado_cia;
    }

    public void setFecha_estado_cia(String fecha_estado_cia) {
        this.fecha_estado_cia = fecha_estado_cia;
    }

    public String getNif() {
        return nif;
    }

    public void setNif(String nif) {
        this.nif = nif;
    }

    public String getRiesgo_asegurado() {
        return riesgo_asegurado;
    }

    public void setRiesgo_asegurado(String riesgo_asegurado) {
        this.riesgo_asegurado = riesgo_asegurado;
    }

    public String getPoliza() {
        return poliza;
    }

    public void setPoliza(String poliza) {
        this.poliza = poliza;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCia_name() {
        return cia_name;
    }

    public void setCia_name(String cia_name) {
        this.cia_name = cia_name;
    }

    
    
}
