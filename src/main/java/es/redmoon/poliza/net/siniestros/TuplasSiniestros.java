/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.siniestros;

/**
 * Tuplas de un siniestro
 * @author antonio
 */
public class TuplasSiniestros {

    private final String id;
    private final String id_poliza;
    private final String expe_agencia;
    private final String expe_cia;
    private final String fecha_hora_sini;
    private final String lugar;
    private final String cp;
    private final String localidad;
    private final String provincia;
    private final String tipo_siniestro;
    private final String situacion;
    private final String fecha_situacion;
    private final String descripcion;
    private final String damage_asegurado;
    private final String tramitador;

    public String getId() {
        return id;
    }

    public String getId_poliza() {
        return id_poliza;
    }

    public String getExpe_agencia() {
        return expe_agencia;
    }

    public String getExpe_cia() {
        return expe_cia;
    }

    public String getFecha_hora_sini() {
        return fecha_hora_sini;
    }

    public String getLugar() {
        return lugar;
    }

    public String getCp() {
        return cp;
    }

    public String getLocalidad() {
        return localidad;
    }

    public String getProvincia() {
        return provincia;
    }

    public String getTipo_siniestro() {
        return tipo_siniestro;
    }

    public String getSituacion() {
        return situacion;
    }

    public String getFecha_situacion() {
        return fecha_situacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getDamage_asegurado() {
        return damage_asegurado;
    }

    public String getTramitador() {
        return tramitador;
    }
    
    
    
    public static class Builder {
        
        private final String id;
        private String id_poliza;
        private String expe_agencia;
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

        public Builder(String id) {
            this.id = id;
        }

        public Builder Id_poliza(final String id_poliza) {
            this.id_poliza = id_poliza;
            return this;
        }

        public Builder Expe_agencia(final String expe_agencia) {
            this.expe_agencia = expe_agencia;
            return this;
        }

        public Builder Fecha_hora_sini(final String fecha_hora_sini) {
            this.fecha_hora_sini = fecha_hora_sini;
            return this;
        }

        public Builder Lugar(final String lugar) {
            this.lugar = lugar;
            return this;
        }

        public Builder Cp(final String cp) {
            this.cp = cp;
            return this;
        }

        public Builder Localidad(final String localidad) {
            this.localidad = localidad;
            return this;
        }

        public Builder Provincia(final String provincia) {
            this.provincia = provincia;
            return this;
        }

        public Builder Tipo_siniestro(final String tipo_siniestro) {
            this.tipo_siniestro = tipo_siniestro;
            return this;
        }

        public Builder Situacion(final String situacion) {
            this.situacion = situacion;
            return this;
        }

        public Builder Fecha_situacion(final String fecha_situacion) {
            this.fecha_situacion = fecha_situacion;
            return this;
        }

        public Builder Descripcion(final String descripcion) {
            this.descripcion = descripcion;
            return this;
        }

        public Builder Damage_asegurado(final String damage_asegurado) {
            this.damage_asegurado = damage_asegurado;
            return this;
        }

        public Builder Tramitador(final String tramitador) {
            this.tramitador = tramitador;
            return this;
        }

        public TuplasSiniestros build() {
            return new TuplasSiniestros(this);
        }
    }
    
    private TuplasSiniestros(Builder builder){
        this.id=builder.id;
        this.id_poliza=builder.id_poliza;
        this.expe_agencia=builder.expe_agencia;
        this.expe_cia=builder.expe_cia;
        this.fecha_hora_sini=builder.fecha_hora_sini;
        this.lugar=builder.lugar;
        this.cp=builder.cp;
        this.localidad=builder.localidad;
        this.provincia=builder.provincia;
        this.tipo_siniestro=builder.tipo_siniestro;
        this.situacion=builder.situacion;
        this.fecha_situacion=builder.fecha_situacion;
        this.descripcion=builder.descripcion;
        this.damage_asegurado=builder.damage_asegurado;
        this.tramitador=builder.tramitador;
    }
}
