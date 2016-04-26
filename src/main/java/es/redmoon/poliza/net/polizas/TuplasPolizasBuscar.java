/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.polizas;

/**
 *
 * @author antonio
 */
public class TuplasPolizasBuscar {

    private final String id;
    private final String nif;
    private final String nombre;
    private final String poliza;
    private final String efecto;
    private final String riesgo_asegurado;

    public String getId() {
        return id;
    }

    public String getNif() {
        return nif;
    }

    public String getNombre() {
        return nombre;
    }

    public String getPoliza() {
        return poliza;
    }

    public String getEfecto() {
        return efecto;
    }

    public String getRiesgo_asegurado() {
        return riesgo_asegurado;
    }


    
    
    
    public static class Builder {
        private final String id;
        private String nif;
        private String nombre;
        private String poliza;
        private String efecto;
        private String riesgo_asegurado;

        public Builder(String id) {
            this.id = id;
        }

        public Builder Nif(final String nif) {
            this.nif = nif;
            return this;
        }
        
        public Builder Nombre(final String nombre) {
            this.nombre = nombre;
            return this;
        }

        public Builder Poliza(final String poliza) {
            this.poliza = poliza;
            return this;
        }

        public Builder Efecto(final String efecto) {
            this.efecto = efecto;
            return this;
        }

        public Builder Riesgo_asegurado(final String riesgo_asegurado) {
            this.riesgo_asegurado = riesgo_asegurado;
            return this;
        }

        public TuplasPolizasBuscar build() {
            return new TuplasPolizasBuscar(this);
        }
    }

    /**
     * Constructor privado de la tupla de pólizas
     * @param builder 
     */
    private TuplasPolizasBuscar(Builder builder) {
        this.id = builder.id;
        this.nif = builder.nif;
        this.nombre = builder.nombre;
        this.poliza = builder.poliza;
        this.efecto = builder.efecto;
        this.riesgo_asegurado = builder.riesgo_asegurado;
    }

    
}
