
package es.redmoon.poliza.net.polizas;

/**
 *
 * @author antonio
 */
public class TuplasProduccionByNumeroVentas {

    private final String mes;
    private final String unidades;

    public String getMes() {
        return mes;
    }

    public String getUnidades() {
        return unidades;
    }

    
    public static class Builder {
        private final String mes;
        private String unidades;

        public Builder(String mes) {
            this.mes = mes;
        }

        public Builder Unidades(final String unidades) {
            this.unidades = unidades;
            return this;
        }

        public TuplasProduccionByNumeroVentas build() {
            return new TuplasProduccionByNumeroVentas(this);
        }
    }

    /**
     * Constructor privado de la tupla ProduccionByNumeroVentas
     * @param builder 
     */
    private TuplasProduccionByNumeroVentas(Builder builder) {
        this.mes = builder.mes;
        this.unidades = builder.unidades;
        
    }
    
}
