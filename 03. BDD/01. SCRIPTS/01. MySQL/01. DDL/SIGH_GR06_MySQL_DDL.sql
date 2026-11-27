/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     4/11/2026 7:51:22                            */
/*==============================================================*/


drop table if exists ADMISION;

drop table if exists AGENDA_MEDICA;

drop table if exists ALERGIA;

drop table if exists ANTECEDENTE_CLINICO;

drop table if exists AREA_HOSPITALARIA;

drop table if exists ASIGNACION_CAMA;

drop table if exists AUDITORIA;

drop table if exists CAMA;

drop table if exists CARGO;

drop table if exists CITA;

drop table if exists CONSULTA_MEDICA;

drop table if exists CONSULTORIO;

drop table if exists CONTACTO_EMERGENCIA;

drop table if exists DETALLE_DISPENSACION;

drop table if exists DETALLE_FACTURA;

drop table if exists DETALLE_PRESCRIPCION;

drop table if exists DETALLE_SOLICITUD_LABORATORIO;

drop table if exists DIAGNOSTICO;

drop table if exists DISPENSACION;

drop table if exists EPISODIO_ATENCION;

drop table if exists ESPECIALIDAD;

drop table if exists ESTUDIO_IMAGEN;

drop table if exists FACTURA;

drop table if exists HABITACION;

drop table if exists HISTORIAL_CITA;

drop table if exists HISTORIA_CLINICA;

drop table if exists INFORME_IMAGEN;

drop table if exists LOTE;

drop table if exists MEDICAMENTO;

drop table if exists MOVIMIENTO_INVENTARIO;

drop table if exists NOTA_CLINICA;

drop table if exists NOTA_ENFERMERIA;

drop table if exists PACIENTE;

drop table if exists PAGO;

drop table if exists PARTICIPACION_QUIRURGICA;

drop table if exists PERMISO;

drop table if exists PRESCRIPCION;

drop table if exists PROCEDIMIENTO_QUIRURGICO;

drop table if exists PROFESIONAL;

drop table if exists PROFESIONAL_ESPECIALIDAD;

drop table if exists PRUEBA_LABORATORIO;

drop table if exists RESULTADO_LABORATORIO;

drop table if exists ROL;

drop table if exists ROL_PERMISO;

drop table if exists SERVICIO_FACTURABLE;

drop table if exists SESION_USUARIO;

drop table if exists SIGNO_VITAL;

drop table if exists SOLICITUD_LABORATORIO;

drop table if exists TRIAJE_EMERGENCIA;

drop table if exists USUARIO;

drop table if exists USUARIO_ROL;

/*==============================================================*/
/* Table: ADMISION                                              */
/*==============================================================*/
create table ADMISION
(
   ADMISION_ID_ADMISION int not null,
   ASIGNACION_CAMA_ID_ASIGNACION int not null,
   ADMISION_FECHA_INGRESO datetime not null,
   ADMISION_FECHA_ALTA  datetime,
   ADMISION_TIPO        char(40) not null,
   ADMISION_ESTADO      char(30) not null,
   primary key (ADMISION_ID_ADMISION)
);

alter table ADMISION comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: AGENDA_MEDICA                                         */
/*==============================================================*/
create table AGENDA_MEDICA
(
   AGENDA_MEDICA_ID_AGENDA int not null,
   CITA_ID_CITA         int not null,
   AGENDA_MEDICA_INICIO datetime not null,
   AGENDA_MEDICA_FIN    datetime not null,
   AGENDA_MEDICA_DURACION_MINUTOS int not null,
   AGENDA_MEDICA_ESTADO char(30) not null,
   primary key (AGENDA_MEDICA_ID_AGENDA)
);

alter table AGENDA_MEDICA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: ALERGIA                                               */
/*==============================================================*/
create table ALERGIA
(
   ALERGIA_ID_ALERGIA   int not null,
   ALERGIA_SUSTANCIA    char(120) not null,
   ALERGIA_REACCION     char(200),
   ALERGIA_SEVERIDAD    char(30),
   ALERGIA_ESTADO_CONFIRMACION char(30) not null,
   ALERGIA_FECHA_REGISTRO datetime not null,
   primary key (ALERGIA_ID_ALERGIA)
);

alter table ALERGIA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: ANTECEDENTE_CLINICO                                   */
/*==============================================================*/
create table ANTECEDENTE_CLINICO
(
   ANTECEDENTE_CLINICO_ID_ANTECEDENTE int not null,
   ANTECEDENTE_CLINICO_TIPO char(50) not null,
   ANTECEDENTE_CLINICO_DESCRIPCION char(254) not null,
   ANTECEDENTE_CLINICO_FECHA_REGISTRO datetime not null,
   primary key (ANTECEDENTE_CLINICO_ID_ANTECEDENTE)
);

alter table ANTECEDENTE_CLINICO comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: AREA_HOSPITALARIA                                     */
/*==============================================================*/
create table AREA_HOSPITALARIA
(
   AREA_HOSPITALARIA_ID_AREA int not null,
   HABITACION_ID_HABITACION int not null,
   AREA_HOSPITALARIA_NOMBRE char(100) not null,
   AREA_HOSPITALARIA_TIPO char(50) not null,
   primary key (AREA_HOSPITALARIA_ID_AREA)
);

alter table AREA_HOSPITALARIA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: ASIGNACION_CAMA                                       */
/*==============================================================*/
create table ASIGNACION_CAMA
(
   ASIGNACION_CAMA_ID_ASIGNACION int not null,
   ASIGNACION_CAMA_FECHA_INICIO datetime not null,
   ASIGNACION_CAMA_FECHA_FIN datetime,
   ASIGNACION_CAMA_MOTIVO_SALIDA char(150),
   primary key (ASIGNACION_CAMA_ID_ASIGNACION)
);

alter table ASIGNACION_CAMA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: AUDITORIA                                             */
/*==============================================================*/
create table AUDITORIA
(
   AUDITORIA_ID_AUDITORIA int not null,
   AUDITORIA_ACCION     char(100) not null,
   AUDITORIA_ENTIDAD    char(100) not null,
   AUDITORIA_IDENTIFICADOR_OBJETO char(100),
   AUDITORIA_FECHA_EVENTO datetime not null,
   AUDITORIA_DETALLE    char(254),
   primary key (AUDITORIA_ID_AUDITORIA)
);

alter table AUDITORIA comment '�rea funcional: Seguridad. Modelo conceptual basado en ERS S';

/*==============================================================*/
/* Table: CAMA                                                  */
/*==============================================================*/
create table CAMA
(
   CAMA_ID_CAMA         int not null,
   ASIGNACION_CAMA_ID_ASIGNACION int not null,
   CAMA_CODIGO          char(30) not null,
   CAMA_ESTADO          char(30) not null,
   primary key (CAMA_ID_CAMA)
);

alter table CAMA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO
(
   CARGO_ID_CARGO       int not null,
   DETALLE_FACTURA_ID_DETALLE_FACTURA int not null,
   CARGO_TIPO_ORIGEN    char(40) not null,
   CARGO_REFERENCIA_ORIGEN char(80) not null,
   CARGO_CANTIDAD       numeric(10,2) not null,
   CARGO_PRECIO_UNITARIO numeric(12,2) not null,
   CARGO_IMPORTE        numeric(12,2) not null,
   CARGO_FECHA_CARGO    datetime not null,
   CARGO_ESTADO         char(30) not null,
   primary key (CARGO_ID_CARGO)
);

alter table CARGO comment '�rea funcional: Finanzas. Modelo conceptual basado en ERS SI';

/*==============================================================*/
/* Table: CITA                                                  */
/*==============================================================*/
create table CITA
(
   CITA_ID_CITA         int not null,
   HISTORIAL_CITA_ID_HISTORIAL int not null,
   EPISODIO_ATENCION_ID_EPISODIO int,
   CITA_FECHA_HORA      datetime not null,
   CITA_MOTIVO          char(250),
   CITA_ESTADO          char(30) not null,
   CITA_FECHA_REGISTRO  datetime not null,
   primary key (CITA_ID_CITA)
);

alter table CITA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: CONSULTA_MEDICA                                       */
/*==============================================================*/
create table CONSULTA_MEDICA
(
   CONSULTA_MEDICA_ID_CONSULTA int not null,
   CONSULTA_MEDICA_MOTIVO_CONSULTA char(254) not null,
   CONSULTA_MEDICA_ENFERMEDAD_ACTUAL char(254),
   CONSULTA_MEDICA_PLAN_TRATAMIENTO char(254),
   CONSULTA_MEDICA_FECHA_CONSULTA datetime not null,
   primary key (CONSULTA_MEDICA_ID_CONSULTA)
);

alter table CONSULTA_MEDICA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: CONSULTORIO                                           */
/*==============================================================*/
create table CONSULTORIO
(
   CONSULTORIO_ID_CONSULTORIO int not null,
   AGENDA_MEDICA_ID_AGENDA int not null,
   CONSULTORIO_CODIGO   char(30) not null,
   CONSULTORIO_UBICACION char(120),
   CONSULTORIO_ACTIVO   char(1) not null,
   primary key (CONSULTORIO_ID_CONSULTORIO)
);

alter table CONSULTORIO comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: CONTACTO_EMERGENCIA                                   */
/*==============================================================*/
create table CONTACTO_EMERGENCIA
(
   CONTACTO_EMERGENCIA_ID_CONTACTO int not null,
   CONTACTO_EMERGENCIA_NOMBRE_COMPLETO char(150) not null,
   CONTACTO_EMERGENCIA_PARENTESCO char(50),
   CONTACTO_EMERGENCIA_TELEFONO char(25) not null,
   primary key (CONTACTO_EMERGENCIA_ID_CONTACTO)
);

alter table CONTACTO_EMERGENCIA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: DETALLE_DISPENSACION                                  */
/*==============================================================*/
create table DETALLE_DISPENSACION
(
   DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION int not null,
   MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO int,
   DETALLE_DISPENSACION_CANTIDAD_ENTREGADA int not null,
   primary key (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION)
);

alter table DETALLE_DISPENSACION comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA
(
   DETALLE_FACTURA_ID_DETALLE_FACTURA int not null,
   CARGO_ID_CARGO       int,
   DETALLE_FACTURA_IMPORTE_FACTURADO numeric(12,2) not null,
   primary key (DETALLE_FACTURA_ID_DETALLE_FACTURA)
);

alter table DETALLE_FACTURA comment '�rea funcional: Finanzas. Modelo conceptual basado en ERS SI';

/*==============================================================*/
/* Table: DETALLE_PRESCRIPCION                                  */
/*==============================================================*/
create table DETALLE_PRESCRIPCION
(
   DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION int not null,
   DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION int not null,
   DETALLE_PRESCRIPCION_DOSIS char(100) not null,
   DETALLE_PRESCRIPCION_FRECUENCIA char(100) not null,
   DETALLE_PRESCRIPCION_DURACION char(60),
   DETALLE_PRESCRIPCION_CANTIDAD_PRESCRITA int not null,
   primary key (DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION)
);

alter table DETALLE_PRESCRIPCION comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: DETALLE_SOLICITUD_LABORATORIO                         */
/*==============================================================*/
create table DETALLE_SOLICITUD_LABORATORIO
(
   DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD int not null,
   RESULTADO_LABORATORIO_ID_RESULTADO int not null,
   DETALLE_SOLICITUD_LABORATORIO_CODIGO_MUESTRA char(80),
   DETALLE_SOLICITUD_LABORATORIO_ESTADO char(30) not null,
   primary key (DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD)
);

alter table DETALLE_SOLICITUD_LABORATORIO comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: DIAGNOSTICO                                           */
/*==============================================================*/
create table DIAGNOSTICO
(
   DIAGNOSTICO_ID_DIAGNOSTICO int not null,
   DIAGNOSTICO_CODIGO_CIE char(15),
   DIAGNOSTICO_DESCRIPCION char(250) not null,
   DIAGNOSTICO_TIPO     char(30) not null,
   DIAGNOSTICO_FECHA_REGISTRO datetime not null,
   primary key (DIAGNOSTICO_ID_DIAGNOSTICO)
);

alter table DIAGNOSTICO comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: DISPENSACION                                          */
/*==============================================================*/
create table DISPENSACION
(
   DISPENSACION_ID_DISPENSACION int not null,
   DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION int not null,
   DISPENSACION_FECHA_DISPENSACION datetime not null,
   DISPENSACION_ESTADO  char(30) not null,
   primary key (DISPENSACION_ID_DISPENSACION)
);

alter table DISPENSACION comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: EPISODIO_ATENCION                                     */
/*==============================================================*/
create table EPISODIO_ATENCION
(
   EPISODIO_ATENCION_ID_EPISODIO int not null,
   CITA_ID_CITA         int,
   CONSULTA_MEDICA_ID_CONSULTA int not null,
   SIGNO_VITAL_ID_SIGNO int not null,
   NOTA_CLINICA_ID_NOTA int not null,
   DIAGNOSTICO_ID_DIAGNOSTICO int not null,
   TRIAJE_EMERGENCIA_ID_TRIAJE int not null,
   SOLICITUD_LABORATORIO_ID_SOLICITUD int not null,
   ESTUDIO_IMAGEN_ID_ESTUDIO int not null,
   PRESCRIPCION_ID_PRESCRIPCION int not null,
   ADMISION_ID_ADMISION int not null,
   NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA int not null,
   PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO int not null,
   CARGO_ID_CARGO       int not null,
   EPISODIO_ATENCION_TIPO_ATENCION char(40) not null,
   EPISODIO_ATENCION_FECHA_INICIO datetime not null,
   EPISODIO_ATENCION_FECHA_FIN datetime,
   EPISODIO_ATENCION_ESTADO char(30) not null,
   primary key (EPISODIO_ATENCION_ID_EPISODIO)
);

alter table EPISODIO_ATENCION comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: ESPECIALIDAD                                          */
/*==============================================================*/
create table ESPECIALIDAD
(
   ESPECIALIDAD_ID_ESPECIALIDAD int not null,
   AGENDA_MEDICA_ID_AGENDA int not null,
   ESPECIALIDAD_NOMBRE  char(100) not null,
   ESPECIALIDAD_DESCRIPCION char(200),
   primary key (ESPECIALIDAD_ID_ESPECIALIDAD)
);

alter table ESPECIALIDAD comment '�rea funcional: Personal. Modelo conceptual basado en ERS SI';

/*==============================================================*/
/* Table: ESTUDIO_IMAGEN                                        */
/*==============================================================*/
create table ESTUDIO_IMAGEN
(
   ESTUDIO_IMAGEN_ID_ESTUDIO int not null,
   INFORME_IMAGEN_ID_INFORME_IMAGEN int not null,
   ESTUDIO_IMAGEN_TIPO_ESTUDIO char(100) not null,
   ESTUDIO_IMAGEN_FECHA_SOLICITUD datetime not null,
   ESTUDIO_IMAGEN_FECHA_REALIZACION datetime,
   ESTUDIO_IMAGEN_ESTADO char(30) not null,
   ESTUDIO_IMAGEN_REFERENCIA_ARCHIVO char(250),
   primary key (ESTUDIO_IMAGEN_ID_ESTUDIO)
);

alter table ESTUDIO_IMAGEN comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA
(
   FACTURA_ID_FACTURA   int not null,
   FAC_FACTURA_ID_FACTURA int,
   DETALLE_FACTURA_ID_DETALLE_FACTURA int not null,
   PAGO_ID_PAGO         int not null,
   FACTURA_NUMERO_COMPROBANTE char(60) not null,
   FACTURA_FECHA_EMISION datetime not null,
   FACTURA_SUBTOTAL     numeric(12,2) not null,
   FACTURA_IVA          numeric(12,2) not null,
   FACTURA_TOTAL        numeric(12,2) not null,
   FACTURA_ESTADO       char(30) not null,
   FACTURA_MOTIVO_ANULACION char(250),
   primary key (FACTURA_ID_FACTURA)
);

alter table FACTURA comment '�rea funcional: Finanzas. Modelo conceptual basado en ERS SI';

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION
(
   HABITACION_ID_HABITACION int not null,
   CAMA_ID_CAMA         int not null,
   HABITACION_CODIGO    char(30) not null,
   HABITACION_PISO      char(20),
   primary key (HABITACION_ID_HABITACION)
);

alter table HABITACION comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: HISTORIAL_CITA                                        */
/*==============================================================*/
create table HISTORIAL_CITA
(
   HISTORIAL_CITA_ID_HISTORIAL int not null,
   HISTORIAL_CITA_FECHA_CAMBIO datetime not null,
   HISTORIAL_CITA_ESTADO_ANTERIOR char(30),
   HISTORIAL_CITA_ESTADO_NUEVO char(30) not null,
   HISTORIAL_CITA_FECHA_HORA_ANTERIOR datetime,
   HISTORIAL_CITA_FECHA_HORA_NUEVA datetime,
   HISTORIAL_CITA_MOTIVO char(250),
   primary key (HISTORIAL_CITA_ID_HISTORIAL)
);

alter table HISTORIAL_CITA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: HISTORIA_CLINICA                                      */
/*==============================================================*/
create table HISTORIA_CLINICA
(
   HISTORIA_CLINICA_ID_HISTORIA int not null,
   PACIENTE_ID_PACIENTE int,
   ANTECEDENTE_CLINICO_ID_ANTECEDENTE int not null,
   EPISODIO_ATENCION_ID_EPISODIO int not null,
   HISTORIA_CLINICA_FECHA_APERTURA datetime not null,
   HISTORIA_CLINICA_ESTADO char(30) not null,
   primary key (HISTORIA_CLINICA_ID_HISTORIA)
);

alter table HISTORIA_CLINICA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: INFORME_IMAGEN                                        */
/*==============================================================*/
create table INFORME_IMAGEN
(
   INFORME_IMAGEN_ID_INFORME_IMAGEN int not null,
   ESTUDIO_IMAGEN_ID_ESTUDIO int,
   INFORME_IMAGEN_INFORME char(254) not null,
   INFORME_IMAGEN_FECHA_EMISION datetime not null,
   INFORME_IMAGEN_ESTADO char(30) not null,
   primary key (INFORME_IMAGEN_ID_INFORME_IMAGEN)
);

alter table INFORME_IMAGEN comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: LOTE                                                  */
/*==============================================================*/
create table LOTE
(
   LOTE_ID_LOTE         int not null,
   DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION int not null,
   MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO int not null,
   LOTE_NUMERO_LOTE     char(60) not null,
   LOTE_FECHA_CADUCIDAD date not null,
   LOTE_EXISTENCIA_ACTUAL int not null,
   LOTE_ESTADO          char(30) not null,
   primary key (LOTE_ID_LOTE)
);

alter table LOTE comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: MEDICAMENTO                                           */
/*==============================================================*/
create table MEDICAMENTO
(
   MEDICAMENTO_ID_MEDICAMENTO int not null,
   DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION int not null,
   LOTE_ID_LOTE         int not null,
   MEDICAMENTO_CODIGO   char(40) not null,
   MEDICAMENTO_NOMBRE_GENERICO char(150) not null,
   MEDICAMENTO_PRESENTACION char(100) not null,
   MEDICAMENTO_CONCENTRACION char(60),
   MEDICAMENTO_STOCK_MINIMO int not null,
   MEDICAMENTO_ACTIVO   char(1) not null,
   primary key (MEDICAMENTO_ID_MEDICAMENTO)
);

alter table MEDICAMENTO comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: MOVIMIENTO_INVENTARIO                                 */
/*==============================================================*/
create table MOVIMIENTO_INVENTARIO
(
   MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO int not null,
   MOVIMIENTO_INVENTARIO_TIPO_MOVIMIENTO char(30) not null,
   MOVIMIENTO_INVENTARIO_CANTIDAD int not null,
   MOVIMIENTO_INVENTARIO_FECHA_MOVIMIENTO datetime not null,
   MOVIMIENTO_INVENTARIO_MOTIVO char(250),
   primary key (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO)
);

alter table MOVIMIENTO_INVENTARIO comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: NOTA_CLINICA                                          */
/*==============================================================*/
create table NOTA_CLINICA
(
   NOTA_CLINICA_ID_NOTA int not null,
   NOT_NOTA_CLINICA_ID_NOTA int,
   NOTA_CLINICA_TIPO    char(40) not null,
   NOTA_CLINICA_CONTENIDO char(254) not null,
   NOTA_CLINICA_ESTADO  char(30) not null,
   NOTA_CLINICA_FECHA_CREACION datetime not null,
   NOTA_CLINICA_FECHA_FIRMA datetime,
   primary key (NOTA_CLINICA_ID_NOTA)
);

alter table NOTA_CLINICA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: NOTA_ENFERMERIA                                       */
/*==============================================================*/
create table NOTA_ENFERMERIA
(
   NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA int not null,
   NOTA_ENFERMERIA_FECHA_REGISTRO datetime not null,
   NOTA_ENFERMERIA_OBSERVACIONES char(254) not null,
   NOTA_ENFERMERIA_CUIDADOS_REALIZADOS char(254),
   primary key (NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA)
);

alter table NOTA_ENFERMERIA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE
(
   PACIENTE_ID_PACIENTE int not null,
   CONTACTO_EMERGENCIA_ID_CONTACTO int not null,
   HISTORIA_CLINICA_ID_HISTORIA int not null,
   ALERGIA_ID_ALERGIA   int not null,
   CITA_ID_CITA         int not null,
   EPISODIO_ATENCION_ID_EPISODIO int not null,
   ADMISION_ID_ADMISION int not null,
   FACTURA_ID_FACTURA   int not null,
   PACIENTE_IDENTIFICADOR_HOSPITALARIO char(30) not null,
   PACIENTE_TIPO_DOCUMENTO char(25),
   PACIENTE_NUMERO_DOCUMENTO char(30),
   PACIENTE_NOMBRES     char(100) not null,
   PACIENTE_APELLIDOS   char(100) not null,
   PACIENTE_FECHA_NACIMIENTO date,
   PACIENTE_TELEFONO    char(25),
   PACIENTE_CORREO_ELECTRONICO char(120),
   PACIENTE_DIRECCION   char(250),
   PACIENTE_ESTADO_REGISTRO char(20) not null,
   PACIENTE_FECHA_REGISTRO datetime not null,
   PACIENTE_FECHA_ACTUALIZACION datetime,
   primary key (PACIENTE_ID_PACIENTE)
);

alter table PACIENTE comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO
(
   PAGO_ID_PAGO         int not null,
   PAGO_FECHA_PAGO      datetime not null,
   PAGO_MONTO           numeric(12,2) not null,
   PAGO_METODO_PAGO     char(40) not null,
   PAGO_REFERENCIA      char(100),
   PAGO_ESTADO          char(30) not null,
   primary key (PAGO_ID_PAGO)
);

alter table PAGO comment '�rea funcional: Finanzas. Modelo conceptual basado en ERS SI';

/*==============================================================*/
/* Table: PARTICIPACION_QUIRURGICA                              */
/*==============================================================*/
create table PARTICIPACION_QUIRURGICA
(
   PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO char(80) not null,
   primary key (PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO)
);

alter table PARTICIPACION_QUIRURGICA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: PERMISO                                               */
/*==============================================================*/
create table PERMISO
(
   PERMISO_ID_PERMISO   int not null,
   PERMISO_CODIGO       char(100) not null,
   PERMISO_DESCRIPCION  char(200),
   primary key (PERMISO_ID_PERMISO)
);

alter table PERMISO comment '�rea funcional: Seguridad. Modelo conceptual basado en ERS S';

/*==============================================================*/
/* Table: PRESCRIPCION                                          */
/*==============================================================*/
create table PRESCRIPCION
(
   PRESCRIPCION_ID_PRESCRIPCION int not null,
   DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION int not null,
   DISPENSACION_ID_DISPENSACION int not null,
   PRESCRIPCION_FECHA_EMISION datetime not null,
   PRESCRIPCION_ESTADO  char(30) not null,
   PRESCRIPCION_INDICACIONES char(254),
   primary key (PRESCRIPCION_ID_PRESCRIPCION)
);

alter table PRESCRIPCION comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: PROCEDIMIENTO_QUIRURGICO                              */
/*==============================================================*/
create table PROCEDIMIENTO_QUIRURGICO
(
   PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO int not null,
   PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO char(80) not null,
   PROCEDIMIENTO_QUIRURGICO_NOMBRE_PROCEDIMIENTO char(200) not null,
   PROCEDIMIENTO_QUIRURGICO_FECHA_PROGRAMADA datetime not null,
   PROCEDIMIENTO_QUIRURGICO_FECHA_REALIZACION datetime,
   PROCEDIMIENTO_QUIRURGICO_QUIROFANO char(50),
   PROCEDIMIENTO_QUIRURGICO_ESTADO char(30) not null,
   PROCEDIMIENTO_QUIRURGICO_OBSERVACIONES char(254),
   primary key (PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO)
);

alter table PROCEDIMIENTO_QUIRURGICO comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: PROFESIONAL                                           */
/*==============================================================*/
create table PROFESIONAL
(
   PROFESIONAL_ID_PROFESIONAL int not null,
   USUARIO_ID_USUARIO   int,
   AGENDA_MEDICA_ID_AGENDA int not null,
   EPISODIO_ATENCION_ID_EPISODIO int,
   CONSULTA_MEDICA_ID_CONSULTA int not null,
   SIGNO_VITAL_ID_SIGNO int not null,
   DIAGNOSTICO_ID_DIAGNOSTICO int not null,
   TRIAJE_EMERGENCIA_ID_TRIAJE int not null,
   SOLICITUD_LABORATORIO_ID_SOLICITUD int not null,
   RESULTADO_LABORATORIO_ID_RESULTADO int,
   ESTUDIO_IMAGEN_ID_ESTUDIO int not null,
   INFORME_IMAGEN_ID_INFORME_IMAGEN int not null,
   PRESCRIPCION_ID_PRESCRIPCION int not null,
   NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA int not null,
   PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO int not null,
   PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO char(80) not null,
   PROFESIONAL_NUMERO_REGISTRO char(60) not null,
   PROFESIONAL_NOMBRES  char(100) not null,
   PROFESIONAL_APELLIDOS char(100) not null,
   PROFESIONAL_TIPO_PROFESIONAL char(40) not null,
   PROFESIONAL_ACTIVO   char(1) not null,
   primary key (PROFESIONAL_ID_PROFESIONAL)
);

alter table PROFESIONAL comment '�rea funcional: Personal. Modelo conceptual basado en ERS SI';

/*==============================================================*/
/* Table: PROFESIONAL_ESPECIALIDAD                              */
/*==============================================================*/
create table PROFESIONAL_ESPECIALIDAD
(
   PROFESIONAL_ID_PROFESIONAL int not null,
   ESPECIALIDAD_ID_ESPECIALIDAD int not null,
   primary key (PROFESIONAL_ID_PROFESIONAL, ESPECIALIDAD_ID_ESPECIALIDAD)
);

alter table PROFESIONAL_ESPECIALIDAD comment 'Profesional sanitario ejerce especialidad Especialidad. Card';

/*==============================================================*/
/* Table: PRUEBA_LABORATORIO                                    */
/*==============================================================*/
create table PRUEBA_LABORATORIO
(
   PRUEBA_LABORATORIO_ID_PRUEBA int not null,
   DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD int not null,
   PRUEBA_LABORATORIO_CODIGO char(30) not null,
   PRUEBA_LABORATORIO_NOMBRE char(120) not null,
   PRUEBA_LABORATORIO_UNIDAD_MEDIDA char(30),
   PRUEBA_LABORATORIO_ACTIVA char(1) not null,
   primary key (PRUEBA_LABORATORIO_ID_PRUEBA)
);

alter table PRUEBA_LABORATORIO comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: RESULTADO_LABORATORIO                                 */
/*==============================================================*/
create table RESULTADO_LABORATORIO
(
   RESULTADO_LABORATORIO_ID_RESULTADO int not null,
   RESULTADO_LABORATORIO_VALOR_RESULTADO char(200) not null,
   RESULTADO_LABORATORIO_UNIDAD_MEDIDA char(30),
   RESULTADO_LABORATORIO_ESTADO_VALIDACION char(30) not null,
   RESULTADO_LABORATORIO_FECHA_RESULTADO datetime not null,
   RESULTADO_LABORATORIO_FECHA_VALIDACION datetime,
   primary key (RESULTADO_LABORATORIO_ID_RESULTADO)
);

alter table RESULTADO_LABORATORIO comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL
(
   ROL_ID_ROL           int not null,
   ROL_NOMBRE           char(70) not null,
   ROL_DESCRIPCION      char(200),
   primary key (ROL_ID_ROL)
);

alter table ROL comment '�rea funcional: Seguridad. Modelo conceptual basado en ERS S';

/*==============================================================*/
/* Table: ROL_PERMISO                                           */
/*==============================================================*/
create table ROL_PERMISO
(
   ROL_ID_ROL           int not null,
   PERMISO_ID_PERMISO   int not null,
   primary key (ROL_ID_ROL, PERMISO_ID_PERMISO)
);

alter table ROL_PERMISO comment 'Rol otorga permisos Permiso. Cardinalidades: 0..n y 0..n.';

/*==============================================================*/
/* Table: SERVICIO_FACTURABLE                                   */
/*==============================================================*/
create table SERVICIO_FACTURABLE
(
   SERVICIO_FACTURABLE_ID_SERVICIO int not null,
   CARGO_ID_CARGO       int not null,
   SERVICIO_FACTURABLE_CODIGO char(40) not null,
   SERVICIO_FACTURABLE_DESCRIPCION char(200) not null,
   SERVICIO_FACTURABLE_TARIFA_ACTUAL numeric(12,2) not null,
   SERVICIO_FACTURABLE_PORCENTAJE_IVA numeric(10,2) not null,
   SERVICIO_FACTURABLE_ACTIVO char(1) not null,
   primary key (SERVICIO_FACTURABLE_ID_SERVICIO)
);

alter table SERVICIO_FACTURABLE comment '�rea funcional: Finanzas. Modelo conceptual basado en ERS SI';

/*==============================================================*/
/* Table: SESION_USUARIO                                        */
/*==============================================================*/
create table SESION_USUARIO
(
   SESION_USUARIO_ID_SESION int not null,
   SESION_USUARIO_INICIO datetime not null,
   SESION_USUARIO_FIN   datetime,
   SESION_USUARIO_ESTADO char(20) not null,
   primary key (SESION_USUARIO_ID_SESION)
);

alter table SESION_USUARIO comment '�rea funcional: Seguridad. Modelo conceptual basado en ERS S';

/*==============================================================*/
/* Table: SIGNO_VITAL                                           */
/*==============================================================*/
create table SIGNO_VITAL
(
   SIGNO_VITAL_ID_SIGNO int not null,
   SIGNO_VITAL_FECHA_MEDICION datetime not null,
   SIGNO_VITAL_TEMPERATURA_C numeric(10,2),
   SIGNO_VITAL_FRECUENCIA_CARDIACA int,
   SIGNO_VITAL_PRESION_SISTOLICA int,
   SIGNO_VITAL_PRESION_DIASTOLICA int,
   SIGNO_VITAL_SATURACION_OXIGENO numeric(10,2),
   primary key (SIGNO_VITAL_ID_SIGNO)
);

alter table SIGNO_VITAL comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: SOLICITUD_LABORATORIO                                 */
/*==============================================================*/
create table SOLICITUD_LABORATORIO
(
   SOLICITUD_LABORATORIO_ID_SOLICITUD int not null,
   DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD int not null,
   SOLICITUD_LABORATORIO_FECHA_SOLICITUD datetime not null,
   SOLICITUD_LABORATORIO_ESTADO char(30) not null,
   SOLICITUD_LABORATORIO_PRIORIDAD char(30) not null,
   primary key (SOLICITUD_LABORATORIO_ID_SOLICITUD)
);

alter table SOLICITUD_LABORATORIO comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: TRIAJE_EMERGENCIA                                     */
/*==============================================================*/
create table TRIAJE_EMERGENCIA
(
   TRIAJE_EMERGENCIA_ID_TRIAJE int not null,
   TRIAJE_EMERGENCIA_NIVEL_PRIORIDAD char(30) not null,
   TRIAJE_EMERGENCIA_OBSERVACIONES char(254),
   TRIAJE_EMERGENCIA_FECHA_TRIAJE datetime not null,
   TRIAJE_EMERGENCIA_DISPOSICION char(40),
   primary key (TRIAJE_EMERGENCIA_ID_TRIAJE)
);

alter table TRIAJE_EMERGENCIA comment '�rea funcional: Gesti�n Hospitalaria. Modelo conceptual basa';

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   USUARIO_ID_USUARIO   int not null,
   SESION_USUARIO_ID_SESION int not null,
   PROFESIONAL_ID_PROFESIONAL int not null,
   AUDITORIA_ID_AUDITORIA int,
   PACIENTE_ID_PACIENTE int not null,
   ANTECEDENTE_CLINICO_ID_ANTECEDENTE int not null,
   CITA_ID_CITA         int not null,
   HISTORIAL_CITA_ID_HISTORIAL int not null,
   NOTA_CLINICA_ID_NOTA int not null,
   DISPENSACION_ID_DISPENSACION int not null,
   MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO int not null,
   PAGO_ID_PAGO         int not null,
   USUARIO_NOMBRE_USUARIO char(60) not null,
   USUARIO_HASH_CONTRASENA char(254) not null,
   USUARIO_CORREO       char(120),
   USUARIO_ACTIVO       char(1) not null,
   USUARIO_FECHA_CREACION datetime not null,
   primary key (USUARIO_ID_USUARIO)
);

alter table USUARIO comment '�rea funcional: Seguridad. Modelo conceptual basado en ERS S';

/*==============================================================*/
/* Table: USUARIO_ROL                                           */
/*==============================================================*/
create table USUARIO_ROL
(
   USUARIO_ID_USUARIO   int not null,
   ROL_ID_ROL           int not null,
   primary key (USUARIO_ID_USUARIO, ROL_ID_ROL)
);

alter table USUARIO_ROL comment 'Usuario tiene roles Rol. Cardinalidades: 0..n y 0..n.';

alter table ADMISION add constraint FK_EPISODIO_ATENCION_ADMISION_ID_EPISODIO foreign key (ADMISION_ID_ADMISION)
      references EPISODIO_ATENCION (ADMISION_ID_ADMISION) on delete restrict on update restrict;

alter table ADMISION add constraint FK_PACIENTE_ADMISION_ID_PACIENTE foreign key (ADMISION_ID_ADMISION)
      references PACIENTE (ADMISION_ID_ADMISION) on delete restrict on update restrict;

alter table AGENDA_MEDICA add constraint FK_CONSULTORIO_AGENDA_MEDICA_ID_CONSULTORIO foreign key (AGENDA_MEDICA_ID_AGENDA)
      references CONSULTORIO (AGENDA_MEDICA_ID_AGENDA) on delete restrict on update restrict;

alter table AGENDA_MEDICA add constraint FK_ESPECIALIDAD_AGENDA_MEDICA_ID_ESPECIALIDAD foreign key (AGENDA_MEDICA_ID_AGENDA)
      references ESPECIALIDAD (AGENDA_MEDICA_ID_AGENDA) on delete restrict on update restrict;

alter table AGENDA_MEDICA add constraint FK_PROFESIONAL_AGENDA_MEDICA_ID_PROFESIONAL foreign key (AGENDA_MEDICA_ID_AGENDA)
      references PROFESIONAL (AGENDA_MEDICA_ID_AGENDA) on delete restrict on update restrict;

alter table ALERGIA add constraint FK_PACIENTE_ALERGIA_ID_PACIENTE foreign key (ALERGIA_ID_ALERGIA)
      references PACIENTE (ALERGIA_ID_ALERGIA) on delete restrict on update restrict;

alter table ANTECEDENTE_CLINICO add constraint FK_HISTORIA_CLINICA_ANTECEDENTE_CLINICO_ID_HISTORIA foreign key (ANTECEDENTE_CLINICO_ID_ANTECEDENTE)
      references HISTORIA_CLINICA (ANTECEDENTE_CLINICO_ID_ANTECEDENTE) on delete restrict on update restrict;

alter table ANTECEDENTE_CLINICO add constraint FK_USUARIO_ANTECEDENTE_CLINICO_ID_USUARIO_AUTOR foreign key (ANTECEDENTE_CLINICO_ID_ANTECEDENTE)
      references USUARIO (ANTECEDENTE_CLINICO_ID_ANTECEDENTE) on delete restrict on update restrict;

alter table ASIGNACION_CAMA add constraint FK_ADMISION_ASIGNACION_CAMA_ID_ADMISION foreign key (ASIGNACION_CAMA_ID_ASIGNACION)
      references ADMISION (ASIGNACION_CAMA_ID_ASIGNACION) on delete restrict on update restrict;

alter table ASIGNACION_CAMA add constraint FK_CAMA_ASIGNACION_CAMA_ID_CAMA foreign key (ASIGNACION_CAMA_ID_ASIGNACION)
      references CAMA (ASIGNACION_CAMA_ID_ASIGNACION) on delete restrict on update restrict;

alter table AUDITORIA add constraint FK_USUARIO_AUDITORIA_ID_USUARIO foreign key (AUDITORIA_ID_AUDITORIA)
      references USUARIO (AUDITORIA_ID_AUDITORIA) on delete restrict on update restrict;

alter table CAMA add constraint FK_HABITACION_CAMA_ID_HABITACION foreign key (CAMA_ID_CAMA)
      references HABITACION (CAMA_ID_CAMA) on delete restrict on update restrict;

alter table CARGO add constraint FK_CARGO_DETALLE_FACTURA_ID_CARGO foreign key (CARGO_ID_CARGO)
      references DETALLE_FACTURA (CARGO_ID_CARGO) on delete restrict on update restrict;

alter table CARGO add constraint FK_EPISODIO_ATENCION_CARGO_ID_EPISODIO foreign key (CARGO_ID_CARGO)
      references EPISODIO_ATENCION (CARGO_ID_CARGO) on delete restrict on update restrict;

alter table CARGO add constraint FK_SERVICIO_FACTURABLE_CARGO_ID_SERVICIO foreign key (CARGO_ID_CARGO)
      references SERVICIO_FACTURABLE (CARGO_ID_CARGO) on delete restrict on update restrict;

alter table CITA add constraint FK_AGENDA_MEDICA_CITA_ID_AGENDA foreign key (CITA_ID_CITA)
      references AGENDA_MEDICA (CITA_ID_CITA) on delete restrict on update restrict;

alter table CITA add constraint FK_CITA_EPISODIO_ATENCION_ID_CITA foreign key (CITA_ID_CITA)
      references EPISODIO_ATENCION (CITA_ID_CITA) on delete restrict on update restrict;

alter table CITA add constraint FK_PACIENTE_CITA_ID_PACIENTE foreign key (CITA_ID_CITA)
      references PACIENTE (CITA_ID_CITA) on delete restrict on update restrict;

alter table CITA add constraint FK_USUARIO_CITA_ID_USUARIO_REGISTRO foreign key (CITA_ID_CITA)
      references USUARIO (CITA_ID_CITA) on delete restrict on update restrict;

alter table CONSULTA_MEDICA add constraint FK_EPISODIO_ATENCION_CONSULTA_MEDICA_ID_EPISODIO foreign key (CONSULTA_MEDICA_ID_CONSULTA)
      references EPISODIO_ATENCION (CONSULTA_MEDICA_ID_CONSULTA) on delete restrict on update restrict;

alter table CONSULTA_MEDICA add constraint FK_PROFESIONAL_CONSULTA_MEDICA_ID_PROFESIONAL foreign key (CONSULTA_MEDICA_ID_CONSULTA)
      references PROFESIONAL (CONSULTA_MEDICA_ID_CONSULTA) on delete restrict on update restrict;

alter table CONTACTO_EMERGENCIA add constraint FK_PACIENTE_CONTACTO_EMERGENCIA_ID_PACIENTE foreign key (CONTACTO_EMERGENCIA_ID_CONTACTO)
      references PACIENTE (CONTACTO_EMERGENCIA_ID_CONTACTO) on delete restrict on update restrict;

alter table DETALLE_DISPENSACION add constraint FK_DETALLE_PRESCRIPCION_DETALLE_DISPENSACION_ID_DETALLE_PRESCRIPCION foreign key (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION)
      references DETALLE_PRESCRIPCION (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION) on delete restrict on update restrict;

alter table DETALLE_DISPENSACION add constraint FK_DISPENSACION_DETALLE_DISPENSACION_ID_DISPENSACION foreign key (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION)
      references DISPENSACION (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION) on delete restrict on update restrict;

alter table DETALLE_DISPENSACION add constraint FK_LOTE_DETALLE_DISPENSACION_ID_LOTE foreign key (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION)
      references LOTE (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION) on delete restrict on update restrict;

alter table DETALLE_FACTURA add constraint FK_CARGO_DETALLE_FACTURA_ID_CARGO2 foreign key (DETALLE_FACTURA_ID_DETALLE_FACTURA)
      references CARGO (DETALLE_FACTURA_ID_DETALLE_FACTURA) on delete restrict on update restrict;

alter table DETALLE_FACTURA add constraint FK_FACTURA_DETALLE_FACTURA_ID_FACTURA foreign key (DETALLE_FACTURA_ID_DETALLE_FACTURA)
      references FACTURA (DETALLE_FACTURA_ID_DETALLE_FACTURA) on delete restrict on update restrict;

alter table DETALLE_PRESCRIPCION add constraint FK_MEDICAMENTO_DETALLE_PRESCRIPCION_ID_MEDICAMENTO foreign key (DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION)
      references MEDICAMENTO (DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION) on delete restrict on update restrict;

alter table DETALLE_PRESCRIPCION add constraint FK_PRESCRIPCION_DETALLE_PRESCRIPCION_ID_PRESCRIPCION foreign key (DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION)
      references PRESCRIPCION (DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION) on delete restrict on update restrict;

alter table DETALLE_SOLICITUD_LABORATORIO add constraint FK_PRUEBA_LABORATORIO_DETALLE_SOLICITUD_LABORATORIO_ID_PRUEBA foreign key (DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD)
      references PRUEBA_LABORATORIO (DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD) on delete restrict on update restrict;

alter table DETALLE_SOLICITUD_LABORATORIO add constraint FK_SOLICITUD_LABORATORIO_DETALLE_SOLICITUD_LABORATORIO_ID_SOLICITUD foreign key (DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD)
      references SOLICITUD_LABORATORIO (DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD) on delete restrict on update restrict;

alter table DIAGNOSTICO add constraint FK_EPISODIO_ATENCION_DIAGNOSTICO_ID_EPISODIO foreign key (DIAGNOSTICO_ID_DIAGNOSTICO)
      references EPISODIO_ATENCION (DIAGNOSTICO_ID_DIAGNOSTICO) on delete restrict on update restrict;

alter table DIAGNOSTICO add constraint FK_PROFESIONAL_DIAGNOSTICO_ID_PROFESIONAL foreign key (DIAGNOSTICO_ID_DIAGNOSTICO)
      references PROFESIONAL (DIAGNOSTICO_ID_DIAGNOSTICO) on delete restrict on update restrict;

alter table DISPENSACION add constraint FK_PRESCRIPCION_DISPENSACION_ID_PRESCRIPCION foreign key (DISPENSACION_ID_DISPENSACION)
      references PRESCRIPCION (DISPENSACION_ID_DISPENSACION) on delete restrict on update restrict;

alter table DISPENSACION add constraint FK_USUARIO_DISPENSACION_ID_USUARIO_FARMACIA foreign key (DISPENSACION_ID_DISPENSACION)
      references USUARIO (DISPENSACION_ID_DISPENSACION) on delete restrict on update restrict;

alter table EPISODIO_ATENCION add constraint FK_CITA_EPISODIO_ATENCION_ID_CITA2 foreign key (EPISODIO_ATENCION_ID_EPISODIO)
      references CITA (EPISODIO_ATENCION_ID_EPISODIO) on delete restrict on update restrict;

alter table EPISODIO_ATENCION add constraint FK_HISTORIA_CLINICA_EPISODIOS foreign key (EPISODIO_ATENCION_ID_EPISODIO)
      references HISTORIA_CLINICA (EPISODIO_ATENCION_ID_EPISODIO) on delete restrict on update restrict;

alter table EPISODIO_ATENCION add constraint FK_PACIENTE_EPISODIO_ATENCION_ID_PACIENTE foreign key (EPISODIO_ATENCION_ID_EPISODIO)
      references PACIENTE (EPISODIO_ATENCION_ID_EPISODIO) on delete restrict on update restrict;

alter table EPISODIO_ATENCION add constraint FK_PROFESIONAL_EPISODIO_ATENCION_ID_PROFESIONAL_RESPONSABLE foreign key (EPISODIO_ATENCION_ID_EPISODIO)
      references PROFESIONAL (EPISODIO_ATENCION_ID_EPISODIO) on delete restrict on update restrict;

alter table ESTUDIO_IMAGEN add constraint FK_EPISODIO_ATENCION_ESTUDIO_IMAGEN_ID_EPISODIO foreign key (ESTUDIO_IMAGEN_ID_ESTUDIO)
      references EPISODIO_ATENCION (ESTUDIO_IMAGEN_ID_ESTUDIO) on delete restrict on update restrict;

alter table ESTUDIO_IMAGEN add constraint FK_ESTUDIO_IMAGEN_INFORME_IMAGEN_ID_ESTUDIO foreign key (ESTUDIO_IMAGEN_ID_ESTUDIO)
      references INFORME_IMAGEN (ESTUDIO_IMAGEN_ID_ESTUDIO) on delete restrict on update restrict;

alter table ESTUDIO_IMAGEN add constraint FK_PROFESIONAL_ESTUDIO_IMAGEN_ID_PROFESIONAL_SOLICITANTE foreign key (ESTUDIO_IMAGEN_ID_ESTUDIO)
      references PROFESIONAL (ESTUDIO_IMAGEN_ID_ESTUDIO) on delete restrict on update restrict;

alter table FACTURA add constraint FK_FACTURA_FACTURA_ID_FACTURA_ORIGINAL foreign key (FAC_FACTURA_ID_FACTURA)
      references FACTURA (FACTURA_ID_FACTURA) on delete restrict on update restrict;

alter table FACTURA add constraint FK_PACIENTE_FACTURA_ID_PACIENTE foreign key (FACTURA_ID_FACTURA)
      references PACIENTE (FACTURA_ID_FACTURA) on delete restrict on update restrict;

alter table HABITACION add constraint FK_AREA_HOSPITALARIA_HABITACION_ID_AREA foreign key (HABITACION_ID_HABITACION)
      references AREA_HOSPITALARIA (HABITACION_ID_HABITACION) on delete restrict on update restrict;

alter table HISTORIAL_CITA add constraint FK_CITA_HISTORIAL_CITA_ID_CITA foreign key (HISTORIAL_CITA_ID_HISTORIAL)
      references CITA (HISTORIAL_CITA_ID_HISTORIAL) on delete restrict on update restrict;

alter table HISTORIAL_CITA add constraint FK_USUARIO_HISTORIAL_CITA_ID_USUARIO foreign key (HISTORIAL_CITA_ID_HISTORIAL)
      references USUARIO (HISTORIAL_CITA_ID_HISTORIAL) on delete restrict on update restrict;

alter table HISTORIA_CLINICA add constraint FK_PACIENTE_HISTORIA_CLINICA_ID_PACIENTE2 foreign key (HISTORIA_CLINICA_ID_HISTORIA)
      references PACIENTE (HISTORIA_CLINICA_ID_HISTORIA) on delete restrict on update restrict;

alter table INFORME_IMAGEN add constraint FK_ESTUDIO_IMAGEN_INFORME_IMAGEN_ID_ESTUDIO2 foreign key (INFORME_IMAGEN_ID_INFORME_IMAGEN)
      references ESTUDIO_IMAGEN (INFORME_IMAGEN_ID_INFORME_IMAGEN) on delete restrict on update restrict;

alter table INFORME_IMAGEN add constraint FK_PROFESIONAL_INFORME_IMAGEN_ID_PROFESIONAL_INFORMANTE foreign key (INFORME_IMAGEN_ID_INFORME_IMAGEN)
      references PROFESIONAL (INFORME_IMAGEN_ID_INFORME_IMAGEN) on delete restrict on update restrict;

alter table LOTE add constraint FK_MEDICAMENTO_LOTE_ID_MEDICAMENTO foreign key (LOTE_ID_LOTE)
      references MEDICAMENTO (LOTE_ID_LOTE) on delete restrict on update restrict;

alter table MOVIMIENTO_INVENTARIO add constraint FK_DETALLE_DISPENSACION_MOVIMIENTO_INVENTARIO_ID_DETALLE_DISPENSACION foreign key (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO)
      references DETALLE_DISPENSACION (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO) on delete restrict on update restrict;

alter table MOVIMIENTO_INVENTARIO add constraint FK_LOTE_MOVIMIENTO_INVENTARIO_ID_LOTE foreign key (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO)
      references LOTE (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO) on delete restrict on update restrict;

alter table MOVIMIENTO_INVENTARIO add constraint FK_USUARIO_MOVIMIENTO_INVENTARIO_ID_USUARIO foreign key (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO)
      references USUARIO (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO) on delete restrict on update restrict;

alter table NOTA_CLINICA add constraint FK_EPISODIO_ATENCION_NOTA_CLINICA_ID_EPISODIO foreign key (NOTA_CLINICA_ID_NOTA)
      references EPISODIO_ATENCION (NOTA_CLINICA_ID_NOTA) on delete restrict on update restrict;

alter table NOTA_CLINICA add constraint FK_NOTA_CLINICA_NOTA_CLINICA_ID_NOTA_ORIGINAL foreign key (NOT_NOTA_CLINICA_ID_NOTA)
      references NOTA_CLINICA (NOTA_CLINICA_ID_NOTA) on delete restrict on update restrict;

alter table NOTA_CLINICA add constraint FK_USUARIO_NOTA_CLINICA_ID_USUARIO_AUTOR foreign key (NOTA_CLINICA_ID_NOTA)
      references USUARIO (NOTA_CLINICA_ID_NOTA) on delete restrict on update restrict;

alter table NOTA_ENFERMERIA add constraint FK_EPISODIO_ATENCION_NOTA_ENFERMERIA_ID_EPISODIO foreign key (NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA)
      references EPISODIO_ATENCION (NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA) on delete restrict on update restrict;

alter table NOTA_ENFERMERIA add constraint FK_PROFESIONAL_NOTA_ENFERMERIA_ID_PROFESIONAL foreign key (NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA)
      references PROFESIONAL (NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA) on delete restrict on update restrict;

alter table PACIENTE add constraint FK_PACIENTE_HISTORIA_CLINICA_ID_PACIENTE foreign key (PACIENTE_ID_PACIENTE)
      references HISTORIA_CLINICA (PACIENTE_ID_PACIENTE) on delete restrict on update restrict;

alter table PAGO add constraint FK_FACTURA_PAGO_ID_FACTURA foreign key (PAGO_ID_PAGO)
      references FACTURA (PAGO_ID_PAGO) on delete restrict on update restrict;

alter table PAGO add constraint FK_USUARIO_PAGO_ID_USUARIO_REGISTRO foreign key (PAGO_ID_PAGO)
      references USUARIO (PAGO_ID_PAGO) on delete restrict on update restrict;

alter table PARTICIPACION_QUIRURGICA add constraint FK_PROCEDIMIENTO_QUIRURGICO_PARTICIPACION_QUIRURGICA_ID_PROCEDIMIENTO foreign key (PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO)
      references PROCEDIMIENTO_QUIRURGICO (PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO) on delete restrict on update restrict;

alter table PARTICIPACION_QUIRURGICA add constraint FK_PROFESIONAL_PARTICIPACION_QUIRURGICA_ID_PROFESIONAL foreign key (PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO)
      references PROFESIONAL (PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO) on delete restrict on update restrict;

alter table PRESCRIPCION add constraint FK_EPISODIO_ATENCION_PRESCRIPCION_ID_EPISODIO foreign key (PRESCRIPCION_ID_PRESCRIPCION)
      references EPISODIO_ATENCION (PRESCRIPCION_ID_PRESCRIPCION) on delete restrict on update restrict;

alter table PRESCRIPCION add constraint FK_PROFESIONAL_PRESCRIPCION_ID_PROFESIONAL foreign key (PRESCRIPCION_ID_PRESCRIPCION)
      references PROFESIONAL (PRESCRIPCION_ID_PRESCRIPCION) on delete restrict on update restrict;

alter table PROCEDIMIENTO_QUIRURGICO add constraint FK_EPISODIO_ATENCION_PROCEDIMIENTO_QUIRURGICO_ID_EPISODIO foreign key (PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO)
      references EPISODIO_ATENCION (PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO) on delete restrict on update restrict;

alter table PROCEDIMIENTO_QUIRURGICO add constraint FK_PROFESIONAL_PROCEDIMIENTO_QUIRURGICO_ID_PROFESIONAL_RESPONSABLE foreign key (PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO)
      references PROFESIONAL (PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO) on delete restrict on update restrict;

alter table PROFESIONAL add constraint FK_USUARIO_PROFESIONAL_ID_USUARIO foreign key (USUARIO_ID_USUARIO)
      references USUARIO (USUARIO_ID_USUARIO) on delete restrict on update restrict;

alter table PROFESIONAL_ESPECIALIDAD add constraint FK_PROFESIONAL_ESPECIALIDAD foreign key (PROFESIONAL_ID_PROFESIONAL)
      references ESPECIALIDAD (PROFESIONAL_ID_PROFESIONAL) on delete restrict on update restrict;

alter table PROFESIONAL_ESPECIALIDAD add constraint FK_PROFESIONAL_ESPECIALIDAD foreign key (ESPECIALIDAD_ID_ESPECIALIDAD)
      references PROFESIONAL (ESPECIALIDAD_ID_ESPECIALIDAD) on delete restrict on update restrict;

alter table RESULTADO_LABORATORIO add constraint FK_DETALLE_SOLICITUD_LABORATORIO_RESULTADO_LABORATORIO_ID_DETALLE_SOLICITUD foreign key (RESULTADO_LABORATORIO_ID_RESULTADO)
      references DETALLE_SOLICITUD_LABORATORIO (RESULTADO_LABORATORIO_ID_RESULTADO) on delete restrict on update restrict;

alter table RESULTADO_LABORATORIO add constraint FK_PROFESIONAL_RESULTADO_LABORATORIO_ID_PROFESIONAL_VALIDADOR foreign key (RESULTADO_LABORATORIO_ID_RESULTADO)
      references PROFESIONAL (RESULTADO_LABORATORIO_ID_RESULTADO) on delete restrict on update restrict;

alter table ROL_PERMISO add constraint FK_ROL_PERMISO foreign key (ROL_ID_ROL)
      references PERMISO (ROL_ID_ROL) on delete restrict on update restrict;

alter table ROL_PERMISO add constraint FK_ROL_PERMISO foreign key (PERMISO_ID_PERMISO)
      references ROL (PERMISO_ID_PERMISO) on delete restrict on update restrict;

alter table SESION_USUARIO add constraint FK_USUARIO_SESION_USUARIO_ID_USUARIO foreign key (SESION_USUARIO_ID_SESION)
      references USUARIO (SESION_USUARIO_ID_SESION) on delete restrict on update restrict;

alter table SIGNO_VITAL add constraint FK_EPISODIO_ATENCION_SIGNO_VITAL_ID_EPISODIO foreign key (SIGNO_VITAL_ID_SIGNO)
      references EPISODIO_ATENCION (SIGNO_VITAL_ID_SIGNO) on delete restrict on update restrict;

alter table SIGNO_VITAL add constraint FK_PROFESIONAL_SIGNO_VITAL_ID_PROFESIONAL foreign key (SIGNO_VITAL_ID_SIGNO)
      references PROFESIONAL (SIGNO_VITAL_ID_SIGNO) on delete restrict on update restrict;

alter table SOLICITUD_LABORATORIO add constraint FK_EPISODIO_ATENCION_SOLICITUD_LABORATORIO_ID_EPISODIO foreign key (SOLICITUD_LABORATORIO_ID_SOLICITUD)
      references EPISODIO_ATENCION (SOLICITUD_LABORATORIO_ID_SOLICITUD) on delete restrict on update restrict;

alter table SOLICITUD_LABORATORIO add constraint FK_PROFESIONAL_SOLICITUD_LABORATORIO_ID_PROFESIONAL_SOLICITANTE foreign key (SOLICITUD_LABORATORIO_ID_SOLICITUD)
      references PROFESIONAL (SOLICITUD_LABORATORIO_ID_SOLICITUD) on delete restrict on update restrict;

alter table TRIAJE_EMERGENCIA add constraint FK_EPISODIO_ATENCION_TRIAJE_EMERGENCIA_ID_EPISODIO foreign key (TRIAJE_EMERGENCIA_ID_TRIAJE)
      references EPISODIO_ATENCION (TRIAJE_EMERGENCIA_ID_TRIAJE) on delete restrict on update restrict;

alter table TRIAJE_EMERGENCIA add constraint FK_PROFESIONAL_TRIAJE_EMERGENCIA_ID_PROFESIONAL foreign key (TRIAJE_EMERGENCIA_ID_TRIAJE)
      references PROFESIONAL (TRIAJE_EMERGENCIA_ID_TRIAJE) on delete restrict on update restrict;

alter table USUARIO add constraint FK_USUARIO_PACIENTE_ID_USUARIO_REGISTRO foreign key (PACIENTE_ID_PACIENTE)
      references PACIENTE (PACIENTE_ID_PACIENTE) on delete restrict on update restrict;

alter table USUARIO add constraint FK_USUARIO_PROFESIONAL_ID_USUARIO2 foreign key (PROFESIONAL_ID_PROFESIONAL)
      references PROFESIONAL (PROFESIONAL_ID_PROFESIONAL) on delete restrict on update restrict;

alter table USUARIO_ROL add constraint FK_USUARIO_ROL foreign key (USUARIO_ID_USUARIO)
      references ROL (USUARIO_ID_USUARIO) on delete restrict on update restrict;

alter table USUARIO_ROL add constraint FK_USUARIO_ROL foreign key (ROL_ID_ROL)
      references USUARIO (ROL_ID_ROL) on delete restrict on update restrict;



/* ============================================================= */
/* Table: PEDEP_DEPAR (Departamentos del personal hospitalario)  */
/* ============================================================= */
create table if not exists PEDEP_DEPAR
(
   PEDEP_CODIGO         char(3) not null,
   PEDEP_DESCRI         varchar(50) not null,
   constraint PK_PEDEP_DEPAR primary key (PEDEP_CODIGO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* ============================================================= */
/* Table: PECAR_CARGO (Cargos del personal hospitalario por Depto) */
/* ============================================================= */
create table if not exists PECAR_CARGO
(
   PEDEP_CODIGO         char(3) not null,
   PECAR_CODIGO         char(3) not null,
   PECAR_DESCRI         varchar(50) not null,
   constraint PK_PECAR_CARGO primary key (PEDEP_CODIGO, PECAR_CODIGO),
   constraint FK_PECAR_PEDEP foreign key (PEDEP_CODIGO)
      references PEDEP_DEPAR (PEDEP_CODIGO) on delete restrict on update restrict
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

alter table PECAR_CARGO comment 'Cargos del personal asociados a departamentos (PECAR)';