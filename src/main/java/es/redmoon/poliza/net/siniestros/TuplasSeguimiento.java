/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.siniestros;

/**
 *
 * @author antonio
 */
public class TuplasSeguimiento {

    private final String id;
    private final String id_siniestros;
    private final String fecha_hora;
    private final String texto;
    private final byte[] doc;

    public String getId() {
        return id;
    }

    public String getId_siniestros() {
        return id_siniestros;
    }

    public String getFecha_hora() {
        return fecha_hora;
    }

    public String getTexto() {
        return texto;
    }

    public byte[] getDoc() {
        return doc;
    }
    
    
    public static class Builder {
        
        private final String id;
        private String id_siniestros;
        private String fecha_hora;
        private String texto;
        private byte[] doc;

        public Builder(String id) {
            this.id = id;
        }

        public Builder Id_siniestros(final String id_siniestros) {
            this.id_siniestros = id_siniestros;
            return this;
        }

        public Builder Fecha_hora(final String fecha_hora) {
            this.fecha_hora = fecha_hora;
            return this;
        }

        public Builder Texto(final String texto) {
            this.texto = texto;
            return this;
        }

        public Builder Doc(final byte[] doc) {
            this.doc = doc;
            return this;
        }

        public TuplasSeguimiento build() {
            return new TuplasSeguimiento(this);
        }
    }
    

    /**
     * 
     * @param builder 
     */
    private TuplasSeguimiento(Builder builder){
        this.id=builder.id;
        this.id_siniestros=builder.id_siniestros;
        this.fecha_hora=builder.fecha_hora;
        this.texto=builder.texto;
        this.doc=builder.doc;
    }
    
}
