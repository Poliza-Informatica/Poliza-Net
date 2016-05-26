--
-- Datos del Panel de Control de Pólizas
--

CREATE OR REPLACE FUNCTION  PanelPolizas(
    xYear in varchar,
    xCia_code in varchar,
    irpf out numeric,
    ventas out numeric,
    compras out numeric,
    iva out numeric,
    sociedades out numeric,
    nominas out numeric,
    seguridad_s out numeric
) 
returns RECORD
AS
$body$
DECLARE

    
BEGIN

    
    SELECT SumaVentasPeriodo(xYear, xPeri, xTipoPeri) INTO ventas;
    SELECT SumaComprasPeriodo(xYear, xPeri, xTipoPeri) INTO compras;
    SELECT SumaIVACobradoPeriodo(xYear, xPeri, xTipoPeri) - SumaIVAPagadoPeriodo(xYear, xPeri, xTipoPeri) INTO iva;
    SELECT PeriodoSociedades(xYear, xPeri, xTipoPeri) INTO sociedades;
    SELECT SumaIRPFPeriodo(xYear, xPeri, xTipoPeri) INTO irpf;
    SELECT SumaNominasPeriodo(xYear, xPeri, xTipoPeri) INTO nominas;
    SELECT SumaSSPeriodo(xYear, xPeri, xTipoPeri) INTO seguridad_s;

END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
SECURITY INVOKER
COST 100;

-- Ventas del año en número de recibos por agente
-- Ventas del año en número de recibos por comercial
-- Ventas del año en número de recibos por producto

CREATE OR REPLACE FUNCTION  RecibosPorAgente(
    xYear in varchar,
    xCia_code in varchar
) 
returns numeric
AS
$body$
DECLARE

    xSumaIRPF numeric(8,2) :=0;
    
BEGIN

    IF xCia_code = '00' THEN 
        
        select agente,count(*) as unidades from mwpolizas_asegurado 
            where extract(ISOYEAR from date(efecto)) = xYear
            group by agente
            order by unidades desc;
    
        
     ELSE 
        
        select agente,count(*) as unidades from mwpolizas_asegurado 
            where cia_code=xCia_code and extract(ISOYEAR from date(efecto)) = xYear
            group by agente
            order by unidades desc;
        
    END IF;


    if xSumaIRPF is null then
        xSumaIRPF:=0;
    end if;

    return xSumaIRPF;

END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
SECURITY INVOKER
COST 100;


--
-- Ventas por mes en número de recibos
--
CREATE OR REPLACE FUNCTION  RecibosPorMes(
    xYear in varchar,
    xCia_code in varchar
) 
returns numeric
AS
$body$
DECLARE

    xSumaIRPF numeric(8,2) :=0;
    
BEGIN

    IF xCia_code = '00' THEN 
        
        select extract(MONTH from date(efecto)) as mes, count(*) as unidades from mwpolizas_asegurado 
            where extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;
    
        
     ELSE 
        
        select extract(MONTH from date(efecto)) as mes, count(*) as unidades from mwpolizas_asegurado 
            where cia_code=xCia_code and extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;
        
    END IF;


    if xSumaIRPF is null then
        xSumaIRPF:=0;
    end if;

    return xSumaIRPF;

END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
SECURITY INVOKER
COST 100;


--
-- Ventas por mes en importe total recibo
--
CREATE OR REPLACE FUNCTION  ImportePorMes(
    xYear in varchar,
    xCia_code in varchar
) 
returns numeric
AS
$body$
DECLARE

    xSumaIRPF numeric(8,2) :=0;
    
BEGIN

    IF xCia_code = '00' THEN 
        
        select extract(MONTH from date(efecto)) as mes, sum(to_number(total_recibo, '999999.99')) as importe from vwrecibos_clientes 
            where extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;
    
        
     ELSE 
        
        select extract(MONTH from date(efecto)) as mes, sum(to_number(total_recibo, '999999.99')) as importe from vwrecibos_clientes 
            where cia_code=xCia_code and extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;
        
    END IF;


    if xSumaIRPF is null then
        xSumaIRPF:=0;
    end if;

    return xSumaIRPF;

END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
SECURITY INVOKER
COST 100;

--
-- Comisiones por mes
--
CREATE OR REPLACE FUNCTION  ComisionesPorMes(
    xYear in varchar,
    xCia_code in varchar
) 
returns numeric
AS
$body$
DECLARE

    xSumaIRPF numeric(8,2) :=0;
    
BEGIN

    IF xCia_code = '00' THEN 
        
        select extract(MONTH from date(efecto)) as mes, sum(to_number(comision, '999999.99')) as importe from vwrecibos_clientes 
            where extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;
    
        
     ELSE 
        
        select extract(MONTH from date(efecto)) as mes, sum(to_number(comision, '999999.99')) as importe from vwrecibos_clientes 
            where cia_code=xCia_code and extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;
        
    END IF;


    if xSumaIRPF is null then
        xSumaIRPF:=0;
    end if;

    return xSumaIRPF;

END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
SECURITY INVOKER
COST 100;
