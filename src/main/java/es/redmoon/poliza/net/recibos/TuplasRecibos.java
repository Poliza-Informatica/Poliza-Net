/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.recibos;

/**
 * Tupla de un recibo
 * @author antonio
 */
public class TuplasRecibos {

    // 
   private final String id;
   private final String id_poliza;
   private final String n_recibo;
   private final String efecto;
   private final String vencimiento;
   private final String prima_neta;
   private final String total_recibo;
   private final String comision_bruta;
   private final String liquido_bruto;
   private final String forma_pago;
   private final String canal_pago;
   private final String tipo;
   private final String estado_cliente;
   private final String fecha_cobro;
   private final String estado_cia;
   private final String fecha_estado_cia;
   private final String comercial;
   private final String comision_comercial;
   private final String estado_comercial;
   private final String f_estado_comercial;
   private final String division;
   private final String comision_division;
   private final String estado_division;
   private final String f_estado_division;
   private final String delegado;
   private final String comision_delegado;
   private final String estado_delegado;
   private final String f_estado_delegado;
   private final String agente;
   private final String comision_agente;
   private final String estado_agente;
   private final String f_estado_agente;
   private final String cobrador;
   private final String comision_cobrador;
   private final String estado_cobrador;
   private final String f_estado_cobrador;

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

    public String getComision_bruta() {
        return comision_bruta;
    }

    public String getLiquido_bruto() {
        return liquido_bruto;
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

    public String getFecha_cobro() {
        return fecha_cobro;
    }

    public String getEstado_cia() {
        return estado_cia;
    }

    public String getFecha_estado_cia() {
        return fecha_estado_cia;
    }

    public String getComercial() {
        return comercial;
    }

    public String getComision_comercial() {
        return comision_comercial;
    }

    public String getEstado_comercial() {
        return estado_comercial;
    }

    public String getF_estado_comercial() {
        return f_estado_comercial;
    }

    public String getDivision() {
        return division;
    }

    public String getComision_division() {
        return comision_division;
    }

    public String getEstado_division() {
        return estado_division;
    }

    public String getF_estado_division() {
        return f_estado_division;
    }

    public String getDelegado() {
        return delegado;
    }

    public String getComision_delegado() {
        return comision_delegado;
    }

    public String getEstado_delegado() {
        return estado_delegado;
    }

    public String getF_estado_delegado() {
        return f_estado_delegado;
    }

    public String getAgente() {
        return agente;
    }

    public String getComision_agente() {
        return comision_agente;
    }

    public String getEstado_agente() {
        return estado_agente;
    }

    public String getF_estado_agente() {
        return f_estado_agente;
    }

    public String getCobrador() {
        return cobrador;
    }

    public String getComision_cobrador() {
        return comision_cobrador;
    }

    public String getEstado_cobrador() {
        return estado_cobrador;
    }

    public String getF_estado_cobrador() {
        return f_estado_cobrador;
    }

    public static class Builder {
        
        private final String id;
        private String id_poliza;
        private String n_recibo;
        private String efecto;
        private String vencimiento;
        private String prima_neta;
        private String total_recibo;
        private String comision_bruta;
        private String liquido_bruto;
        private String forma_pago;
        private String canal_pago;
        private String tipo;
        private String estado_cliente;
        private String fecha_cobro;
        private String estado_cia;
        private String fecha_estado_cia;
        private String comercial;
        private String comision_comercial;
        private String estado_comercial;
        private String f_estado_comercial;
        private String division;
        private String comision_division;
        private String estado_division;
        private String f_estado_division;
        private String delegado;
        private String comision_delegado;
        private String estado_delegado;
        private String f_estado_delegado;
        private String agente;
        private String comision_agente;
        private String estado_agente;
        private String f_estado_agente;
        private String cobrador;
        private String comision_cobrador;
        private String estado_cobrador;
        private String f_estado_cobrador;

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

        public Builder Comision_bruta(final String comision_bruta) {
            this.comision_bruta = comision_bruta;
            return this;
        }

        public Builder Liquido_bruto(final String liquido_bruto) {
            this.liquido_bruto = liquido_bruto;
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

        public Builder Fecha_cobro(final String fecha_cobro) {
            this.fecha_cobro = fecha_cobro;
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

        public Builder Comercial(final String comercial) {
            this.comercial = comercial;
            return this;
        }

        public Builder Comision_comercial(final String comision_comercial) {
            this.comision_comercial = comision_comercial;
            return this;
        }

        public Builder Estado_comercial(final String estado_comercial) {
            this.estado_comercial = estado_comercial;
            return this;
        }

        public Builder F_estado_comercial(final String f_estado_comercial) {
            this.f_estado_comercial = f_estado_comercial;
            return this;
        }

        public Builder Division(final String division) {
            this.division = division;
            return this;
        }

        public Builder Comision_division(final String comision_division) {
            this.comision_division = comision_division;
            return this;
        }

        public Builder Estado_division(final String estado_division) {
            this.estado_division = estado_division;
            return this;
        }

        public Builder F_estado_division(final String f_estado_division) {
            this.f_estado_division = f_estado_division;
            return this;
        }

        public Builder Delegado(final String delegado) {
            this.delegado = delegado;
            return this;
        }

        public Builder Comision_delegado(final String comision_delegado) {
            this.comision_delegado = comision_delegado;
            return this;
        }

        public Builder Estado_delegado(final String estado_delegado) {
            this.estado_delegado = estado_delegado;
            return this;
        }

        public Builder F_estado_delegado(final String f_estado_delegado) {
            this.f_estado_delegado = f_estado_delegado;
            return this;
        }

        public Builder Agente(final String agente) {
            this.agente = agente;
            return this;
        }

        public Builder Comision_agente(final String comision_agente) {
            this.comision_agente = comision_agente;
            return this;
        }

        public Builder Estado_agente(final String estado_agente) {
            this.estado_agente = estado_agente;
            return this;
        }

        public Builder F_estado_agente(final String f_estado_agente) {
            this.f_estado_agente = f_estado_agente;
            return this;
        }

        public Builder Cobrador(final String cobrador) {
            this.cobrador = cobrador;
            return this;
        }

        public Builder Comision_cobrador(final String comision_cobrador) {
            this.comision_cobrador = comision_cobrador;
            return this;
        }

        public Builder Estado_cobrador(final String estado_cobrador) {
            this.estado_cobrador = estado_cobrador;
            return this;
        }

        public Builder F_estado_cobrador(final String f_estado_cobrador) {
            this.f_estado_cobrador = f_estado_cobrador;
            return this;
        }

        public TuplasRecibos build() {
            return new TuplasRecibos(this);
        }
    }
   
   
    private TuplasRecibos(Builder builder) {
        this.id = builder.id;
        this.id_poliza= builder.id_poliza;
        this.n_recibo= builder.n_recibo;
        this.efecto= builder.efecto;
        this.vencimiento= builder.vencimiento;
        this.prima_neta= builder.prima_neta;
        this.total_recibo= builder.total_recibo;
        this.comision_bruta= builder.comision_bruta;
        this.liquido_bruto= builder.liquido_bruto;
        this.forma_pago= builder.forma_pago;
        this.canal_pago= builder.canal_pago;
        this.tipo= builder.tipo;
        this.estado_cliente= builder.estado_cliente;
        this.fecha_cobro= builder.fecha_cobro;
        this.estado_cia= builder.estado_cia;
        this.fecha_estado_cia= builder.fecha_estado_cia;
        this.comercial= builder.comercial;
        this.comision_comercial= builder.comision_comercial;
        this.estado_comercial= builder.estado_comercial;
        this.f_estado_comercial= builder.f_estado_comercial;
        this.division= builder.division;
        this.comision_division= builder.comision_division;
        this.estado_division= builder.estado_division;
        this.f_estado_division= builder.f_estado_division;
        this.delegado= builder.delegado;
        this.comision_delegado= builder.comision_delegado;
        this.estado_delegado= builder.estado_delegado;
        this.f_estado_delegado= builder.f_estado_delegado;
        this.agente= builder.agente;
        this.comision_agente= builder.comision_agente;
        this.estado_agente= builder.estado_agente;
        this.f_estado_agente= builder.f_estado_agente;
        this.cobrador= builder.cobrador;
        this.comision_cobrador= builder.comision_cobrador;
        this.estado_cobrador= builder.estado_cobrador;
        this.f_estado_cobrador= builder.f_estado_cobrador;
        
    }
}
