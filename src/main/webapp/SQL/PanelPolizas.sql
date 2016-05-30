--
-- Datos del Panel de Control de Pólizas
--


--
-- Ventas por mes en número de recibos
--
CREATE OR REPLACE FUNCTION  ProduccionByNumeroVentas(
    xYear in INTEGER
) 
returns text
AS
$body$
DECLARE

    curs4 CURSOR IS select extract(MONTH from date(efecto))::text as mes, count(*)::text as unidades from mwpolizas_asegurado 
            where extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;

resultado text:='';
resjson json;
BEGIN

    FOR cCursor IN curs4 LOOP

        -- añadir cada tupla al array json
        -- [ {"mes":"1", "unidades":"12"}, {"mes":"2", "unidades":"32"}]
        IF resultado = '' THEN
            resultado := row_to_json(cCursor);
            -- raise notice 'contenido resultado: %', resultado;
        ELSE
            resjson := row_to_json(cCursor);
            resultado := resultado || ', ' || cast(resjson as text);
        END IF;
    END LOOP;

 -- raise notice 'contenido resultado: %', resultado;
 return '[' || resultado || ']';

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
    xYear in integer
) 
returns text
AS
$body$
DECLARE

    curs4 CURSOR IS select extract(MONTH from date(efecto))::text as mes, sum(to_number(total_recibo, '999999.99'))::text as unidades from vwrecibos_clientes 
            where extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;

    resultado text:='';
    resjson json;
    
BEGIN

    FOR cCursor IN curs4 LOOP

        -- añadir cada tupla al array json
        -- [ {"mes":"1", "unidades":"12"}, {"mes":"2", "unidades":"32"}]
        IF resultado = '' THEN
            resultado := row_to_json(cCursor);
            -- raise notice 'contenido resultado: %', resultado;
        ELSE
            resjson := row_to_json(cCursor);
            resultado := resultado || ', ' || cast(resjson as text);
        END IF;
    END LOOP;

 -- raise notice 'contenido resultado: %', resultado;
 return '[' || resultado || ']';

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
    xYear in integer
) 
returns text
AS
$body$
DECLARE

    curs4 CURSOR IS select extract(MONTH from date(efecto))::text as mes, sum(to_number(comision, '999999.99'))::text as unidades from vwrecibos_clientes 
            where extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;

    resultado text:='';
    resjson json;
    
BEGIN


    FOR cCursor IN curs4 LOOP

        -- añadir cada tupla al array json
        -- [ {"mes":"1", "unidades":"12"}, {"mes":"2", "unidades":"32"}]
        IF resultado = '' THEN
            resultado := row_to_json(cCursor);
            -- raise notice 'contenido resultado: %', resultado;
        ELSE
            resjson := row_to_json(cCursor);
            resultado := resultado || ', ' || cast(resjson as text);
        END IF;
    END LOOP;

 -- raise notice 'contenido resultado: %', resultado;
 return '[' || resultado || ']';

END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
SECURITY INVOKER
COST 100;

--
-- Ventas por mes en número de recibos
--
CREATE OR REPLACE FUNCTION  CiaProduccionByNumeroVentas(
    xYear in INTEGER,
    xCia_code in varchar
) 
returns text
AS
$body$
DECLARE

    curs5 CURSOR IS select extract(MONTH from date(efecto)) as mes, count(*) as unidades from mwpolizas_asegurado 
            where cia_code=xCia_code and extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;

resultado text:='';
resjson json;
BEGIN

    FOR cCursor IN curs5 LOOP

        -- añadir cada tupla al array json
        -- [ {"mes":"1", "unidades":"12"}, {"mes":"2", "unidades":"32"}]
        IF resultado = '' THEN
            resultado := row_to_json(cCursor);
            -- raise notice 'contenido resultado: %', resultado;
        ELSE
            resjson := row_to_json(cCursor);
            resultado := resultado || ', ' || cast(resjson as text);
        END IF;
    END LOOP;

 -- raise notice 'contenido resultado: %', resultado;
 return '[' || resultado || ']';

END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
SECURITY INVOKER
COST 100;


--
-- Ventas por mes en importe total recibo
--
CREATE OR REPLACE FUNCTION  CiaImportePorMes(
    xYear in integer,
    xCia_code in varchar
) 
returns text
AS
$body$
DECLARE

    curs5 CURSOR IS select extract(MONTH from date(efecto)) as mes, sum(to_number(total_recibo, '999999.99')) as unidades from vwrecibos_clientes 
            where cia_code=xCia_code and extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;

    resultado text:='';
    resjson json;
    
BEGIN

    FOR cCursor IN curs5 LOOP

        -- añadir cada tupla al array json
        -- [ {"mes":"1", "unidades":"12"}, {"mes":"2", "unidades":"32"}]
        IF resultado = '' THEN
            resultado := row_to_json(cCursor);
            -- raise notice 'contenido resultado: %', resultado;
        ELSE
            resjson := row_to_json(cCursor);
            resultado := resultado || ', ' || cast(resjson as text);
        END IF;
    END LOOP;

 -- raise notice 'contenido resultado: %', resultado;
 return '[' || resultado || ']';

END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
SECURITY INVOKER
COST 100;

--
-- Comisiones por mes
--
CREATE OR REPLACE FUNCTION  CiaComisionesPorMes(
    xYear in varchar,
    xCia_code in varchar
) 
returns text
AS
$body$
DECLARE

    curs5 CURSOR IS select extract(MONTH from date(efecto)) as mes, sum(to_number(comision, '999999.99')) as unidades from vwrecibos_clientes 
            where cia_code=xCia_code and extract(ISOYEAR from date(efecto)) = xYear
            group by mes
            order by mes;

    resultado text:='';
    resjson json;
    
BEGIN


    FOR cCursor IN curs5 LOOP

        -- añadir cada tupla al array json
        -- [ {"mes":"1", "unidades":"12"}, {"mes":"2", "unidades":"32"}]
        IF resultado = '' THEN
            resultado := row_to_json(cCursor);
            -- raise notice 'contenido resultado: %', resultado;
        ELSE
            resjson := row_to_json(cCursor);
            resultado := resultado || ', ' || cast(resjson as text);
        END IF;
    END LOOP;

 -- raise notice 'contenido resultado: %', resultado;
 return '[' || resultado || ']';

END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
SECURITY INVOKER
COST 100;

--
--
--
CREATE OR REPLACE FUNCTION  PanelPolizas(
    xYear in integer
) 
returns text
AS
$body$
DECLARE

    NumeroVentasCurrent text;
    NumeroVentasPrevious text;
    ByTotalCurrent text;
    ByTotalPrevious text;
    ByComisionCurrent text;
    ByComisionPrevious text;

BEGIN

    
    SELECT ProduccionByNumeroVentas(xYear) INTO NumeroVentasCurrent;
    SELECT ProduccionByNumeroVentas(xYear-1) INTO NumeroVentasPrevious;

    SELECT ImportePorMes(xYear) INTO ByTotalCurrent;
    SELECT ImportePorMes(xYear-1) INTO ByTotalPrevious;

    SELECT ComisionesPorMes(xYear) INTO ByComisionCurrent;
    SELECT ComisionesPorMes(xYear-1) INTO ByComisionPrevious;

    return '[' ||   NumeroVentasCurrent || ', '|| 
                    NumeroVentasPrevious || ', '|| 
                    ByTotalCurrent || ', '||
                    ByTotalPrevious || ', '||
                    ByComisionCurrent || ', '||
                    ByComisionPrevious || ']';

END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
SECURITY INVOKER
COST 100;

--
-- Por Compañías
--
CREATE OR REPLACE FUNCTION  CiaPanelPolizas(
    xYear in integer,
    xCia_code in varchar,
    NumeroVentasCurrent out json,
    NumeroVentasPrevious out json,
    ByTotalCurrent out json,
    ByTotalPrevious out json,
    ByComisionCurrent out json,
    ByComisionPrevious out json
) 
returns RECORD
AS
$body$
DECLARE

    
BEGIN

    
    SELECT ProduccionByNumeroVentas(xYear,'00') INTO NumeroVentasCurrent;
    SELECT ProduccionByNumeroVentas(xYear-1,'00') INTO NumeroVentasPrevious;

    SELECT CiaImportePorMes(xYear,'00') INTO ByTotalCurrent;
    SELECT CiaImportePorMes(xYear-1,'00') INTO ByTotalPrevious;

    SELECT CiaComisionesPorMes(xYear,'00') INTO ByComisionCurrent;
    SELECT CiaComisionesPorMes(xYear-1,'00') INTO ByComisionPrevious;

END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
SECURITY INVOKER
COST 100;
