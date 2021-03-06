--
-- Tetbury Software Services LTD
--
-- SIC 62012 Business and domestic software development

--
createdb poliza-net;
alter role polizanet with SUPERUSER PASSWORD 'yo';
create user polizanet with SUPERUSER password 'yo';
psql -d poliza-net -U polizanet;


--
-- Borrar todas las conexiones activas de una base de datos
--
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'poliza-net'
  AND pid <> pg_backend_pid();


--
-- Naturaleza jurídica
--
CREATE TABLE datosper_legal
(
    id                  serial NOT NULL,
    forma_juridica      varchar(60),
    primary key (forma_juridica)
);


INSERT INTO datosper_legal (forma_juridica) VALUES ('SA');
INSERT INTO datosper_legal (forma_juridica) VALUES ('SL');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Sociedades Colectivas');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Sociedades Comanditarias');
INSERT INTO datosper_legal (forma_juridica) VALUES ('COMUNIDAD-BIENES');
INSERT INTO datosper_legal (forma_juridica) VALUES ('COOPERATIVA');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Asociaciones');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Comunidades de propietarios');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Sociedades civiles');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Corporaciones Locales');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Organismos públicos');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Congregaciones e instituciones religiosas');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Órganos Administración Estado y Comunidades Autónomas');
INSERT INTO datosper_legal (forma_juridica) VALUES ('UTE');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Otros tipos no definidos');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Entidades extranjeras');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Empresas Extranjeras no residentes en España');
INSERT INTO datosper_legal (forma_juridica) VALUES ('NIE Extrangeros no residentes');
INSERT INTO datosper_legal (forma_juridica) VALUES ('NIF Extranjeros que no tienen NIE');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Españoles residentes en el extranjero sin DNI');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Españoles menores de 14 años');
INSERT INTO datosper_legal (forma_juridica) VALUES ('Extranjeros Orden INT/2058/2008');
INSERT INTO datosper_legal (forma_juridica) VALUES ('RETA'); -- AUTONOMOS



CREATE TABLE datosper
(
    id                  serial NOT NULL,
    tipo_de_cuenta      integer default 1,
    forma_juridica      varchar(60) references datosper_legal(forma_juridica),
    IBAN                varchar(34), -- los dos primeros digitos indican el país ES codigo para españa
    BIC                 varchar(11), -- puede ser de 8 o de 11 posiciones
    CNAE                varchar(25), -- ejemplo: CNAE J6311: Proceso de datos, hosting y actividades relacionadas o SIC que es el código internacional
    fecha_constitucion  date, -- fecha de constitución de la sociedad
    tipo_actividad      varchar(25) default 'empresarial', -- empresarial o profesional
    otras_reglas        json,
    EntidadPresenta     varchar(4), -- para las domiciliaciones
    OficinaPresenta     varchar(4), -- para las domiciliaciones
    Sufijo              varchar(3)  default '000', -- para las domiciliaciones
    periodicidad_er     integer default 12, -- periodicidad de la emisión de recibos 12 uno por mes,6 cada 2 meses,4 cade tres meses, 2 cada semestre
    EmiteRemesas        varchar(2) default 'NO',
    nif                 char(20),
    nombre              varchar(60),
    direccion           varchar(90), -- Avenida Europa, 21
    objeto              varchar(40), -- bloque A 2ºD
    poblacion           varchar(90), -- 18690 Almuñécar Granada
    Pais_ISO3166        varchar(2) default 'ES',
    movil               varchar(10),
    fax                 varchar(10),
    mail                varchar(90),
    url_web             varchar(250),
    url_tsa             text
);


insert into datosper (forma_juridica, nombre, mail,url_web,url_tsa) 
values ('SL','Prodacon','info@prodacon.es','http://www.prodacon.es','http://tsa.belgium.be/connect');


--
-- Tipos de cuentas
--
CREATE TABLE PoliticaCuentas
(
    id              serial      NOT NULL,
    nombre          varchar(90),
    precio          numeric(8,2),
    duracion        varchar(10), -- mensual, anual, trimestral
    servicios        json,
    primary key (id)
);

--
-- Tipos de cuentas y funciones disponibles
--

INSERT INTO PoliticaCuentas ( id, nombre, precio, duracion, servicios) VALUES ( 1, 'Chanquete Free', 0, 'año',
'{  "Firma": "yes",
    "Burofax":  "no",
    "Almacenamiento": "no",
    "Indexacion":  "no",
    "myHD": "yes",
    "LimiteUsuarios": "1"
}'::json
);

INSERT INTO PoliticaCuentas ( id, nombre, precio, duracion, servicios) VALUES ( 2, 'Boqueron Premiun', 60, 'año',
'{  "Firma": "yes",
    "Burofax":  "no",
    "Almacenamiento": "no",
    "Indexacion":  "no",
    "myHD": "yes",
    "LimiteUsuarios": "5"
}'::json
);

INSERT INTO PoliticaCuentas ( id, nombre, precio, duracion, servicios) VALUES ( 3, 'Pargo Enterprise', 32, 'mes',
'{  "Firma": "yes",
    "Burofax":  "yes",
    "Almacenamiento": "yes",
    "Indexacion":  "yes",
    "myHD": "yes",
    "LimiteUsuarios": "no"
}'::json
);

INSERT INTO PoliticaCuentas ( id, nombre, precio, duracion, servicios) VALUES ( 4, 'Atún Adviser', 35, 'mes',
'{  "Firma": "yes",
    "Burofax":  "no",
    "Almacenamiento": "no",
    "Indexacion":  "no",
    "myHD": "yes",
    "LimiteUsuarios": "no"
}'::json
);



--
-- Crear una base datos para Demo
--

CREATE TABLE identify
(
    codigo          varchar(4) not null,
    entidad         text,
    bic             varchar(11),
    primary key (codigo)
);

--
-- Tabla de compañías aseguradoras
--
CREATE TABLE cias
(
    code        varchar(2) not null,
    nombre      varchar(50),
    logotipo    bytea,
    primary key (code)
);



--
-- Representa la tabla de usuarios de la aplicación
--
CREATE TABLE user_app      -- Usuarios de la aplicación
(
    id                  serial NOT NULL,
    tipo                varchar(50),    -- tipo de relación con la empresa empleado, freelance, socio, administrador
    RedSocial           text,   -- URL del usuario de la red social
    email               varchar(90),
    cargo               varchar(50), -- cargo responsabilidad en la empresa
    nif                 varchar(20),
    Nombre              varchar(90),
    genero              varchar(10), -- hombre mujer male female
    locale              varchar(2), -- es, uk, etc.
    otros_datos         json,
    servicios           json,
    permisos            json default '{"panel":"yes","clientes":"yes","ventas":"yes","proveedores":"yes"}'::json,
    asucargo            integer,
    certificado         bytea,
    primary key (id)
);


--INSERT INTO PersonalRRHH (nif, nombre, cargo, tipo, email) 
--    VALUES ('23781553J','Antonio Pérez Caballero','Responsable de producto', 'socio','antonio@redmoon.es');

--INSERT INTO PersonalRRHH (nif, nombre, cargo, tipo, email) 
--    VALUES ('23781554J','Sara Pérez Fajardo','Administración, publicidad y diseño', 'socio','sara@redmoon.es');

INSERT INTO user_app (tipo,email,nif,nombre) 
    VALUES ('administrador','antoniocastillo@prodacon.es','suNIF','Antonio');
INSERT INTO user_app (tipo,email,nif,nombre) 
    VALUES ('developer','rcastro@polizainformatica.es','suNIF','Rubén');
INSERT INTO user_app (tipo,email,nif,nombre) 
    VALUES ('developer','jesus@polizainformatica.es','suNIF','Jesus');
INSERT INTO user_app (tipo,email,nif,nombre) 
    VALUES ('developer','antonio.gialnet@gmail.com','23781553J','Antonio');

--INSERT INTO PersonalRRHH (nif, nombre, cargo, tipo, email) 
--    VALUES ('23781555J','Ángel Luis García Sánchez','Desarrollo Java', 'empleado','angel@redmoon.es');


--
-- Clientes
--


CREATE TABLE customers
(
   nif                 varchar(20) NOT NULL,
   razon_social        varchar(50),
   apellidos           varchar(50),
   domicilio           varchar(100),
   cp                  varchar(10),
   localidad           varchar(90),
   provincia           varchar(50),
   telefono1           varchar(20),
   telefono2           varchar(20),
   mail                varchar(150),
   f_nacimiento        varchar(10),
   f_permiso_conducir  varchar(10),
   iban                varchar(34),
   iban2               varchar(34),
   certificado         bytea,
   primary key (nif)
);


create index customers_razon_social on customers(razon_social);

--
-- Clientes agrupados
--
CREATE TABLE customers_groups
(
   codigo  varchar(6)     NOT NULL,
   nombre  varchar(50)
);

ALTER TABLE customers_groups
   ADD CONSTRAINT customers_groups_pkey
   PRIMARY KEY (codigo);



CREATE TABLE customers_grouped
(
   codigo_group  varchar(6)     NOT NULL,
   nif           varchar(20)    NOT NULL
);

ALTER TABLE customers_grouped
   ADD CONSTRAINT customers_grouped_pkey
   PRIMARY KEY (codigo_group, nif);

ALTER TABLE customers_grouped
  ADD CONSTRAINT customers_grouped_customers_fkey FOREIGN KEY (nif)
  REFERENCES customers (nif)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;

ALTER TABLE customers_grouped
  ADD CONSTRAINT customers_grouped_groups_fkey FOREIGN KEY (codigo_group)
  REFERENCES customers_groups (codigo)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;





--
-- Coberturas
--
CREATE TABLE coberturas
(
   id                      serial      NOT NULL,
   descripcion             text,
   primary key (id)
);

--
-- Productos
--
CREATE TABLE Productos
(
    code_cia            varchar(2) NOT NULL,
    code_product        varchar(6) NOT NULL,
    descripcion         text,
    primary key (code_cia,code_product)
);

-- ******************** CREATE INDEX users_search_idx ON users USING gin (first_name gin_trgm_ops, last_name gin_trgm_ops);

--
-- Pólizas
--
CREATE TABLE polizas
(
   id                  integer NOT NULL,
   code_cia            varchar(2),
   producto            varchar(6),
   poliza              varchar(15),
   documento_adhesion  varchar(15),
   efecto              varchar(20),
   vencimiento         varchar(20),
   riesgo_asegurado    varchar(50),
   forma_pago          varchar(10),
   canal_pago          varchar(10),
   iban                varchar(34),
   gestor              varchar(6),
   mediador1           varchar(6),
   mediador2           varchar(6),
   cobrador            varchar(6),
   comercial           varchar(6),
   motivo_anulacion    varchar(50),
   fecha_anulacion     varchar(20),
   primary key (id)
);

-- Column id is associated with sequence public.polizas_id_seq


ALTER TABLE polizas
  ADD CONSTRAINT polizas_code_cia_fkey FOREIGN KEY (code_cia)
  REFERENCES cias (code)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;

CREATE INDEX polizas_poliza ON polizas USING btree (poliza);
CREATE INDEX polizas_riesgo ON polizas USING btree (riesgo_asegurado);


--
-- Coberturas de una poliza
--
CREATE TABLE coberturas_poliza
(
   id                      serial      NOT NULL,
   id_poliza               integer references polizas(id),
   id_coberturas           integer references coberturas(id),
   descripcion             text,
   primary key (id)
);


--
-- Intervinientes, lista de tomadores
--
CREATE TABLE public.intervinientes
(
  id integer NOT NULL,
  id_poliza integer NOT NULL,
  nif character varying(20),
  en_calidad_de character varying(20),
  CONSTRAINT intervinientes_pkey PRIMARY KEY (id, id_poliza),
  CONSTRAINT customers_fkey FOREIGN KEY (nif)
      REFERENCES public.customers (nif) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT polizas_fkey FOREIGN KEY (id_poliza)
      REFERENCES public.polizas (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.intervinientes
  OWNER TO polizanet;

-- Index: public.intervinientes_calidad

-- DROP INDEX public.intervinientes_calidad;

CREATE INDEX intervinientes_calidad
  ON public.intervinientes
  USING btree
  (en_calidad_de COLLATE pg_catalog."default", id_poliza);

-- Index: public.intervinientes_nif

-- DROP INDEX public.intervinientes_nif;

CREATE INDEX intervinientes_nif
  ON public.intervinientes
  USING btree
  (nif COLLATE pg_catalog."default");

-- Index: public.intervinientes_poliza

-- DROP INDEX public.intervinientes_poliza;

CREATE INDEX intervinientes_poliza
  ON public.intervinientes
  USING btree
  (id_poliza);



CREATE TABLE intervinientes
(
   id             serial         NOT NULL,
   id_poliza      integer,
   nif            varchar(20),
   en_calidad_de  varchar(20),
   primary key (id)
);

create index intervinientes_nif on intervinientes(nif);
create index intervinientes_poliza on intervinientes(id_poliza);
create index intervinientes_calidad on intervinientes(en_calidad_de,id_poliza);

/*
ALTER TABLE intervinientes
  ADD CONSTRAINT intervinientes_poliza FOREIGN KEY (id_poliza)
  REFERENCES polizas (id)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;
*/


--
-- Recibos
--
CREATE TABLE public.recibos
(
  id integer NOT NULL,
  id_poliza integer,
  n_recibo character varying(15),
  fecha_efecto character varying(10),
  fecha_vencimiento character varying(10),
  prima_neta character varying(15),
  total_recibo character varying(15),
  comision character varying(15),
  retencion character varying(15),
  liquido character varying(15),
  forma_pago character varying(20),
  canal_pago character varying(20),
  tipo character varying(20),
  estado_cliente character varying(20),
  fecha_estado_cliente character varying(10),
  estado_cia character varying(20),
  fecha_estado_cia character varying(10),
  gestor character varying(6),
  gestor_comision character varying(15),
  gestor_retencion character varying(15),
  gestor_estado  character varying(20),
  gestor_fecha_estado character varying(10),
  mediador1 character varying(6),
  mediador1_comision character varying(15),
  mediador1_retencion character varying(15),
  mediador1_estado  character varying(20),
  mediador1_fecha_estado character varying(10),
  mediador2 character varying(6),
  mediador2_comision character varying(15),
  mediador2_retencion character varying(15),
  mediador2_estado  character varying(20),
  mediador2_fecha_estado character varying(10),
  cobrador character varying(6),
  cobrador_comision character varying(15),
  cobrador_retencion character varying(15),
  cobrador_estado  character varying(20),
  cobrador_fecha_estado character varying(10),
  comercial character varying(6),
  comercial_comision character varying(15),
  comercial_retencion character varying(15),
  comercial_estado  character varying(20),
  comercial_fecha_estado character varying(10),
  CONSTRAINT recibos_pkey PRIMARY KEY (id),
  CONSTRAINT recibos_id_poliza_fkey FOREIGN KEY (id_poliza)
      REFERENCES public.polizas (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.recibos
  OWNER TO polizanet;

CREATE TABLE recibos
(
   id                  integer         NOT NULL,
   id_poliza           integer,
   n_recibo            varchar(15),
   efecto              varchar(10),
   vencimiento         varchar(10),
   prima_neta          varchar(15),
   total_recibo        varchar(15),
   comision_bruta      varchar(15),
   liquido_bruto       varchar(15),
   forma_pago          varchar(5),
   canal_pago          varchar(5),
   tipo                varchar(5),
   estado_cliente      varchar(2),
   fecha_cobro         varchar(10),
   estado_cia          varchar(2),
   fecha_estado_cia    varchar(10),
   comercial           varchar(50),
   comision_comercial  varchar(15),
   estado_comercial    varchar(2),
   f_estado_comercial  varchar(10),
   division            varchar(50),
   comision_division   varchar(15),
   estado_division     varchar(2),
   f_estado_division   varchar(10),
   delegado            varchar(50),
   comision_delegado   varchar(15),
   estado_delegado     varchar(2),
   f_estado_delegado   varchar(10),
   agente              varchar(50),
   comision_agente     varchar(15),
   estado_agente       varchar(2),
   f_estado_agente     varchar(10),
   cobrador            varchar(50),
   comision_cobrador   varchar(15),
   estado_cobrador     varchar(2),
   f_estado_cobrador   varchar(10),
   primary key (id)
);

-- Column id is associated with sequence public.recibos_id_seq


ALTER TABLE recibos
  ADD CONSTRAINT recibos_id_poliza_fkey FOREIGN KEY (id_poliza)
  REFERENCES polizas (id)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;



--
-- Siniestros
--

CREATE TABLE siniestros
(
   expe_agencia      varchar(20)    NOT NULL,
   id_poliza         integer,
   expe_cia          varchar(20),
   fecha_hora_sini   varchar(20),
   lugar             varchar(50),
   cp                varchar(5),
   localidad         varchar(50),
   provincia         varchar(50),
   tipo_siniestro    varchar(40),
   situacion         varchar(2),
   fecha_situacion   varchar(20),
   descripcion       text,
   damage_asegurado  text,
   tramitador        varchar(90),
   primary key (expe_agencia)
);


ALTER TABLE siniestros
  ADD CONSTRAINT siniestros_polizas_fkey FOREIGN KEY (id_poliza)
  REFERENCES polizas (id)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;


--
-- Seguimiento siniestro
--

CREATE TABLE seguimiento_siniestro
(
   id            integer         NOT NULL,
   id_siniestro  varchar(20),
   fecha_hora    varchar(20),
   texto         text,
   doc           bytea,
   primary key (id)
);

-- Column id is associated with sequence public.seguimiento_siniestro_id_seq

ALTER TABLE seguimiento_siniestro
  ADD CONSTRAINT seguimiento_siniestros_fkey FOREIGN KEY (id_siniestro)
  REFERENCES siniestros (expe_agencia)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;



-- Archivo documental

-- **********************************************************************
--                              myHD
-- **********************************************************************

--
-- Tabla que custodia los documentos que se han generado fuera del sistema y son
-- incorporados por los usuarios.
--

CREATE TABLE doc_custodia (
    id serial  NOT NULL,
    id_user Integer,
    tipo    varchar(15) default 'clientes',--clientes | terceros | personal
    filename varchar(250),
    fecha TIMESTAMP default now(),
    hash_algo varchar(128), -- almacenar la representación del algoritmo en hexadecimal sha1 sha224/256/384/512
    url_nube  text,
    fichero bytea,
    PRIMARY KEY (id)
);

COMMENT ON TABLE doc_custodia IS 'Tabla que almacena los documentos, sus firmas y demas metadatos';
create index doc_custodia_FILENAME on doc_custodia(FILENAME);
create index doc_custodia_hash_algo on doc_custodia(hash_algo);


--
-- 
--

CREATE TABLE doc_compartir (
    id serial  NOT NULL,
    id_doc INTEGER references doc_custodia(id),
    id_personal_rrhh INTEGER,
    id_share        Integer, -- id del usuario al que se le comparte un docuemnto, hace referencia a un customer o a personal
    tipo_share    varchar(15) default 'clientes', --clientes | terceros | personal que indica el tipo de usuario de id_share
    n_lecturas INTEGER DEFAULT 0,
    PRIMARY KEY (id)
);

COMMENT ON TABLE doc_compartir IS 'Tabla que almacena los apuntes de quien puede ver los docuementos';

-- 
-- Carpetas de documentos, son vistas de lista de documentos asociadas 
-- a un nombre de carpeta, mediante el origen diferenciamos las carpetas en 
-- función de su origen de creación interno o externo.
--


CREATE TABLE CARPETA (
    ID              SERIAL not null,
    ID_USUARIO      INTEGER,
    tipo_usuario    varchar(15) default 'clientes',--clientes | terceros | personal que indica el tiepo de usaurio de id_share
    NOMBRE          varchar(100),
    FECHA TIMESTAMP default now(),
    origen  varchar(25) default 'system', -- system o external la carpeta es creada y utilizada por el sistema el usuario no la puede eliminar
    primary key(id)
);

--
-- relación de los documentos con sus carpetas
--

CREATE TABLE CARPETA_DOC (
    ID_CARPETA integer references CARPETA(id),
    ID_DOC INTEGER references doc_custodia(id)
   
);


--
-- Add table "CUENTAS_EMPLEADO_CLIENTE"    
-- En esta tabla solo estarán los clientes que atiende directamente el administrador                                            
--

CREATE TABLE CUENTAS_EMPLEADO_CLIENTE (
    ID_EMPLEADO integer references PersonalRRHH(id),
    ID_CLIENTE INTEGER references customers(id)
   
);


--
-- Crear una tabla que contiene una referencia a todos los documentos
--

CREATE TABLE doc_world (
    id 				serial NOT NULL,
    tipo    			varchar(15) default 'tabla', --tabla | proceso
    tabla_proceso_name          varchar(250),
    id_tabla_proceso		integer,
    numero_doc                  integer, -- para las tablas que tienen más de un campo bytea saber cual buscamos
    hash_algo    		varchar(128),
    PRIMARY KEY (id)
);
create index doc_world_tabla_proceso_name on doc_world(tabla_proceso_name);
create index doc_world_id_tabla_proceso on doc_world(id_tabla_proceso);
create index doc_world_hash_algo on doc_world(hash_algo);

--
-- Firmas y sellos de tiempo de un documento
--
CREATE TABLE firmas_doc_world (
    id 				serial NOT NULL,
    id_doc_world 		integer references doc_world(id),
    formato_firma		varchar(15) default 'PAdES_LTV',
    sello_tiempo		bytea,
    firma			bytea,
    PRIMARY KEY (id)
);
create index firmas_doc_world_id_doc_world on firmas_doc_world(id_doc_world);

--
-- Log de sesión de Terceros (de los clientes de nuestros clientes)
--
CREATE TABLE LogSesionTerceros
(
    id                  serial      NOT NULL,
    Fecha               TIMESTAMP default now(),
    ip                  varchar(20),
    hostname            varchar(90),
    mail                varchar(90),
    URI                 text,
    primary key (id)
);