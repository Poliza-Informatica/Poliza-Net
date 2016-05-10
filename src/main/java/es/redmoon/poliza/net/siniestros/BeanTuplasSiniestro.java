/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.siniestros;

import java.io.Serializable;

/**
 *
 * @author antonio
 */
public class BeanTuplasSiniestro implements Serializable {
    
    private String expe_agencia;
    private String id_poliza;
    private String expe_cia;
    private String fecha_hora_sini;
    private String lugar;
    private String cp;
    private String localidad;
    private String provincia;
    private String tipo_siniestro;
    private String situacion;
    private String fecha_situacion;
    private String descripcion;
    private String damage_asegurado;
    private String tramitador;

    public String getExpe_agencia() {
        return expe_agencia;
    }

    public void setExpe_agencia(String expe_agencia) {
        this.expe_agencia = expe_agencia;
    }

    public String getId_poliza() {
        return id_poliza;
    }

    public void setId_poliza(String id_poliza) {
        this.id_poliza = id_poliza;
    }

    public String getExpe_cia() {
        return expe_cia;
    }

    public void setExpe_cia(String expe_cia) {
        this.expe_cia = expe_cia;
    }

    public String getFecha_hora_sini() {
        return fecha_hora_sini;
    }

    public void setFecha_hora_sini(String fecha_hora_sini) {
        this.fecha_hora_sini = fecha_hora_sini;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getCp() {
        return cp;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getTipo_siniestro() {
        return tipo_siniestro;
    }

    public void setTipo_siniestro(String tipo_siniestro) {
        this.tipo_siniestro = tipo_siniestro;
    }

    public String getSituacion() {
        return situacion;
    }

    public void setSituacion(String situacion) {
        this.situacion = situacion;
    }

    public String getFecha_situacion() {
        return fecha_situacion;
    }

    public void setFecha_situacion(String fecha_situacion) {
        this.fecha_situacion = fecha_situacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDamage_asegurado() {
        return damage_asegurado;
    }

    public void setDamage_asegurado(String damage_asegurado) {
        this.damage_asegurado = damage_asegurado;
    }

    public String getTramitador() {
        return tramitador;
    }

    public void setTramitador(String tramitador) {
        this.tramitador = tramitador;
    }
    
    
    
}
