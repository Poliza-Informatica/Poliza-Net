--
-- Tetbury Software Services LTD
--
-- SIC 62012 Business and domestic software development
--

-- vista de las polizas de un asegurado

create or replace view vwpolizas_asegurado (poliza,documento_adhesion,efecto,vencimiento,aseguradora, nif, en_calidad_de) 
as select  P.poliza,P.documento_adhesion,P.efecto,P.vencimiento,P.aseguradora,I.nif, I.en_calidad_de 
FROM Polizas P, Intervinientes I
WHERE P.id=I.id_poliza and I.en_calidad_de='tomador';

-- ejemplo de uso
-- todas las polizas donde aparezco como asegurado
select * from vwpolizas_asegurado where nif='23781553J';

-- Todas las polizas donde apareco en calidad de cualquier figura
select nif,id_customers,id_poliza,en_calidad_de from Intervinientes where nif='23781553J';

select I.nif, C.razon_social, I.en_calidad_de, P.poliza,P.documento_adhesion,P.efecto,P.vencimiento,P.aseguradora 
    from Intervinientes I, Polizas P, Customers C where I.nif='23781553J' and P.id=I.id_poliza and C.id=I.id_customers;

-- vista de las polizas de un cliente agrupado

create or replace view vwpolizas_asegurado (poliza,documento_adhesion,efecto,vencimiento,aseguradora, nif, en_calidad_de) 
as select  P.poliza,P.documento_adhesion,P.efecto,P.vencimiento,P.aseguradora,I.nif, I.en_calidad_de 
FROM Polizas P, Intervinientes I, Customers C
WHERE P.id=I.id_poliza and I.en_calidad_de='tomador';