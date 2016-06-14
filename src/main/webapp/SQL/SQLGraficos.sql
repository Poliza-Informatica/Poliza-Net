
--
-- Producción por codigo de clasificación
--
select c.codigo,c.descripcion,count(*) as cuantos from polizas p, productos s, clasificacion_productos c, ramos r
where p.producto=s.code_product 
and p.anulado=0
and c.codigo=r.codigo_clasificacion
and r.code_ramo=s.code_ramo
group by c.codigo
order by cuantos desc;

=>
000001	AUTOMOVILES	905
000002	DIVERSOS	478
000003	VIDA             52
                       -----
                       1435

select count(*) as cuantos from polizas where anulado=0;            => 1435