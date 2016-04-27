/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.polizas;

/**
 * Gestión de las tuplas de pólizas
 * @author antonio
 */
public class TuplasPolizas {
    private final String id;
    private final String code_cia;
    private final String poliza;
    private final String documento_adhesion;
    private final String efecto;
    private final String vencimiento;
    private final String compania;
    private final String producto;
    private final String riesgo_asegurado;
    private final String forma_pago;
    private final String canal_pago;
    private final String iban;
    private final String gestor;
    private final String mediador1;
    private final String mediador2;
    private final String cobrador;
    private final String comercial;

    public String getId() {
        return id;
    }

    public String getCode_cia() {
        return code_cia;
    }

    public String getPoliza() {
        return poliza;
    }

    public String getDocumento_adhesion() {
        return documento_adhesion;
    }

    public String getEfecto() {
        return efecto;
    }

    public String getVencimiento() {
        return vencimiento;
    }

    public String getCompania() {
        return compania;
    }

    public String getProducto() {
        return producto;
    }

    public String getRiesgo_asegurado() {
        return riesgo_asegurado;
    }

    public String getForma_pago() {
        return forma_pago;
    }

    public String getCanal_pago() {
        return canal_pago;
    }

    public String getIban() {
        return iban;
    }

    public String getGestor() {
        return gestor;
    }

    public String getMediador1() {
        return mediador1;
    }

    public String getMediador2() {
        return mediador2;
    }

    public String getCobrador() {
        return cobrador;
    }

    public String getComercial() {
        return comercial;
    }

    
    
    public static class Builder {
        private final String id;
        private String code_cia;
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

        public Builder(String id) {
            this.id = id;
        }

        public Builder Code_cia(final String code_cia) {
            this.code_cia = code_cia;
            return this;
        }

        public Builder Poliza(final String poliza) {
            this.poliza = poliza;
            return this;
        }

        public Builder Documento_adhesion(final String documento_adhesion) {
            this.documento_adhesion = documento_adhesion;
            return this;
        }

        public Builder Efecto(final String efecto) {
            this.efecto = efecto;
            return this;
        }

        public Builder Vencimiento(final String vencimiento) {
            this.vencimiento = vencimiento;
            return this;
        }

        public Builder Compania(final String compania) {
            this.compania = compania;
            return this;
        }

        public Builder Producto(final String producto) {
            this.producto = producto;
            return this;
        }

        public Builder Riesgo_asegurado(final String riesgo_asegurado) {
            this.riesgo_asegurado = riesgo_asegurado;
            return this;
        }

        public Builder Forma_pago(final String forma_pago) {
            this.forma_pago = forma_pago;
            return this;
        }

        public Builder Canal_pago(final String canal_pago) {
            this.canal_pago = canal_pago;
            return this;
        }

        public Builder Iban(final String iban) {
            this.iban = iban;
            return this;
        }

        public Builder Gestor(final String gestor) {
            this.gestor = gestor;
            return this;
        }

        public Builder Mediador1(final String mediador1) {
            this.mediador1 = mediador1;
            return this;
        }

        public Builder Mediador2(final String mediador2) {
            this.mediador2 = mediador2;
            return this;
        }

        public Builder Cobrador(final String cobrador) {
            this.cobrador = cobrador;
            return this;
        }

        public Builder Comercial(final String comercial) {
            this.comercial = comercial;
            return this;
        }

        public TuplasPolizas build() {
            return new TuplasPolizas(this);
        }
    }

    /**
     * Constructor privado de la tupla de pólizas
     * @param builder 
     */
    private TuplasPolizas(Builder builder) {
        this.id = builder.id;
        this.code_cia = builder.code_cia;
        this.poliza = builder.poliza;
        this.documento_adhesion = builder.documento_adhesion;
        this.efecto = builder.efecto;
        this.vencimiento = builder.vencimiento;
        this.compania = builder.compania;
        this.producto = builder.producto;
        this.riesgo_asegurado = builder.riesgo_asegurado;
        this.forma_pago = builder.forma_pago;
        this.canal_pago = builder.canal_pago;
        this.iban = builder.iban;
        this.gestor = builder.gestor;
        this.mediador1 = builder.mediador1;
        this.mediador2 = builder.mediador2;
        this.cobrador = builder.cobrador;
        this.comercial = builder.comercial;
    }

    
    
}
