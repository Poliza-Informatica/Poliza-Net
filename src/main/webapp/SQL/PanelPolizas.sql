--
-- Datos del Panel de Control de Pólizas
--

CREATE OR REPLACE FUNCTION  PanelPolizas(
    xYear in integer,
    xCia_code in varchar,
    NumeroVentasCurrent out numeric,
    NumeroVentasPrevious out numeric,
    ByTotalCurrent out numeric,
    ByTotalPrevious out numeric,
    ByComisionCurrent out numeric,
    ByComisionPrevious out numeric
) 
returns RECORD
AS
$body$
DECLARE

    
BEGIN

    
    SELECT ProduccionByNumeroVentas((xYear,'00') INTO NumeroVentasCurrent;
    SELECT ProduccionByNumeroVentas((xYear-1,'00') INTO NumeroVentasPrevious;

    SELECT ProduccionByTotal((xYear,'00') INTO ByTotalCurrent;
    SELECT ProduccionByTotal((xYear-1,'00') INTO ByTotalPrevious;

    SELECT ProduccionByComision((xYear,'00') INTO ByComisionCurrent;
    SELECT ProduccionByComision((xYear-1,'00') INTO ByComisionPrevious;

END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
SECURITY INVOKER
COST 100;

-- Ventas del año en número de recibos por agente
-- Ventas del año en número de recibos por comercial
-- Ventas del año en número de recibos por producto



--
-- Ventas por mes en número de recibos
--
CREATE OR REPLACE FUNCTION  ProduccionByNumeroVentas(
    xYear in varchar,
    xCia_code in varchar
) 
returns json
AS
$body$
DECLARE

    curs4 CURSOR IS select extract(MONTH from date(efecto)) as mes, count(*) as unidades from mwpolizas_asegurado 
            where extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;
    curs5 select extract(MONTH from date(efecto)) as mes, count(*) as unidades from mwpolizas_asegurado 
            where cia_code=xCia_code and extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;

resultado text:='';

BEGIN

    FOR cCursor IN curs4 LOOP

        -- añadir cada tupla al array json
        -- [ {"mes":"1", "unidades":"12"}, {"mes":"2", "unidades":"32"}]
        IF resultado = '' THEN
            resultado := row_to_json(cCursor);
        ELSE
            resultado := resultado + ', ' + row_to_json(cCursor) ;
        END IF;
    END LOOP;

 return ('[' + resultado + ']')::json;

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
