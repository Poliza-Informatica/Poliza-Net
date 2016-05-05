/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.recibos;

/**
 *
 * @author antonio
 */
public class TuplasVWrecibos_clientes {

    private final String id;
    private final String id_poliza;
    private final String n_recibo;
    private final String efecto;
    private final String vencimiento;
    private final String prima_neta;
    private final String total_recibo;
    private final String forma_pago;
    private final String canal_pago;
    private final String tipo;
    private final String estado_cliente;
    private final String fecha_estado_cliente;
    private final String estado_cia;
    private final String fecha_estado_cia;
    private final String nif;
    private final String riesgo_asegurado;
    private final String poliza;
    private final String nombre;
    private final String cia_name;

    public String getId() {
        return id;
    }

    public String getId_poliza() {
        return id_poliza;
    }

    public String getN_recibo() {
        return n_recibo;
    }

    public String getEfecto() {
        return efecto;
    }

    public String getVencimiento() {
        return vencimiento;
    }

    public String getPrima_neta() {
        return prima_neta;
    }

    public String getTotal_recibo() {
        return total_recibo;
    }

    public String getForma_pago() {
        return forma_pago;
    }

    public String getCanal_pago() {
        return canal_pago;
    }

    public String getTipo() {
        return tipo;
    }

    public String getEstado_cliente() {
        return estado_cliente;
    }

    public String getFecha_estado_cliente() {
        return fecha_estado_cliente;
    }

    public String getEstado_cia() {
        return estado_cia;
    }

    public String getFecha_estado_cia() {
        return fecha_estado_cia;
    }

    public String getNif() {
        return nif;
    }

    public String getRiesgo_asegurado() {
        return riesgo_asegurado;
    }

    public String getPoliza() {
        return poliza;
    }

    public String getNombre() {
        return nombre;
    }

    public String getCia_name() {
        return cia_name;
    }

    
    
    public static class Builder {

        private final String id;
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
        
        public Builder(String id) {
            this.id = id;
        }
        
        public Builder Id_poliza(final String id_poliza) {
            this.id_poliza = id_poliza;
            return this;
        }

        public Builder N_recibo(final String n_recibo) {
            this.n_recibo = n_recibo;
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

        public Builder Prima_neta(final String prima_neta) {
            this.prima_neta = prima_neta;
            return this;
        }

        public Builder Total_recibo(final String total_recibo) {
            this.total_recibo = total_recibo;
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

        public Builder Tipo(final String tipo) {
            this.tipo = tipo;
            return this;
        }

        public Builder Estado_cliente(final String estado_cliente) {
            this.estado_cliente = estado_cliente;
            return this;
        }

        public Builder Fecha_estado_cliente(final String fecha_estado_cliente) {
            this.fecha_estado_cliente = fecha_estado_cliente;
            return this;
        }

        public Builder Estado_cia(final String estado_cia) {
            this.estado_cia = estado_cia;
            return this;
        }

        public Builder Fecha_estado_cia(final String fecha_estado_cia) {
            this.fecha_estado_cia = fecha_estado_cia;
            return this;
        }

        public Builder Nif(final String nif) {
            this.nif = nif;
            return this;
        }

        public Builder Riesgo_asegurado(final String riesgo_asegurado) {
            this.riesgo_asegurado = riesgo_asegurado;
            return this;
        }

        public Builder Poliza(final String poliza) {
            this.poliza = poliza;
            return this;
        }

        public Builder Nombre(final String nombre) {
              this.nombre = nombre;
            return this;
        }

        public Builder Cia_name(final String cia_name) {
              this.cia_name = cia_name;
            return this;
        }
        
        public TuplasVWrecibos_clientes build() {
            return new TuplasVWrecibos_clientes(this);
        }
    }
    
    /**
     * Constructor de las tuplas de la vista de recibos de clientes
     * @param builder 
     */
    private TuplasVWrecibos_clientes(Builder builder)
    {
        this.id=builder.id;
        this.id_poliza=builder.id_poliza;
        this.n_recibo=builder.n_recibo;
        this.efecto=builder.efecto;
        this.vencimiento=builder.vencimiento;
        this.prima_neta=builder.prima_neta;
        this.total_recibo=builder.total_recibo;
        this.forma_pago=builder.forma_pago;
        this.canal_pago=builder.canal_pago;
        this.tipo=builder.tipo;
        this.estado_cliente=builder.estado_cliente;
        this.fecha_estado_cliente=builder.fecha_estado_cliente;
        this.estado_cia=builder.estado_cia;
        this.fecha_estado_cia=builder.fecha_estado_cia;
        this.nif=builder.nif;
        this.riesgo_asegurado=builder.riesgo_asegurado;
        this.poliza=builder.poliza;
        this.nombre=builder.nombre;
        this.cia_name=builder.cia_name;
    }
    
    
    
}
