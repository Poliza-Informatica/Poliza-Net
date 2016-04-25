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
public class BeanPolizasMV implements Serializable {
    
    private String id;
    private String nombre;
    private String poliza;
    private String nif;
    private String efecto;
    private String vencimiento;
    private String cia_code;
    private String cia_name;
    private String riesgo_asegurado;
    private String en_calidad_de;
    private String iban;
    private String tlf1;
    private String tlf2;
    private String email;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPoliza() {
        return poliza;
    }

    public void setPoliza(String poliza) {
        this.poliza = poliza;
    }

    public String getNif() {
        return nif;
    }

    public void setNif(String nif) {
        this.nif = nif;
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

    public String getCia_code() {
        return cia_code;
    }

    public void setCia_code(String cia_code) {
        this.cia_code = cia_code;
    }

    public String getCia_name() {
        return cia_name;
    }

    public void setCia_name(String cia_name) {
        this.cia_name = cia_name;
    }

    public String getRiesgo_asegurado() {
        return riesgo_asegurado;
    }

    public void setRiesgo_asegurado(String riesgo_asegurado) {
        this.riesgo_asegurado = riesgo_asegurado;
    }

    public String getEn_calidad_de() {
        return en_calidad_de;
    }

    public void setEn_calidad_de(String en_calidad_de) {
        this.en_calidad_de = en_calidad_de;
    }

    public String getIban() {
        return iban;
    }

    public void setIban(String iban) {
        this.iban = iban;
    }

    public String getTlf1() {
        return tlf1;
    }

    public void setTlf1(String tlf1) {
        this.tlf1 = tlf1;
    }

    public String getTlf2() {
        return tlf2;
    }

    public void setTlf2(String tlf2) {
        this.tlf2 = tlf2;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
}
