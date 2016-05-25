/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.cias;

/**
 *
 * @author antonio
 */
public class TuplasCias {

    private final String code;
    private final String nombre;

    public String getCode() {
        return code;
    }

    public String getNombre() {
        return nombre;
    }
    
    public static class Builder {
        private final String code;
        private String nombre;
        
        public Builder(String code) {
            this.code = code;
        }

        public Builder Name_cia(final String nombre) {
            this.nombre = nombre;
            return this;
        }
        public TuplasCias build() {
            return new TuplasCias(this);
        }
    }
    
    /**
     * 
     * @param builder 
     */
    private TuplasCias(Builder builder) {
        this.code=builder.code;
        this.nombre=builder.nombre;
    }
}
