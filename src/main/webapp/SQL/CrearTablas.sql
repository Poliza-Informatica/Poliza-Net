--
-- Tetbury Software Services LTD
--
-- SIC 62012 Business and domestic software development

--
createdb poliza-net;
create user polizanet password 'yo';
psql -d poliza-net -U polizanet;



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
    carga_impositiva    numeric(4,2) default 20,
    sociedades          varchar(2) default 'NO',
    criterio_de_caja    varchar(2) default 'NO', -- para los autonomos y empresas acogidas al criterio de caja no paga IVA hasta el ingreso
    presupuestos        varchar(2) default 'NO',
    fiscal_year         char(4) default EXTRACT(year FROM now()),
    periodo             char(2) default EXTRACT(QUARTER FROM now()),
    irpf_profesionales  numeric(4,2) default 21,
    irpf_alquileres     numeric(4,2) default 21,
    iva                 numeric(4,2) default 21,
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
    url_tsa             text,
    escrituras_consti   bytea,
    cero36              bytea
);


insert into datosper (forma_juridica, fiscal_year, periodo, nombre) 
values ('RETA','2016','1','Su nombre comercial');


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
-- Personal Recursos Humanos, además de Recursos humanos externos y colaboradores
-- También representa la tabla de usuarios de la aplicación
--
CREATE TABLE user_app      -- Usuarios de la aplicación
(
    id                  serial NOT NULL,
    tipo                varchar(50),    -- tipo de relación con la empresa empleado, freelance, socio, administrador
    IBAN                varchar(34), -- los dos primeros digitos indican el país ES codigo para españa
    BIC                 varchar(11),
    RedSocial           text,   -- URL del usuario de la red social
    email               varchar(90),
    cargo               varchar(50), -- cargo responsabilidad en la empresa
    estudios            varchar(50), -- nivel de estudios
    categoria           varchar(50), -- categoría profesional
    tipo_contrato       varchar(50), -- tipo de contrato
    SalarioBruto        numeric(8,2), -- salario bruto anual
    NumeroPagas         integer default 14,
    nif                 varchar(20),
    Nombre              varchar(90),
    genero              varchar(10), -- hombre mujer male female
    locale              varchar(2), -- es, uk, etc.
    otros_datos         json,
    servicios           json,
    permisos            json default '{"panel":"yes","clientes":"yes","ventas":"yes","proveedores":"yes","compras":"yes","nominas":"no","bancos":"no","contabilidad":"no"}'::json,
    fecha_nacimiento    date,
    estado_civil        varchar(25),
    fecha_alta          date,
    fecha_baja          date,
    hijos               integer,
    asucargo            integer,
    contrato            bytea,
    certificado         bytea,
    fecha_orden_sepa        date,
    referencia_mandato      varchar(35),
    orden_sepa              bytea, -- orden de domiciliación en formato SEPA
    primary key (id)
);


--INSERT INTO PersonalRRHH (nif, nombre, cargo, tipo, email) 
--    VALUES ('23781553J','Antonio Pérez Caballero','Responsable de producto', 'socio','antonio@redmoon.es');

--INSERT INTO PersonalRRHH (nif, nombre, cargo, tipo, email) 
--    VALUES ('23781554J','Sara Pérez Fajardo','Administración, publicidad y diseño', 'socio','sara@redmoon.es');

INSERT INTO user_app (tipo) 
    VALUES ('administrador');

--INSERT INTO PersonalRRHH (nif, nombre, cargo, tipo, email) 
--    VALUES ('23781555J','Ángel Luis García Sánchez','Desarrollo Java', 'empleado','angel@redmoon.es');


--
-- Clientes agrupados
--
CREATE TABLE customers_grouped
(
   id                       serial      NOT NULL,
   descripcion              varchar(50), -- ejemplo: familia "perez fajardo"
   primary key (id)
);

--
-- Clientes
--

CREATE TABLE customers
(
   id                      serial      NOT NULL,
   id_customers_grouped    integer references customers_grouped(id),
   nif                     varchar(20),
   razon_social            varchar(50),
   apellidos               varchar(50),
   domicilio               varchar(100), 
   cp                      varchar(10),
   localidad               varchar(90), 
   provincia               varchar(50), 
   telefono1               varchar(20),
   telefono2               varchar(20),
   mail                    varchar(150),
   f_nacimiento            varchar(10),
   f_permiso_conducir      varchar(10),
   IBAN                    varchar(34),
   IBAN2                   varchar(34),
   certificado             bytea,
   primary key (id)
);

create index customers_razon_social on customers(razon_social);
create unique index customers_nif on customers(nif);


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
-- Polizas
--
CREATE TABLE Polizas
(
   id                      serial      NOT NULL,
   poliza                  varchar(15),
   documento_adhesion      varchar(15),
   efecto                  varchar(10),
   vencimiento             varchar(10),
   agente                  varchar(50),
   comercial               varchar(50),
   delegado                varchar(50),
   division                varchar(50),
   aseguradora             varchar(50),
   producto                varchar(6),
   nombre_producto         varchar(50),
   riesgo_asegurado        varchar(50),
   forma_pago              varchar(10),
   canal_pago              json,
   cuenta_bancaria         varchar(34),
   phone_asistencia_cia    varchar(20),
   primary key (id)
);


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
CREATE TABLE intervinientes
(
   id                      serial      NOT NULL,
   id_customers            integer references customers(id),
   id_poliza               integer references polizas(id),
   nif                     varchar(20),
   en_calidad_de           varchar(20),
   primary key (id)
);
create index intervinientes_nif on intervinientes(nif);
create index intervinientes_poliza on intervinientes(id_poliza);
create index intervinientes_calidad on intervinientes(en_calidad_de,id_poliza);

--
-- Recibos
--
CREATE TABLE Recibos
(
   id                       serial      NOT NULL,
   id_poliza                integer references polizas(id),
   n_recibo                 varchar(15),
   efecto                   varchar(10),
   vencimiento              varchar(10),
   prima_neta               varchar(15),
   total_recibo             varchar(15),
   comision_bruta           varchar(15),
   liquido_bruto            varchar(15),
   forma_pago               varchar(5),
   canal_pago               varchar(5),
   tipo                     varchar(5),
   estado_cliente           varchar(2),
   fecha_cobro              varchar(10),
   estado_cia               varchar(2),
   fecha_estado_cia         varchar(10)
   comercial                varchar(50),
   comision_comercial       varchar(15),
   estado_comercial         varchar(2),
   f_estado_comercial       varchar(10),
   division                 varchar(50),
   comision_division        varchar(15),
   estado_division          varchar(2),
   f_estado_division        varchar(10),
   delegado                 varchar(50),
   comision_delegado        varchar(15),
   estado_delegado          varchar(2),
   f_estado_delegado        varchar(10),
   agente                   varchar(50),
   comision_agente          varchar(15),
   estado_agente            varchar(2),
   f_estado_agente          varchar(10),
   cobrador                 varchar(50),
   comision_cobrador        varchar(15),
   estado_cobrador          varchar(2),
   f_estado_cobrador        varchar(10),
   primary key (id)
);




-- Siniestros
CREATE TABLE Siniestros
(
   id                       serial      NOT NULL,
   id_poliza                integer references polizas(id),
   expe_agencia             varchar(20),
   expe_cia                 varchar(60),
   fecha_hora_sini          varchar(20),
   lugar                    varchar(15),
   cp                       varchar(2) default 'ES',
   localidad                varchar(10),
   provincia                varchar(90),
   tipo_siniestro           varchar(40),
   situacion                varchar(2)  DEFAULT 'SL',
   fecha_situacion          varchar(20),
   descripcio               text,
   damage_asegurado         text,
   tramitador               varchar(90),
   primary key (id)
);

-- Seguimiento siniestro
CREATE TABLE Seguimiento_siniestro
(
    id                      serial      NOT NULL,
    id_siniestros           integer references siniestros(id),
    fecha_hora              varchar(20),
    texto                   text,
   primary key (id)
);


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