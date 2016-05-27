/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.redmoon.poliza.net.polizas;

/**
 * Gestión de las tuplas de pólizas
 * @author antonio
 */
public class TuplasPolizasMV {
    
    // id,nombre, nif,en_calidad_de, poliza,riesgo_asegurado,efecto,vencimiento,cia_code,cia_name
    
    private final String id;
    private final String nombre;
    private final String poliza;
    private final String nif;
    private final String efecto;
    private final String vencimiento;
    private final String cia_code;
    private final String cia_name;
    private final String riesgo_asegurado;
    private final String en_calidad_de;
    private final String iban;
    private final String tlf1;
    private final String tlf2;
    private final String email;
    

    public String getId() {
        return id;
    }

    public String getPoliza() {
        return poliza;
    }

    public String getNombre() {
        return nombre;
    }

    public String getNif() {
        return nif;
    }
    
    public String getEfecto() {
        return efecto;
    }

    public String getVencimiento() {
        return vencimiento;
    }

    public String getCiaCode() {
        return cia_code;
    }

    public String getCiaName() {
        return cia_name;
    }

    public String getRiesgo_asegurado() {
        return riesgo_asegurado;
    }

    public String getEn_calidad_de() {
        return en_calidad_de;
    }

    public String getIban() {
        return iban;
    }

    public String getTlf1() {
        return tlf1;
    }

    public String getTlf2() {
        return tlf2;
    }

    public String getEmail() {
        return email;
    }

    
    
    public static class Builder {
        private final String id;
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

        public Builder(String id) {
            this.id = id;
        }

        public Builder Nombre(final String nombre) {
            this.nombre = nombre;
            return this;
        }

        public Builder Poliza(final String poliza) {
            this.poliza = poliza;
            return this;
        }

        public Builder Nif(final String nif) {
            this.nif = nif;
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

        public Builder Cia_code(final String cia_code) {
            this.cia_code = cia_code;
            return this;
        }

        public Builder Cia_name(final String cia_name) {
            this.cia_name = cia_name;
            return this;
        }

        public Builder Riesgo_asegurado(final String riesgo_asegurado) {
            this.riesgo_asegurado = riesgo_asegurado;
            return this;
        }

        public Builder En_calidad_de(final String en_calidad_de) {
            this.en_calidad_de = en_calidad_de;
            return this;
        }

        public Builder Iban(final String iban) {
            this.iban = iban;
            return this;
        }
        
        public Builder Tlf1(final String tlf1) {
            this.tlf1 = tlf1;
            return this;
        }
        
        public Builder Tlf2(final String tlf2) {
            this.tlf2 = tlf2;
            return this;
        }
        
        public Builder Email(final String email) {
            this.email = email;
            return this;
        }

        public TuplasPolizasMV build() {
            return new TuplasPolizasMV(this);
        }
    }

    /**
     * Constructor privado de la vista materializada mwpolizas_asegurado
     * @param builder 
     */
    private TuplasPolizasMV(Builder builder) {
        this.id = builder.id;
        this.nombre = builder.nombre;
        this.poliza = builder.poliza;
        this.nif = builder.nif;
        this.efecto = builder.efecto;
        this.vencimiento = builder.vencimiento;
        this.cia_code = builder.cia_code;
        this.cia_name = builder.cia_name;
        this.riesgo_asegurado = builder.riesgo_asegurado;
        this.en_calidad_de = builder.en_calidad_de;
        this.iban = builder.iban;
        this.tlf1 = builder.tlf1;
        this.tlf2 = builder.tlf2;
        this.email = builder.email;
        
    }

    
    
}
