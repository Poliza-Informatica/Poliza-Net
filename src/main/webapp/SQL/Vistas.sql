--
-- Tetbury Software Services LTD
--
-- SIC 62012 Business and domestic software development
--

create or replace view vw_clientes (nombre,nif,domicilio,cp,localidad,telefono1,telefono2,mail,f_nacimiento,f_permiso_conducir,iban,iban2) 
    as select concat(razon_social,' ', apellidos),nif,domicilio,cp,localidad,telefono1,telefono2,mail,f_nacimiento,f_permiso_conducir,iban,iban2
 from customers;



create materialized view mv_clientes (nombre,nif,domicilio,cp,localidad,telefono1,telefono2,mail,f_nacimiento,f_permiso_conducir,iban,
        iban2,buscar) 
    as select concat(razon_social,' ', apellidos),nif,domicilio,cp,localidad,telefono1,telefono2,mail,f_nacimiento,f_permiso_conducir,iban,iban2,
    concat(razon_social,' ',apellidos,' ', nif,' ', domicilio,' ',localidad,' ', telefono1,' ', telefono2,' ', mail,' ', iban,' ', iban2)
 from customers;

create index mv_clientes_buscar on mv_clientes(buscar);

drop materialized view mv_clientes;


-- vista de las polizas de un asegurado

create or replace view vwpolizas_tomador (ID,poliza,documento_adhesion,efecto,vencimiento,code_cia, nif, en_calidad_de) 
as select  P.id,P.poliza,P.documento_adhesion,P.efecto,P.vencimiento,P.code_cia,I.nif, I.en_calidad_de 
FROM Polizas P, Intervinientes I
WHERE P.id=I.id_poliza and I.en_calidad_de='TOMADOR';

-- ejemplo de uso
-- todas las polizas donde aparezco como asegurado
select * from vwpolizas_tomador where nif='23781553J';

-- Todas las polizas donde apareco en calidad de cualquier figura
select nif,id_customers,id_poliza,en_calidad_de from Intervinientes where nif='23781553J';

select I.nif, C.razon_social, I.en_calidad_de, P.poliza,P.documento_adhesion,P.efecto,P.vencimiento,P.aseguradora 
    from Intervinientes I, Polizas P, Customers C where I.nif='23781553J' and P.id=I.id_poliza and C.id=I.id_customers;

--
-- vista de las polizas de un cliente agrupado
--

create or replace view vwpolizas_asegurado (nombre, nif,en_calidad_de, poliza,documento_adhesion,efecto,vencimiento,code_cia) 
as select  C.nombre, I.nif, I.en_calidad_de, P.poliza,P.documento_adhesion,P.efecto,P.vencimiento,P.code_cia
FROM Polizas P, Intervinientes I, mv_clientes C
WHERE P.id=I.id_poliza and I.en_calidad_de='TOMADOR' and c.nif=I.nif;

create materialized view mwpolizas_asegurado (id,nombre, nif,en_calidad_de, poliza,riesgo_asegurado,efecto,vencimiento,
    cia_code,cia_name, iban,tlf1,tlf2,email, buscar) 
as select  P.id,C.nombre, I.nif, I.en_calidad_de, P.poliza,P.riesgo_asegurado,P.efecto,P.vencimiento,P.code_cia,m.nombre,P.iban,
C.telefono1,C.telefono2,C.mail,
concat(C.nombre,' ', I.nif,' ', P.riesgo_asegurado)
FROM Polizas P, Intervinientes I, mv_clientes C, Cias M
WHERE P.id=I.id_poliza and I.en_calidad_de='TOMADOR' and c.nif=I.nif and P.code_cia=M.code;

create index mwpolizas_asegurado_buscar on mwpolizas_asegurado(buscar);

refresh materialized view mwpolizas_asegurado;

drop materialized view mwpolizas_asegurado;





/* ****************************************************

Recibos

******************************************************* */

create or replace view vw () as select from where


-- TuplasRecibosClientes
create or replace view vwrecibos_clientes (id, id_poliza,n_recibo,efecto,vencimiento,prima_neta,total_recibo,forma_pago,canal_pago,
    tipo, estado_cliente,fecha_cobro,estado_cia,fecha_estado_cia,nif) 
as select R.id,R.id_poliza,R.n_recibo,R.efecto,R.vencimiento,R.prima_neta,R.total_recibo,R.forma_pago,R.canal_pago,
    R.estado_cliente,R.fecha_cobro,R.estado_cia,R.fecha_estado_cia,P.nif
from recibos R, polizas P
where R.id_poliza = P.id;

