/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     4/11/2026 7:53:32                            */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ADMISION') and o.name = 'FK_ADMISION_EPISODIO__EPISODIO')
alter table ADMISION
   drop constraint FK_ADMISION_EPISODIO__EPISODIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ADMISION') and o.name = 'FK_ADMISION_PACIENTE__PACIENTE')
alter table ADMISION
   drop constraint FK_ADMISION_PACIENTE__PACIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AGENDA_MEDICA') and o.name = 'FK_AGENDA_M_CONSULTOR_CONSULTO')
alter table AGENDA_MEDICA
   drop constraint FK_AGENDA_M_CONSULTOR_CONSULTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AGENDA_MEDICA') and o.name = 'FK_AGENDA_M_ESPECIALI_ESPECIAL')
alter table AGENDA_MEDICA
   drop constraint FK_AGENDA_M_ESPECIALI_ESPECIAL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AGENDA_MEDICA') and o.name = 'FK_AGENDA_M_PROFESION_PROFESIO')
alter table AGENDA_MEDICA
   drop constraint FK_AGENDA_M_PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ALERGIA') and o.name = 'FK_ALERGIA_PACIENTE__PACIENTE')
alter table ALERGIA
   drop constraint FK_ALERGIA_PACIENTE__PACIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ANTECEDENTE_CLINICO') and o.name = 'FK_ANTECEDE_HISTORIA__HISTORIA')
alter table ANTECEDENTE_CLINICO
   drop constraint FK_ANTECEDE_HISTORIA__HISTORIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ANTECEDENTE_CLINICO') and o.name = 'FK_ANTECEDE_USUARIO_A_USUARIO')
alter table ANTECEDENTE_CLINICO
   drop constraint FK_ANTECEDE_USUARIO_A_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ASIGNACION_CAMA') and o.name = 'FK_ASIGNACI_ADMISION__ADMISION')
alter table ASIGNACION_CAMA
   drop constraint FK_ASIGNACI_ADMISION__ADMISION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ASIGNACION_CAMA') and o.name = 'FK_ASIGNACI_CAMA_ASIG_CAMA')
alter table ASIGNACION_CAMA
   drop constraint FK_ASIGNACI_CAMA_ASIG_CAMA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AUDITORIA') and o.name = 'FK_AUDITORI_USUARIO_A_USUARIO')
alter table AUDITORIA
   drop constraint FK_AUDITORI_USUARIO_A_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CAMA') and o.name = 'FK_CAMA_HABITACIO_HABITACI')
alter table CAMA
   drop constraint FK_CAMA_HABITACIO_HABITACI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CARGO') and o.name = 'FK_CARGO_CARGO_DET_DETALLE_')
alter table CARGO
   drop constraint FK_CARGO_CARGO_DET_DETALLE_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CARGO') and o.name = 'FK_CARGO_EPISODIO__EPISODIO')
alter table CARGO
   drop constraint FK_CARGO_EPISODIO__EPISODIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CARGO') and o.name = 'FK_CARGO_SERVICIO__SERVICIO')
alter table CARGO
   drop constraint FK_CARGO_SERVICIO__SERVICIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CITA') and o.name = 'FK_CITA_AGENDA_ME_AGENDA_M')
alter table CITA
   drop constraint FK_CITA_AGENDA_ME_AGENDA_M
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CITA') and o.name = 'FK_CITA_CITA_EPIS_EPISODIO')
alter table CITA
   drop constraint FK_CITA_CITA_EPIS_EPISODIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CITA') and o.name = 'FK_CITA_PACIENTE__PACIENTE')
alter table CITA
   drop constraint FK_CITA_PACIENTE__PACIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CITA') and o.name = 'FK_CITA_USUARIO_C_USUARIO')
alter table CITA
   drop constraint FK_CITA_USUARIO_C_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CONSULTA_MEDICA') and o.name = 'FK_CONSULTA_EPISODIO__EPISODIO')
alter table CONSULTA_MEDICA
   drop constraint FK_CONSULTA_EPISODIO__EPISODIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CONSULTA_MEDICA') and o.name = 'FK_CONSULTA_PROFESION_PROFESIO')
alter table CONSULTA_MEDICA
   drop constraint FK_CONSULTA_PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CONTACTO_EMERGENCIA') and o.name = 'FK_CONTACTO_PACIENTE__PACIENTE')
alter table CONTACTO_EMERGENCIA
   drop constraint FK_CONTACTO_PACIENTE__PACIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_DISPENSACION') and o.name = 'FK_DETALLE__DETALLE_P_DETALLE_')
alter table DETALLE_DISPENSACION
   drop constraint FK_DETALLE__DETALLE_P_DETALLE_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_DISPENSACION') and o.name = 'FK_DETALLE__DISPENSAC_DISPENSA')
alter table DETALLE_DISPENSACION
   drop constraint FK_DETALLE__DISPENSAC_DISPENSA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_DISPENSACION') and o.name = 'FK_DETALLE__LOTE_DETA_LOTE')
alter table DETALLE_DISPENSACION
   drop constraint FK_DETALLE__LOTE_DETA_LOTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_FACTURA') and o.name = 'FK_DETALLE__CARGO_DET_CARGO')
alter table DETALLE_FACTURA
   drop constraint FK_DETALLE__CARGO_DET_CARGO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_FACTURA') and o.name = 'FK_DETALLE__FACTURA_D_FACTURA')
alter table DETALLE_FACTURA
   drop constraint FK_DETALLE__FACTURA_D_FACTURA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_PRESCRIPCION') and o.name = 'FK_DETALLE__MEDICAMEN_MEDICAME')
alter table DETALLE_PRESCRIPCION
   drop constraint FK_DETALLE__MEDICAMEN_MEDICAME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_PRESCRIPCION') and o.name = 'FK_DETALLE__PRESCRIPC_PRESCRIP')
alter table DETALLE_PRESCRIPCION
   drop constraint FK_DETALLE__PRESCRIPC_PRESCRIP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_SOLICITUD_LABORATORIO') and o.name = 'FK_DETALLE__PRUEBA_LA_PRUEBA_L')
alter table DETALLE_SOLICITUD_LABORATORIO
   drop constraint FK_DETALLE__PRUEBA_LA_PRUEBA_L
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_SOLICITUD_LABORATORIO') and o.name = 'FK_DETALLE__SOLICITUD_SOLICITU')
alter table DETALLE_SOLICITUD_LABORATORIO
   drop constraint FK_DETALLE__SOLICITUD_SOLICITU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DIAGNOSTICO') and o.name = 'FK_DIAGNOST_EPISODIO__EPISODIO')
alter table DIAGNOSTICO
   drop constraint FK_DIAGNOST_EPISODIO__EPISODIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DIAGNOSTICO') and o.name = 'FK_DIAGNOST_PROFESION_PROFESIO')
alter table DIAGNOSTICO
   drop constraint FK_DIAGNOST_PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DISPENSACION') and o.name = 'FK_DISPENSA_PRESCRIPC_PRESCRIP')
alter table DISPENSACION
   drop constraint FK_DISPENSA_PRESCRIPC_PRESCRIP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DISPENSACION') and o.name = 'FK_DISPENSA_USUARIO_D_USUARIO')
alter table DISPENSACION
   drop constraint FK_DISPENSA_USUARIO_D_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EPISODIO_ATENCION') and o.name = 'FK_EPISODIO_CITA_EPIS_CITA')
alter table EPISODIO_ATENCION
   drop constraint FK_EPISODIO_CITA_EPIS_CITA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EPISODIO_ATENCION') and o.name = 'FK_EPISODIO_HISTORIA__HISTORIA')
alter table EPISODIO_ATENCION
   drop constraint FK_EPISODIO_HISTORIA__HISTORIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EPISODIO_ATENCION') and o.name = 'FK_EPISODIO_PACIENTE__PACIENTE')
alter table EPISODIO_ATENCION
   drop constraint FK_EPISODIO_PACIENTE__PACIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EPISODIO_ATENCION') and o.name = 'FK_EPISODIO_PROFESION_PROFESIO')
alter table EPISODIO_ATENCION
   drop constraint FK_EPISODIO_PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ESTUDIO_IMAGEN') and o.name = 'FK_ESTUDIO__EPISODIO__EPISODIO')
alter table ESTUDIO_IMAGEN
   drop constraint FK_ESTUDIO__EPISODIO__EPISODIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ESTUDIO_IMAGEN') and o.name = 'FK_ESTUDIO__ESTUDIO_I_INFORME_')
alter table ESTUDIO_IMAGEN
   drop constraint FK_ESTUDIO__ESTUDIO_I_INFORME_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ESTUDIO_IMAGEN') and o.name = 'FK_ESTUDIO__PROFESION_PROFESIO')
alter table ESTUDIO_IMAGEN
   drop constraint FK_ESTUDIO__PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FACTURA') and o.name = 'FK_FACTURA_FACTURA_F_FACTURA')
alter table FACTURA
   drop constraint FK_FACTURA_FACTURA_F_FACTURA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FACTURA') and o.name = 'FK_FACTURA_PACIENTE__PACIENTE')
alter table FACTURA
   drop constraint FK_FACTURA_PACIENTE__PACIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HABITACION') and o.name = 'FK_HABITACI_AREA_HOSP_AREA_HOS')
alter table HABITACION
   drop constraint FK_HABITACI_AREA_HOSP_AREA_HOS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HISTORIAL_CITA') and o.name = 'FK_HISTORIA_CITA_HIST_CITA')
alter table HISTORIAL_CITA
   drop constraint FK_HISTORIA_CITA_HIST_CITA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HISTORIAL_CITA') and o.name = 'FK_HISTORIA_USUARIO_H_USUARIO')
alter table HISTORIAL_CITA
   drop constraint FK_HISTORIA_USUARIO_H_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HISTORIA_CLINICA') and o.name = 'FK_HISTORIA_PACIENTE__PACIENTE')
alter table HISTORIA_CLINICA
   drop constraint FK_HISTORIA_PACIENTE__PACIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('INFORME_IMAGEN') and o.name = 'FK_INFORME__ESTUDIO_I_ESTUDIO_')
alter table INFORME_IMAGEN
   drop constraint FK_INFORME__ESTUDIO_I_ESTUDIO_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('INFORME_IMAGEN') and o.name = 'FK_INFORME__PROFESION_PROFESIO')
alter table INFORME_IMAGEN
   drop constraint FK_INFORME__PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOTE') and o.name = 'FK_LOTE_MEDICAMEN_MEDICAME')
alter table LOTE
   drop constraint FK_LOTE_MEDICAMEN_MEDICAME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MOVIMIENTO_INVENTARIO') and o.name = 'FK_MOVIMIEN_DETALLE_D_DETALLE_')
alter table MOVIMIENTO_INVENTARIO
   drop constraint FK_MOVIMIEN_DETALLE_D_DETALLE_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MOVIMIENTO_INVENTARIO') and o.name = 'FK_MOVIMIEN_LOTE_MOVI_LOTE')
alter table MOVIMIENTO_INVENTARIO
   drop constraint FK_MOVIMIEN_LOTE_MOVI_LOTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MOVIMIENTO_INVENTARIO') and o.name = 'FK_MOVIMIEN_USUARIO_M_USUARIO')
alter table MOVIMIENTO_INVENTARIO
   drop constraint FK_MOVIMIEN_USUARIO_M_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NOTA_CLINICA') and o.name = 'FK_NOTA_CLI_EPISODIO__EPISODIO')
alter table NOTA_CLINICA
   drop constraint FK_NOTA_CLI_EPISODIO__EPISODIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NOTA_CLINICA') and o.name = 'FK_NOTA_CLI_NOTA_CLIN_NOTA_CLI')
alter table NOTA_CLINICA
   drop constraint FK_NOTA_CLI_NOTA_CLIN_NOTA_CLI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NOTA_CLINICA') and o.name = 'FK_NOTA_CLI_USUARIO_N_USUARIO')
alter table NOTA_CLINICA
   drop constraint FK_NOTA_CLI_USUARIO_N_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NOTA_ENFERMERIA') and o.name = 'FK_NOTA_ENF_EPISODIO__EPISODIO')
alter table NOTA_ENFERMERIA
   drop constraint FK_NOTA_ENF_EPISODIO__EPISODIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NOTA_ENFERMERIA') and o.name = 'FK_NOTA_ENF_PROFESION_PROFESIO')
alter table NOTA_ENFERMERIA
   drop constraint FK_NOTA_ENF_PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PACIENTE') and o.name = 'FK_PACIENTE_PACIENTE__HISTORIA')
alter table PACIENTE
   drop constraint FK_PACIENTE_PACIENTE__HISTORIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PAGO') and o.name = 'FK_PAGO_FACTURA_P_FACTURA')
alter table PAGO
   drop constraint FK_PAGO_FACTURA_P_FACTURA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PAGO') and o.name = 'FK_PAGO_USUARIO_P_USUARIO')
alter table PAGO
   drop constraint FK_PAGO_USUARIO_P_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PARTICIPACION_QUIRURGICA') and o.name = 'FK_PARTICIP_PROCEDIMI_PROCEDIM')
alter table PARTICIPACION_QUIRURGICA
   drop constraint FK_PARTICIP_PROCEDIMI_PROCEDIM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PARTICIPACION_QUIRURGICA') and o.name = 'FK_PARTICIP_PROFESION_PROFESIO')
alter table PARTICIPACION_QUIRURGICA
   drop constraint FK_PARTICIP_PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRESCRIPCION') and o.name = 'FK_PRESCRIP_EPISODIO__EPISODIO')
alter table PRESCRIPCION
   drop constraint FK_PRESCRIP_EPISODIO__EPISODIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRESCRIPCION') and o.name = 'FK_PRESCRIP_PROFESION_PROFESIO')
alter table PRESCRIPCION
   drop constraint FK_PRESCRIP_PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PROCEDIMIENTO_QUIRURGICO') and o.name = 'FK_PROCEDIM_EPISODIO__EPISODIO')
alter table PROCEDIMIENTO_QUIRURGICO
   drop constraint FK_PROCEDIM_EPISODIO__EPISODIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PROCEDIMIENTO_QUIRURGICO') and o.name = 'FK_PROCEDIM_PROFESION_PROFESIO')
alter table PROCEDIMIENTO_QUIRURGICO
   drop constraint FK_PROCEDIM_PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PROFESIONAL') and o.name = 'FK_PROFESIO_USUARIO_P_USUARIO')
alter table PROFESIONAL
   drop constraint FK_PROFESIO_USUARIO_P_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PROFESIONAL_ESPECIALIDAD') and o.name = 'FK_PROFESIO_PROFESION_ESPECIAL')
alter table PROFESIONAL_ESPECIALIDAD
   drop constraint FK_PROFESIO_PROFESION_ESPECIAL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PROFESIONAL_ESPECIALIDAD') and o.name = 'FK_PROFESIO_PROFESION_PROFESIO')
alter table PROFESIONAL_ESPECIALIDAD
   drop constraint FK_PROFESIO_PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RESULTADO_LABORATORIO') and o.name = 'FK_RESULTAD_DETALLE_S_DETALLE_')
alter table RESULTADO_LABORATORIO
   drop constraint FK_RESULTAD_DETALLE_S_DETALLE_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RESULTADO_LABORATORIO') and o.name = 'FK_RESULTAD_PROFESION_PROFESIO')
alter table RESULTADO_LABORATORIO
   drop constraint FK_RESULTAD_PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ROL_PERMISO') and o.name = 'FK_ROL_PERM_ROL_PERMI_PERMISO')
alter table ROL_PERMISO
   drop constraint FK_ROL_PERM_ROL_PERMI_PERMISO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ROL_PERMISO') and o.name = 'FK_ROL_PERM_ROL_PERMI_ROL')
alter table ROL_PERMISO
   drop constraint FK_ROL_PERM_ROL_PERMI_ROL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SESION_USUARIO') and o.name = 'FK_SESION_U_USUARIO_S_USUARIO')
alter table SESION_USUARIO
   drop constraint FK_SESION_U_USUARIO_S_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SIGNO_VITAL') and o.name = 'FK_SIGNO_VI_EPISODIO__EPISODIO')
alter table SIGNO_VITAL
   drop constraint FK_SIGNO_VI_EPISODIO__EPISODIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SIGNO_VITAL') and o.name = 'FK_SIGNO_VI_PROFESION_PROFESIO')
alter table SIGNO_VITAL
   drop constraint FK_SIGNO_VI_PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SOLICITUD_LABORATORIO') and o.name = 'FK_SOLICITU_EPISODIO__EPISODIO')
alter table SOLICITUD_LABORATORIO
   drop constraint FK_SOLICITU_EPISODIO__EPISODIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SOLICITUD_LABORATORIO') and o.name = 'FK_SOLICITU_PROFESION_PROFESIO')
alter table SOLICITUD_LABORATORIO
   drop constraint FK_SOLICITU_PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRIAJE_EMERGENCIA') and o.name = 'FK_TRIAJE_E_EPISODIO__EPISODIO')
alter table TRIAJE_EMERGENCIA
   drop constraint FK_TRIAJE_E_EPISODIO__EPISODIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRIAJE_EMERGENCIA') and o.name = 'FK_TRIAJE_E_PROFESION_PROFESIO')
alter table TRIAJE_EMERGENCIA
   drop constraint FK_TRIAJE_E_PROFESION_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('USUARIO') and o.name = 'FK_USUARIO_USUARIO_P_PACIENTE')
alter table USUARIO
   drop constraint FK_USUARIO_USUARIO_P_PACIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('USUARIO') and o.name = 'FK_USUARIO_USUARIO_P_PROFESIO')
alter table USUARIO
   drop constraint FK_USUARIO_USUARIO_P_PROFESIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('USUARIO_ROL') and o.name = 'FK_USUARIO__USUARIO_R_ROL')
alter table USUARIO_ROL
   drop constraint FK_USUARIO__USUARIO_R_ROL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('USUARIO_ROL') and o.name = 'FK_USUARIO__USUARIO_R_USUARIO')
alter table USUARIO_ROL
   drop constraint FK_USUARIO__USUARIO_R_USUARIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ADMISION')
            and   name  = 'EPISODIO_ATENCION_ADMISION_ID_EPISODIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index ADMISION.EPISODIO_ATENCION_ADMISION_ID_EPISODIO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ADMISION')
            and   name  = 'PACIENTE_ADMISION_ID_PACIENTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index ADMISION.PACIENTE_ADMISION_ID_PACIENTE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ADMISION')
            and   type = 'U')
   drop table ADMISION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AGENDA_MEDICA')
            and   name  = 'ESPECIALIDAD_AGENDA_MEDICA_ID_ESPECIALIDAD_FK'
            and   indid > 0
            and   indid < 255)
   drop index AGENDA_MEDICA.ESPECIALIDAD_AGENDA_MEDICA_ID_ESPECIALIDAD_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AGENDA_MEDICA')
            and   name  = 'PROFESIONAL_AGENDA_MEDICA_ID_PROFESIONAL_FK'
            and   indid > 0
            and   indid < 255)
   drop index AGENDA_MEDICA.PROFESIONAL_AGENDA_MEDICA_ID_PROFESIONAL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AGENDA_MEDICA')
            and   name  = 'CONSULTORIO_AGENDA_MEDICA_ID_CONSULTORIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index AGENDA_MEDICA.CONSULTORIO_AGENDA_MEDICA_ID_CONSULTORIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AGENDA_MEDICA')
            and   type = 'U')
   drop table AGENDA_MEDICA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ALERGIA')
            and   name  = 'PACIENTE_ALERGIA_ID_PACIENTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index ALERGIA.PACIENTE_ALERGIA_ID_PACIENTE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ALERGIA')
            and   type = 'U')
   drop table ALERGIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ANTECEDENTE_CLINICO')
            and   name  = 'USUARIO_ANTECEDENTE_CLINICO_ID_USUARIO_AUTOR_FK'
            and   indid > 0
            and   indid < 255)
   drop index ANTECEDENTE_CLINICO.USUARIO_ANTECEDENTE_CLINICO_ID_USUARIO_AUTOR_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ANTECEDENTE_CLINICO')
            and   name  = 'HISTORIA_CLINICA_ANTECEDENTE_CLINICO_ID_HISTORIA_FK'
            and   indid > 0
            and   indid < 255)
   drop index ANTECEDENTE_CLINICO.HISTORIA_CLINICA_ANTECEDENTE_CLINICO_ID_HISTORIA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ANTECEDENTE_CLINICO')
            and   type = 'U')
   drop table ANTECEDENTE_CLINICO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AREA_HOSPITALARIA')
            and   type = 'U')
   drop table AREA_HOSPITALARIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ASIGNACION_CAMA')
            and   name  = 'CAMA_ASIGNACION_CAMA_ID_CAMA_FK'
            and   indid > 0
            and   indid < 255)
   drop index ASIGNACION_CAMA.CAMA_ASIGNACION_CAMA_ID_CAMA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ASIGNACION_CAMA')
            and   name  = 'ADMISION_ASIGNACION_CAMA_ID_ADMISION_FK'
            and   indid > 0
            and   indid < 255)
   drop index ASIGNACION_CAMA.ADMISION_ASIGNACION_CAMA_ID_ADMISION_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ASIGNACION_CAMA')
            and   type = 'U')
   drop table ASIGNACION_CAMA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AUDITORIA')
            and   name  = 'USUARIO_AUDITORIA_ID_USUARIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index AUDITORIA.USUARIO_AUDITORIA_ID_USUARIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AUDITORIA')
            and   type = 'U')
   drop table AUDITORIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CAMA')
            and   name  = 'HABITACION_CAMA_ID_HABITACION_FK'
            and   indid > 0
            and   indid < 255)
   drop index CAMA.HABITACION_CAMA_ID_HABITACION_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CAMA')
            and   type = 'U')
   drop table CAMA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CARGO')
            and   name  = 'EPISODIO_ATENCION_CARGO_ID_EPISODIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index CARGO.EPISODIO_ATENCION_CARGO_ID_EPISODIO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CARGO')
            and   name  = 'CARGO_DETALLE_FACTURA_ID_CARGO_FK'
            and   indid > 0
            and   indid < 255)
   drop index CARGO.CARGO_DETALLE_FACTURA_ID_CARGO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CARGO')
            and   name  = 'SERVICIO_FACTURABLE_CARGO_ID_SERVICIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index CARGO.SERVICIO_FACTURABLE_CARGO_ID_SERVICIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CARGO')
            and   type = 'U')
   drop table CARGO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CITA')
            and   name  = 'CITA_EPISODIO_ATENCION_ID_CITA_FK'
            and   indid > 0
            and   indid < 255)
   drop index CITA.CITA_EPISODIO_ATENCION_ID_CITA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CITA')
            and   name  = 'USUARIO_CITA_ID_USUARIO_REGISTRO_FK'
            and   indid > 0
            and   indid < 255)
   drop index CITA.USUARIO_CITA_ID_USUARIO_REGISTRO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CITA')
            and   name  = 'AGENDA_MEDICA_CITA_ID_AGENDA_FK'
            and   indid > 0
            and   indid < 255)
   drop index CITA.AGENDA_MEDICA_CITA_ID_AGENDA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CITA')
            and   name  = 'PACIENTE_CITA_ID_PACIENTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index CITA.PACIENTE_CITA_ID_PACIENTE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CITA')
            and   type = 'U')
   drop table CITA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CONSULTA_MEDICA')
            and   name  = 'PROFESIONAL_CONSULTA_MEDICA_ID_PROFESIONAL_FK'
            and   indid > 0
            and   indid < 255)
   drop index CONSULTA_MEDICA.PROFESIONAL_CONSULTA_MEDICA_ID_PROFESIONAL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CONSULTA_MEDICA')
            and   name  = 'EPISODIO_ATENCION_CONSULTA_MEDICA_ID_EPISODIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index CONSULTA_MEDICA.EPISODIO_ATENCION_CONSULTA_MEDICA_ID_EPISODIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CONSULTA_MEDICA')
            and   type = 'U')
   drop table CONSULTA_MEDICA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CONSULTORIO')
            and   type = 'U')
   drop table CONSULTORIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CONTACTO_EMERGENCIA')
            and   name  = 'PACIENTE_CONTACTO_EMERGENCIA_ID_PACIENTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index CONTACTO_EMERGENCIA.PACIENTE_CONTACTO_EMERGENCIA_ID_PACIENTE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CONTACTO_EMERGENCIA')
            and   type = 'U')
   drop table CONTACTO_EMERGENCIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_DISPENSACION')
            and   name  = 'LOTE_DETALLE_DISPENSACION_ID_LOTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_DISPENSACION.LOTE_DETALLE_DISPENSACION_ID_LOTE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_DISPENSACION')
            and   name  = 'DETALLE_PRESCRIPCION_DETALLE_DISPENSACION_ID_DETALLE_PRESCRIPCION_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_DISPENSACION.DETALLE_PRESCRIPCION_DETALLE_DISPENSACION_ID_DETALLE_PRESCRIPCION_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_DISPENSACION')
            and   name  = 'DISPENSACION_DETALLE_DISPENSACION_ID_DISPENSACION_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_DISPENSACION.DISPENSACION_DETALLE_DISPENSACION_ID_DISPENSACION_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DETALLE_DISPENSACION')
            and   type = 'U')
   drop table DETALLE_DISPENSACION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_FACTURA')
            and   name  = 'CARGO_DETALLE_FACTURA_ID_CARGO2_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_FACTURA.CARGO_DETALLE_FACTURA_ID_CARGO2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_FACTURA')
            and   name  = 'FACTURA_DETALLE_FACTURA_ID_FACTURA_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_FACTURA.FACTURA_DETALLE_FACTURA_ID_FACTURA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DETALLE_FACTURA')
            and   type = 'U')
   drop table DETALLE_FACTURA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_PRESCRIPCION')
            and   name  = 'MEDICAMENTO_DETALLE_PRESCRIPCION_ID_MEDICAMENTO_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_PRESCRIPCION.MEDICAMENTO_DETALLE_PRESCRIPCION_ID_MEDICAMENTO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_PRESCRIPCION')
            and   name  = 'PRESCRIPCION_DETALLE_PRESCRIPCION_ID_PRESCRIPCION_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_PRESCRIPCION.PRESCRIPCION_DETALLE_PRESCRIPCION_ID_PRESCRIPCION_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DETALLE_PRESCRIPCION')
            and   type = 'U')
   drop table DETALLE_PRESCRIPCION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_SOLICITUD_LABORATORIO')
            and   name  = 'PRUEBA_LABORATORIO_DETALLE_SOLICITUD_LABORATORIO_ID_PRUEBA_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_SOLICITUD_LABORATORIO.PRUEBA_LABORATORIO_DETALLE_SOLICITUD_LABORATORIO_ID_PRUEBA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_SOLICITUD_LABORATORIO')
            and   name  = 'SOLICITUD_LABORATORIO_DETALLE_SOLICITUD_LABORATORIO_ID_SOLICITUD_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_SOLICITUD_LABORATORIO.SOLICITUD_LABORATORIO_DETALLE_SOLICITUD_LABORATORIO_ID_SOLICITUD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DETALLE_SOLICITUD_LABORATORIO')
            and   type = 'U')
   drop table DETALLE_SOLICITUD_LABORATORIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DIAGNOSTICO')
            and   name  = 'PROFESIONAL_DIAGNOSTICO_ID_PROFESIONAL_FK'
            and   indid > 0
            and   indid < 255)
   drop index DIAGNOSTICO.PROFESIONAL_DIAGNOSTICO_ID_PROFESIONAL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DIAGNOSTICO')
            and   name  = 'EPISODIO_ATENCION_DIAGNOSTICO_ID_EPISODIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index DIAGNOSTICO.EPISODIO_ATENCION_DIAGNOSTICO_ID_EPISODIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DIAGNOSTICO')
            and   type = 'U')
   drop table DIAGNOSTICO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DISPENSACION')
            and   name  = 'USUARIO_DISPENSACION_ID_USUARIO_FARMACIA_FK'
            and   indid > 0
            and   indid < 255)
   drop index DISPENSACION.USUARIO_DISPENSACION_ID_USUARIO_FARMACIA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DISPENSACION')
            and   name  = 'PRESCRIPCION_DISPENSACION_ID_PRESCRIPCION_FK'
            and   indid > 0
            and   indid < 255)
   drop index DISPENSACION.PRESCRIPCION_DISPENSACION_ID_PRESCRIPCION_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DISPENSACION')
            and   type = 'U')
   drop table DISPENSACION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EPISODIO_ATENCION')
            and   name  = 'CITA_EPISODIO_ATENCION_ID_CITA2_FK'
            and   indid > 0
            and   indid < 255)
   drop index EPISODIO_ATENCION.CITA_EPISODIO_ATENCION_ID_CITA2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EPISODIO_ATENCION')
            and   name  = 'PROFESIONAL_EPISODIO_ATENCION_ID_PROFESIONAL_RESPONSABLE_FK'
            and   indid > 0
            and   indid < 255)
   drop index EPISODIO_ATENCION.PROFESIONAL_EPISODIO_ATENCION_ID_PROFESIONAL_RESPONSABLE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EPISODIO_ATENCION')
            and   name  = 'PACIENTE_EPISODIO_ATENCION_ID_PACIENTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index EPISODIO_ATENCION.PACIENTE_EPISODIO_ATENCION_ID_PACIENTE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EPISODIO_ATENCION')
            and   name  = 'HISTORIA_CLINICA_EPISODIOS_FK'
            and   indid > 0
            and   indid < 255)
   drop index EPISODIO_ATENCION.HISTORIA_CLINICA_EPISODIOS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EPISODIO_ATENCION')
            and   type = 'U')
   drop table EPISODIO_ATENCION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESPECIALIDAD')
            and   type = 'U')
   drop table ESPECIALIDAD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ESTUDIO_IMAGEN')
            and   name  = 'ESTUDIO_IMAGEN_INFORME_IMAGEN_ID_ESTUDIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index ESTUDIO_IMAGEN.ESTUDIO_IMAGEN_INFORME_IMAGEN_ID_ESTUDIO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ESTUDIO_IMAGEN')
            and   name  = 'PROFESIONAL_ESTUDIO_IMAGEN_ID_PROFESIONAL_SOLICITANTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index ESTUDIO_IMAGEN.PROFESIONAL_ESTUDIO_IMAGEN_ID_PROFESIONAL_SOLICITANTE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ESTUDIO_IMAGEN')
            and   name  = 'EPISODIO_ATENCION_ESTUDIO_IMAGEN_ID_EPISODIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index ESTUDIO_IMAGEN.EPISODIO_ATENCION_ESTUDIO_IMAGEN_ID_EPISODIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESTUDIO_IMAGEN')
            and   type = 'U')
   drop table ESTUDIO_IMAGEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FACTURA')
            and   name  = 'FACTURA_FACTURA_ID_FACTURA_ORIGINAL_FK'
            and   indid > 0
            and   indid < 255)
   drop index FACTURA.FACTURA_FACTURA_ID_FACTURA_ORIGINAL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FACTURA')
            and   name  = 'PACIENTE_FACTURA_ID_PACIENTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index FACTURA.PACIENTE_FACTURA_ID_PACIENTE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FACTURA')
            and   type = 'U')
   drop table FACTURA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HABITACION')
            and   name  = 'AREA_HOSPITALARIA_HABITACION_ID_AREA_FK'
            and   indid > 0
            and   indid < 255)
   drop index HABITACION.AREA_HOSPITALARIA_HABITACION_ID_AREA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HABITACION')
            and   type = 'U')
   drop table HABITACION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HISTORIAL_CITA')
            and   name  = 'USUARIO_HISTORIAL_CITA_ID_USUARIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index HISTORIAL_CITA.USUARIO_HISTORIAL_CITA_ID_USUARIO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HISTORIAL_CITA')
            and   name  = 'CITA_HISTORIAL_CITA_ID_CITA_FK'
            and   indid > 0
            and   indid < 255)
   drop index HISTORIAL_CITA.CITA_HISTORIAL_CITA_ID_CITA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HISTORIAL_CITA')
            and   type = 'U')
   drop table HISTORIAL_CITA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HISTORIA_CLINICA')
            and   name  = 'PACIENTE_HISTORIA_CLINICA_ID_PACIENTE2_FK'
            and   indid > 0
            and   indid < 255)
   drop index HISTORIA_CLINICA.PACIENTE_HISTORIA_CLINICA_ID_PACIENTE2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HISTORIA_CLINICA')
            and   type = 'U')
   drop table HISTORIA_CLINICA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('INFORME_IMAGEN')
            and   name  = 'PROFESIONAL_INFORME_IMAGEN_ID_PROFESIONAL_INFORMANTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index INFORME_IMAGEN.PROFESIONAL_INFORME_IMAGEN_ID_PROFESIONAL_INFORMANTE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('INFORME_IMAGEN')
            and   name  = 'ESTUDIO_IMAGEN_INFORME_IMAGEN_ID_ESTUDIO2_FK'
            and   indid > 0
            and   indid < 255)
   drop index INFORME_IMAGEN.ESTUDIO_IMAGEN_INFORME_IMAGEN_ID_ESTUDIO2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('INFORME_IMAGEN')
            and   type = 'U')
   drop table INFORME_IMAGEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LOTE')
            and   name  = 'MEDICAMENTO_LOTE_ID_MEDICAMENTO_FK'
            and   indid > 0
            and   indid < 255)
   drop index LOTE.MEDICAMENTO_LOTE_ID_MEDICAMENTO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOTE')
            and   type = 'U')
   drop table LOTE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MEDICAMENTO')
            and   type = 'U')
   drop table MEDICAMENTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MOVIMIENTO_INVENTARIO')
            and   name  = 'DETALLE_DISPENSACION_MOVIMIENTO_INVENTARIO_ID_DETALLE_DISPENSACION_FK'
            and   indid > 0
            and   indid < 255)
   drop index MOVIMIENTO_INVENTARIO.DETALLE_DISPENSACION_MOVIMIENTO_INVENTARIO_ID_DETALLE_DISPENSACION_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MOVIMIENTO_INVENTARIO')
            and   name  = 'USUARIO_MOVIMIENTO_INVENTARIO_ID_USUARIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index MOVIMIENTO_INVENTARIO.USUARIO_MOVIMIENTO_INVENTARIO_ID_USUARIO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MOVIMIENTO_INVENTARIO')
            and   name  = 'LOTE_MOVIMIENTO_INVENTARIO_ID_LOTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index MOVIMIENTO_INVENTARIO.LOTE_MOVIMIENTO_INVENTARIO_ID_LOTE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MOVIMIENTO_INVENTARIO')
            and   type = 'U')
   drop table MOVIMIENTO_INVENTARIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NOTA_CLINICA')
            and   name  = 'USUARIO_NOTA_CLINICA_ID_USUARIO_AUTOR_FK'
            and   indid > 0
            and   indid < 255)
   drop index NOTA_CLINICA.USUARIO_NOTA_CLINICA_ID_USUARIO_AUTOR_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NOTA_CLINICA')
            and   name  = 'NOTA_CLINICA_NOTA_CLINICA_ID_NOTA_ORIGINAL_FK'
            and   indid > 0
            and   indid < 255)
   drop index NOTA_CLINICA.NOTA_CLINICA_NOTA_CLINICA_ID_NOTA_ORIGINAL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NOTA_CLINICA')
            and   name  = 'EPISODIO_ATENCION_NOTA_CLINICA_ID_EPISODIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index NOTA_CLINICA.EPISODIO_ATENCION_NOTA_CLINICA_ID_EPISODIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NOTA_CLINICA')
            and   type = 'U')
   drop table NOTA_CLINICA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NOTA_ENFERMERIA')
            and   name  = 'PROFESIONAL_NOTA_ENFERMERIA_ID_PROFESIONAL_FK'
            and   indid > 0
            and   indid < 255)
   drop index NOTA_ENFERMERIA.PROFESIONAL_NOTA_ENFERMERIA_ID_PROFESIONAL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NOTA_ENFERMERIA')
            and   name  = 'EPISODIO_ATENCION_NOTA_ENFERMERIA_ID_EPISODIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index NOTA_ENFERMERIA.EPISODIO_ATENCION_NOTA_ENFERMERIA_ID_EPISODIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NOTA_ENFERMERIA')
            and   type = 'U')
   drop table NOTA_ENFERMERIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PACIENTE')
            and   name  = 'PACIENTE_HISTORIA_CLINICA_ID_PACIENTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index PACIENTE.PACIENTE_HISTORIA_CLINICA_ID_PACIENTE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PACIENTE')
            and   type = 'U')
   drop table PACIENTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PAGO')
            and   name  = 'USUARIO_PAGO_ID_USUARIO_REGISTRO_FK'
            and   indid > 0
            and   indid < 255)
   drop index PAGO.USUARIO_PAGO_ID_USUARIO_REGISTRO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PAGO')
            and   name  = 'FACTURA_PAGO_ID_FACTURA_FK'
            and   indid > 0
            and   indid < 255)
   drop index PAGO.FACTURA_PAGO_ID_FACTURA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PAGO')
            and   type = 'U')
   drop table PAGO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PARTICIPACION_QUIRURGICA')
            and   name  = 'PROFESIONAL_PARTICIPACION_QUIRURGICA_ID_PROFESIONAL_FK'
            and   indid > 0
            and   indid < 255)
   drop index PARTICIPACION_QUIRURGICA.PROFESIONAL_PARTICIPACION_QUIRURGICA_ID_PROFESIONAL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PARTICIPACION_QUIRURGICA')
            and   name  = 'PROCEDIMIENTO_QUIRURGICO_PARTICIPACION_QUIRURGICA_ID_PROCEDIMIENTO_FK'
            and   indid > 0
            and   indid < 255)
   drop index PARTICIPACION_QUIRURGICA.PROCEDIMIENTO_QUIRURGICO_PARTICIPACION_QUIRURGICA_ID_PROCEDIMIENTO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PARTICIPACION_QUIRURGICA')
            and   type = 'U')
   drop table PARTICIPACION_QUIRURGICA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PERMISO')
            and   type = 'U')
   drop table PERMISO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRESCRIPCION')
            and   name  = 'PROFESIONAL_PRESCRIPCION_ID_PROFESIONAL_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRESCRIPCION.PROFESIONAL_PRESCRIPCION_ID_PROFESIONAL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRESCRIPCION')
            and   name  = 'EPISODIO_ATENCION_PRESCRIPCION_ID_EPISODIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRESCRIPCION.EPISODIO_ATENCION_PRESCRIPCION_ID_EPISODIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRESCRIPCION')
            and   type = 'U')
   drop table PRESCRIPCION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PROCEDIMIENTO_QUIRURGICO')
            and   name  = 'PROFESIONAL_PROCEDIMIENTO_QUIRURGICO_ID_PROFESIONAL_RESPONSABLE_FK'
            and   indid > 0
            and   indid < 255)
   drop index PROCEDIMIENTO_QUIRURGICO.PROFESIONAL_PROCEDIMIENTO_QUIRURGICO_ID_PROFESIONAL_RESPONSABLE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PROCEDIMIENTO_QUIRURGICO')
            and   name  = 'EPISODIO_ATENCION_PROCEDIMIENTO_QUIRURGICO_ID_EPISODIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index PROCEDIMIENTO_QUIRURGICO.EPISODIO_ATENCION_PROCEDIMIENTO_QUIRURGICO_ID_EPISODIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROCEDIMIENTO_QUIRURGICO')
            and   type = 'U')
   drop table PROCEDIMIENTO_QUIRURGICO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PROFESIONAL')
            and   name  = 'USUARIO_PROFESIONAL_ID_USUARIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index PROFESIONAL.USUARIO_PROFESIONAL_ID_USUARIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROFESIONAL')
            and   type = 'U')
   drop table PROFESIONAL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PROFESIONAL_ESPECIALIDAD')
            and   name  = 'PROFESIONAL_ESPECIALIDAD_FK2'
            and   indid > 0
            and   indid < 255)
   drop index PROFESIONAL_ESPECIALIDAD.PROFESIONAL_ESPECIALIDAD_FK2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PROFESIONAL_ESPECIALIDAD')
            and   name  = 'PROFESIONAL_ESPECIALIDAD_FK'
            and   indid > 0
            and   indid < 255)
   drop index PROFESIONAL_ESPECIALIDAD.PROFESIONAL_ESPECIALIDAD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROFESIONAL_ESPECIALIDAD')
            and   type = 'U')
   drop table PROFESIONAL_ESPECIALIDAD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRUEBA_LABORATORIO')
            and   type = 'U')
   drop table PRUEBA_LABORATORIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RESULTADO_LABORATORIO')
            and   name  = 'PROFESIONAL_RESULTADO_LABORATORIO_ID_PROFESIONAL_VALIDADOR_FK'
            and   indid > 0
            and   indid < 255)
   drop index RESULTADO_LABORATORIO.PROFESIONAL_RESULTADO_LABORATORIO_ID_PROFESIONAL_VALIDADOR_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RESULTADO_LABORATORIO')
            and   name  = 'DETALLE_SOLICITUD_LABORATORIO_RESULTADO_LABORATORIO_ID_DETALLE_SOLICITUD_FK'
            and   indid > 0
            and   indid < 255)
   drop index RESULTADO_LABORATORIO.DETALLE_SOLICITUD_LABORATORIO_RESULTADO_LABORATORIO_ID_DETALLE_SOLICITUD_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RESULTADO_LABORATORIO')
            and   type = 'U')
   drop table RESULTADO_LABORATORIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ROL')
            and   type = 'U')
   drop table ROL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ROL_PERMISO')
            and   name  = 'ROL_PERMISO_FK2'
            and   indid > 0
            and   indid < 255)
   drop index ROL_PERMISO.ROL_PERMISO_FK2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ROL_PERMISO')
            and   name  = 'ROL_PERMISO_FK'
            and   indid > 0
            and   indid < 255)
   drop index ROL_PERMISO.ROL_PERMISO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ROL_PERMISO')
            and   type = 'U')
   drop table ROL_PERMISO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SERVICIO_FACTURABLE')
            and   type = 'U')
   drop table SERVICIO_FACTURABLE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SESION_USUARIO')
            and   name  = 'USUARIO_SESION_USUARIO_ID_USUARIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SESION_USUARIO.USUARIO_SESION_USUARIO_ID_USUARIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SESION_USUARIO')
            and   type = 'U')
   drop table SESION_USUARIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SIGNO_VITAL')
            and   name  = 'PROFESIONAL_SIGNO_VITAL_ID_PROFESIONAL_FK'
            and   indid > 0
            and   indid < 255)
   drop index SIGNO_VITAL.PROFESIONAL_SIGNO_VITAL_ID_PROFESIONAL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SIGNO_VITAL')
            and   name  = 'EPISODIO_ATENCION_SIGNO_VITAL_ID_EPISODIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SIGNO_VITAL.EPISODIO_ATENCION_SIGNO_VITAL_ID_EPISODIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SIGNO_VITAL')
            and   type = 'U')
   drop table SIGNO_VITAL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SOLICITUD_LABORATORIO')
            and   name  = 'PROFESIONAL_SOLICITUD_LABORATORIO_ID_PROFESIONAL_SOLICITANTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index SOLICITUD_LABORATORIO.PROFESIONAL_SOLICITUD_LABORATORIO_ID_PROFESIONAL_SOLICITANTE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SOLICITUD_LABORATORIO')
            and   name  = 'EPISODIO_ATENCION_SOLICITUD_LABORATORIO_ID_EPISODIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SOLICITUD_LABORATORIO.EPISODIO_ATENCION_SOLICITUD_LABORATORIO_ID_EPISODIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SOLICITUD_LABORATORIO')
            and   type = 'U')
   drop table SOLICITUD_LABORATORIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRIAJE_EMERGENCIA')
            and   name  = 'PROFESIONAL_TRIAJE_EMERGENCIA_ID_PROFESIONAL_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRIAJE_EMERGENCIA.PROFESIONAL_TRIAJE_EMERGENCIA_ID_PROFESIONAL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRIAJE_EMERGENCIA')
            and   name  = 'EPISODIO_ATENCION_TRIAJE_EMERGENCIA_ID_EPISODIO_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRIAJE_EMERGENCIA.EPISODIO_ATENCION_TRIAJE_EMERGENCIA_ID_EPISODIO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TRIAJE_EMERGENCIA')
            and   type = 'U')
   drop table TRIAJE_EMERGENCIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('USUARIO')
            and   name  = 'USUARIO_PROFESIONAL_ID_USUARIO2_FK'
            and   indid > 0
            and   indid < 255)
   drop index USUARIO.USUARIO_PROFESIONAL_ID_USUARIO2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('USUARIO')
            and   name  = 'USUARIO_PACIENTE_ID_USUARIO_REGISTRO_FK'
            and   indid > 0
            and   indid < 255)
   drop index USUARIO.USUARIO_PACIENTE_ID_USUARIO_REGISTRO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('USUARIO')
            and   type = 'U')
   drop table USUARIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('USUARIO_ROL')
            and   name  = 'USUARIO_ROL_FK2'
            and   indid > 0
            and   indid < 255)
   drop index USUARIO_ROL.USUARIO_ROL_FK2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('USUARIO_ROL')
            and   name  = 'USUARIO_ROL_FK'
            and   indid > 0
            and   indid < 255)
   drop index USUARIO_ROL.USUARIO_ROL_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('USUARIO_ROL')
            and   type = 'U')
   drop table USUARIO_ROL
go

/*==============================================================*/
/* Table: ADMISION                                              */
/*==============================================================*/
create table ADMISION (
   ADMISION_ID_ADMISION int                  not null,
   ASIGNACION_CAMA_ID_ASIGNACION int                  not null,
   ADMISION_FECHA_INGRESO datetime             not null,
   ADMISION_FECHA_ALTA  datetime             null,
   ADMISION_TIPO        char(40)             not null,
   ADMISION_ESTADO      char(30)             not null,
   constraint PK_ADMISION primary key nonclustered (ADMISION_ID_ADMISION)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('ADMISION') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'ADMISION' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'ADMISION'
go

/*==============================================================*/
/* Index: PACIENTE_ADMISION_ID_PACIENTE_FK                      */
/*==============================================================*/
create index PACIENTE_ADMISION_ID_PACIENTE_FK on ADMISION (
ADMISION_ID_ADMISION ASC
)
go

/*==============================================================*/
/* Index: EPISODIO_ATENCION_ADMISION_ID_EPISODIO_FK             */
/*==============================================================*/
create index EPISODIO_ATENCION_ADMISION_ID_EPISODIO_FK on ADMISION (
ADMISION_ID_ADMISION ASC
)
go

/*==============================================================*/
/* Table: AGENDA_MEDICA                                         */
/*==============================================================*/
create table AGENDA_MEDICA (
   AGENDA_MEDICA_ID_AGENDA int                  not null,
   CITA_ID_CITA         int                  not null,
   AGENDA_MEDICA_INICIO datetime             not null,
   AGENDA_MEDICA_FIN    datetime             not null,
   AGENDA_MEDICA_DURACION_MINUTOS int                  not null,
   AGENDA_MEDICA_ESTADO char(30)             not null,
   constraint PK_AGENDA_MEDICA primary key nonclustered (AGENDA_MEDICA_ID_AGENDA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('AGENDA_MEDICA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'AGENDA_MEDICA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'AGENDA_MEDICA'
go

/*==============================================================*/
/* Index: CONSULTORIO_AGENDA_MEDICA_ID_CONSULTORIO_FK           */
/*==============================================================*/
create index CONSULTORIO_AGENDA_MEDICA_ID_CONSULTORIO_FK on AGENDA_MEDICA (
AGENDA_MEDICA_ID_AGENDA ASC
)
go

/*==============================================================*/
/* Index: PROFESIONAL_AGENDA_MEDICA_ID_PROFESIONAL_FK           */
/*==============================================================*/
create index PROFESIONAL_AGENDA_MEDICA_ID_PROFESIONAL_FK on AGENDA_MEDICA (
AGENDA_MEDICA_ID_AGENDA ASC
)
go

/*==============================================================*/
/* Index: ESPECIALIDAD_AGENDA_MEDICA_ID_ESPECIALIDAD_FK         */
/*==============================================================*/
create index ESPECIALIDAD_AGENDA_MEDICA_ID_ESPECIALIDAD_FK on AGENDA_MEDICA (
AGENDA_MEDICA_ID_AGENDA ASC
)
go

/*==============================================================*/
/* Table: ALERGIA                                               */
/*==============================================================*/
create table ALERGIA (
   ALERGIA_ID_ALERGIA   int                  not null,
   ALERGIA_SUSTANCIA    char(120)            not null,
   ALERGIA_REACCION     char(200)            null,
   ALERGIA_SEVERIDAD    char(30)             null,
   ALERGIA_ESTADO_CONFIRMACION char(30)             not null,
   ALERGIA_FECHA_REGISTRO datetime             not null,
   constraint PK_ALERGIA primary key nonclustered (ALERGIA_ID_ALERGIA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('ALERGIA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'ALERGIA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'ALERGIA'
go

/*==============================================================*/
/* Index: PACIENTE_ALERGIA_ID_PACIENTE_FK                       */
/*==============================================================*/
create index PACIENTE_ALERGIA_ID_PACIENTE_FK on ALERGIA (
ALERGIA_ID_ALERGIA ASC
)
go

/*==============================================================*/
/* Table: ANTECEDENTE_CLINICO                                   */
/*==============================================================*/
create table ANTECEDENTE_CLINICO (
   ANTECEDENTE_CLINICO_ID_ANTECEDENTE int                  not null,
   ANTECEDENTE_CLINICO_TIPO char(50)             not null,
   ANTECEDENTE_CLINICO_DESCRIPCION char(254)            not null,
   ANTECEDENTE_CLINICO_FECHA_REGISTRO datetime             not null,
   constraint PK_ANTECEDENTE_CLINICO primary key nonclustered (ANTECEDENTE_CLINICO_ID_ANTECEDENTE)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('ANTECEDENTE_CLINICO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'ANTECEDENTE_CLINICO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'ANTECEDENTE_CLINICO'
go

/*==============================================================*/
/* Index: HISTORIA_CLINICA_ANTECEDENTE_CLINICO_ID_HISTORIA_FK   */
/*==============================================================*/
create index HISTORIA_CLINICA_ANTECEDENTE_CLINICO_ID_HISTORIA_FK on ANTECEDENTE_CLINICO (
ANTECEDENTE_CLINICO_ID_ANTECEDENTE ASC
)
go

/*==============================================================*/
/* Index: USUARIO_ANTECEDENTE_CLINICO_ID_USUARIO_AUTOR_FK       */
/*==============================================================*/
create index USUARIO_ANTECEDENTE_CLINICO_ID_USUARIO_AUTOR_FK on ANTECEDENTE_CLINICO (
ANTECEDENTE_CLINICO_ID_ANTECEDENTE ASC
)
go

/*==============================================================*/
/* Table: AREA_HOSPITALARIA                                     */
/*==============================================================*/
create table AREA_HOSPITALARIA (
   AREA_HOSPITALARIA_ID_AREA int                  not null,
   HABITACION_ID_HABITACION int                  not null,
   AREA_HOSPITALARIA_NOMBRE char(100)            not null,
   AREA_HOSPITALARIA_TIPO char(50)             not null,
   constraint PK_AREA_HOSPITALARIA primary key nonclustered (AREA_HOSPITALARIA_ID_AREA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('AREA_HOSPITALARIA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'AREA_HOSPITALARIA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'AREA_HOSPITALARIA'
go

/*==============================================================*/
/* Table: ASIGNACION_CAMA                                       */
/*==============================================================*/
create table ASIGNACION_CAMA (
   ASIGNACION_CAMA_ID_ASIGNACION int                  not null,
   ASIGNACION_CAMA_FECHA_INICIO datetime             not null,
   ASIGNACION_CAMA_FECHA_FIN datetime             null,
   ASIGNACION_CAMA_MOTIVO_SALIDA char(150)            null,
   constraint PK_ASIGNACION_CAMA primary key nonclustered (ASIGNACION_CAMA_ID_ASIGNACION)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('ASIGNACION_CAMA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'ASIGNACION_CAMA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'ASIGNACION_CAMA'
go

/*==============================================================*/
/* Index: ADMISION_ASIGNACION_CAMA_ID_ADMISION_FK               */
/*==============================================================*/
create index ADMISION_ASIGNACION_CAMA_ID_ADMISION_FK on ASIGNACION_CAMA (
ASIGNACION_CAMA_ID_ASIGNACION ASC
)
go

/*==============================================================*/
/* Index: CAMA_ASIGNACION_CAMA_ID_CAMA_FK                       */
/*==============================================================*/
create index CAMA_ASIGNACION_CAMA_ID_CAMA_FK on ASIGNACION_CAMA (
ASIGNACION_CAMA_ID_ASIGNACION ASC
)
go

/*==============================================================*/
/* Table: AUDITORIA                                             */
/*==============================================================*/
create table AUDITORIA (
   AUDITORIA_ID_AUDITORIA int                  not null,
   AUDITORIA_ACCION     char(100)            not null,
   AUDITORIA_ENTIDAD    char(100)            not null,
   AUDITORIA_IDENTIFICADOR_OBJETO char(100)            null,
   AUDITORIA_FECHA_EVENTO datetime             not null,
   AUDITORIA_DETALLE    char(254)            null,
   constraint PK_AUDITORIA primary key nonclustered (AUDITORIA_ID_AUDITORIA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('AUDITORIA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'AUDITORIA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Seguridad. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'AUDITORIA'
go

/*==============================================================*/
/* Index: USUARIO_AUDITORIA_ID_USUARIO_FK                       */
/*==============================================================*/
create index USUARIO_AUDITORIA_ID_USUARIO_FK on AUDITORIA (
AUDITORIA_ID_AUDITORIA ASC
)
go

/*==============================================================*/
/* Table: CAMA                                                  */
/*==============================================================*/
create table CAMA (
   CAMA_ID_CAMA         int                  not null,
   ASIGNACION_CAMA_ID_ASIGNACION int                  not null,
   CAMA_CODIGO          char(30)             not null,
   CAMA_ESTADO          char(30)             not null,
   constraint PK_CAMA primary key nonclustered (CAMA_ID_CAMA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('CAMA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'CAMA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'CAMA'
go

/*==============================================================*/
/* Index: HABITACION_CAMA_ID_HABITACION_FK                      */
/*==============================================================*/
create index HABITACION_CAMA_ID_HABITACION_FK on CAMA (
CAMA_ID_CAMA ASC
)
go

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO (
   CARGO_ID_CARGO       int                  not null,
   DETALLE_FACTURA_ID_DETALLE_FACTURA int                  not null,
   CARGO_TIPO_ORIGEN    char(40)             not null,
   CARGO_REFERENCIA_ORIGEN char(80)             not null,
   CARGO_CANTIDAD       numeric(10,2)        not null,
   CARGO_PRECIO_UNITARIO numeric(12,2)        not null,
   CARGO_IMPORTE        numeric(12,2)        not null,
   CARGO_FECHA_CARGO    datetime             not null,
   CARGO_ESTADO         char(30)             not null,
   constraint PK_CARGO primary key nonclustered (CARGO_ID_CARGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('CARGO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'CARGO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Finanzas. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'CARGO'
go

/*==============================================================*/
/* Index: SERVICIO_FACTURABLE_CARGO_ID_SERVICIO_FK              */
/*==============================================================*/
create index SERVICIO_FACTURABLE_CARGO_ID_SERVICIO_FK on CARGO (
CARGO_ID_CARGO ASC
)
go

/*==============================================================*/
/* Index: CARGO_DETALLE_FACTURA_ID_CARGO_FK                     */
/*==============================================================*/
create index CARGO_DETALLE_FACTURA_ID_CARGO_FK on CARGO (
CARGO_ID_CARGO ASC
)
go

/*==============================================================*/
/* Index: EPISODIO_ATENCION_CARGO_ID_EPISODIO_FK                */
/*==============================================================*/
create index EPISODIO_ATENCION_CARGO_ID_EPISODIO_FK on CARGO (
CARGO_ID_CARGO ASC
)
go

/*==============================================================*/
/* Table: CITA                                                  */
/*==============================================================*/
create table CITA (
   CITA_ID_CITA         int                  not null,
   HISTORIAL_CITA_ID_HISTORIAL int                  not null,
   EPISODIO_ATENCION_ID_EPISODIO int                  null,
   CITA_FECHA_HORA      datetime             not null,
   CITA_MOTIVO          char(250)            null,
   CITA_ESTADO          char(30)             not null,
   CITA_FECHA_REGISTRO  datetime             not null,
   constraint PK_CITA primary key nonclustered (CITA_ID_CITA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('CITA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'CITA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'CITA'
go

/*==============================================================*/
/* Index: PACIENTE_CITA_ID_PACIENTE_FK                          */
/*==============================================================*/
create index PACIENTE_CITA_ID_PACIENTE_FK on CITA (
CITA_ID_CITA ASC
)
go

/*==============================================================*/
/* Index: AGENDA_MEDICA_CITA_ID_AGENDA_FK                       */
/*==============================================================*/
create index AGENDA_MEDICA_CITA_ID_AGENDA_FK on CITA (
CITA_ID_CITA ASC
)
go

/*==============================================================*/
/* Index: USUARIO_CITA_ID_USUARIO_REGISTRO_FK                   */
/*==============================================================*/
create index USUARIO_CITA_ID_USUARIO_REGISTRO_FK on CITA (
CITA_ID_CITA ASC
)
go

/*==============================================================*/
/* Index: CITA_EPISODIO_ATENCION_ID_CITA_FK                     */
/*==============================================================*/
create index CITA_EPISODIO_ATENCION_ID_CITA_FK on CITA (
CITA_ID_CITA ASC
)
go

/*==============================================================*/
/* Table: CONSULTA_MEDICA                                       */
/*==============================================================*/
create table CONSULTA_MEDICA (
   CONSULTA_MEDICA_ID_CONSULTA int                  not null,
   CONSULTA_MEDICA_MOTIVO_CONSULTA char(254)            not null,
   CONSULTA_MEDICA_ENFERMEDAD_ACTUAL char(254)            null,
   CONSULTA_MEDICA_PLAN_TRATAMIENTO char(254)            null,
   CONSULTA_MEDICA_FECHA_CONSULTA datetime             not null,
   constraint PK_CONSULTA_MEDICA primary key nonclustered (CONSULTA_MEDICA_ID_CONSULTA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('CONSULTA_MEDICA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'CONSULTA_MEDICA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'CONSULTA_MEDICA'
go

/*==============================================================*/
/* Index: EPISODIO_ATENCION_CONSULTA_MEDICA_ID_EPISODIO_FK      */
/*==============================================================*/
create index EPISODIO_ATENCION_CONSULTA_MEDICA_ID_EPISODIO_FK on CONSULTA_MEDICA (
CONSULTA_MEDICA_ID_CONSULTA ASC
)
go

/*==============================================================*/
/* Index: PROFESIONAL_CONSULTA_MEDICA_ID_PROFESIONAL_FK         */
/*==============================================================*/
create index PROFESIONAL_CONSULTA_MEDICA_ID_PROFESIONAL_FK on CONSULTA_MEDICA (
CONSULTA_MEDICA_ID_CONSULTA ASC
)
go

/*==============================================================*/
/* Table: CONSULTORIO                                           */
/*==============================================================*/
create table CONSULTORIO (
   CONSULTORIO_ID_CONSULTORIO int                  not null,
   AGENDA_MEDICA_ID_AGENDA int                  not null,
   CONSULTORIO_CODIGO   char(30)             not null,
   CONSULTORIO_UBICACION char(120)            null,
   CONSULTORIO_ACTIVO   char(1)              not null,
   constraint PK_CONSULTORIO primary key nonclustered (CONSULTORIO_ID_CONSULTORIO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('CONSULTORIO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'CONSULTORIO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'CONSULTORIO'
go

/*==============================================================*/
/* Table: CONTACTO_EMERGENCIA                                   */
/*==============================================================*/
create table CONTACTO_EMERGENCIA (
   CONTACTO_EMERGENCIA_ID_CONTACTO int                  not null,
   CONTACTO_EMERGENCIA_NOMBRE_COMPLETO char(150)            not null,
   CONTACTO_EMERGENCIA_PARENTESCO char(50)             null,
   CONTACTO_EMERGENCIA_TELEFONO char(25)             not null,
   constraint PK_CONTACTO_EMERGENCIA primary key nonclustered (CONTACTO_EMERGENCIA_ID_CONTACTO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('CONTACTO_EMERGENCIA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'CONTACTO_EMERGENCIA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'CONTACTO_EMERGENCIA'
go

/*==============================================================*/
/* Index: PACIENTE_CONTACTO_EMERGENCIA_ID_PACIENTE_FK           */
/*==============================================================*/
create index PACIENTE_CONTACTO_EMERGENCIA_ID_PACIENTE_FK on CONTACTO_EMERGENCIA (
CONTACTO_EMERGENCIA_ID_CONTACTO ASC
)
go

/*==============================================================*/
/* Table: DETALLE_DISPENSACION                                  */
/*==============================================================*/
create table DETALLE_DISPENSACION (
   DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION int                  not null,
   MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO int                  null,
   DETALLE_DISPENSACION_CANTIDAD_ENTREGADA int                  not null,
   constraint PK_DETALLE_DISPENSACION primary key nonclustered (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('DETALLE_DISPENSACION') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'DETALLE_DISPENSACION' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'DETALLE_DISPENSACION'
go

/*==============================================================*/
/* Index: DISPENSACION_DETALLE_DISPENSACION_ID_DISPENSACION_FK  */
/*==============================================================*/
create index DISPENSACION_DETALLE_DISPENSACION_ID_DISPENSACION_FK on DETALLE_DISPENSACION (
DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION ASC
)
go

/*=============================================================================*/
/* Index: DETALLE_PRESCRIPCION_DETALLE_DISPENSACION_ID_DETALLE_PRESCRIPCION_FK */
/*=============================================================================*/
create index DETALLE_PRESCRIPCION_DETALLE_DISPENSACION_ID_DETALLE_PRESCRIPCION_FK on DETALLE_DISPENSACION (
DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION ASC
)
go

/*==============================================================*/
/* Index: LOTE_DETALLE_DISPENSACION_ID_LOTE_FK                  */
/*==============================================================*/
create index LOTE_DETALLE_DISPENSACION_ID_LOTE_FK on DETALLE_DISPENSACION (
DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION ASC
)
go

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA (
   DETALLE_FACTURA_ID_DETALLE_FACTURA int                  not null,
   CARGO_ID_CARGO       int                  null,
   DETALLE_FACTURA_IMPORTE_FACTURADO numeric(12,2)        not null,
   constraint PK_DETALLE_FACTURA primary key nonclustered (DETALLE_FACTURA_ID_DETALLE_FACTURA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('DETALLE_FACTURA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'DETALLE_FACTURA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Finanzas. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'DETALLE_FACTURA'
go

/*==============================================================*/
/* Index: FACTURA_DETALLE_FACTURA_ID_FACTURA_FK                 */
/*==============================================================*/
create index FACTURA_DETALLE_FACTURA_ID_FACTURA_FK on DETALLE_FACTURA (
DETALLE_FACTURA_ID_DETALLE_FACTURA ASC
)
go

/*==============================================================*/
/* Index: CARGO_DETALLE_FACTURA_ID_CARGO2_FK                    */
/*==============================================================*/
create index CARGO_DETALLE_FACTURA_ID_CARGO2_FK on DETALLE_FACTURA (
DETALLE_FACTURA_ID_DETALLE_FACTURA ASC
)
go

/*==============================================================*/
/* Table: DETALLE_PRESCRIPCION                                  */
/*==============================================================*/
create table DETALLE_PRESCRIPCION (
   DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION int                  not null,
   DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION int                  not null,
   DETALLE_PRESCRIPCION_DOSIS char(100)            not null,
   DETALLE_PRESCRIPCION_FRECUENCIA char(100)            not null,
   DETALLE_PRESCRIPCION_DURACION char(60)             null,
   DETALLE_PRESCRIPCION_CANTIDAD_PRESCRITA int                  not null,
   constraint PK_DETALLE_PRESCRIPCION primary key nonclustered (DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('DETALLE_PRESCRIPCION') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'DETALLE_PRESCRIPCION' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'DETALLE_PRESCRIPCION'
go

/*==============================================================*/
/* Index: PRESCRIPCION_DETALLE_PRESCRIPCION_ID_PRESCRIPCION_FK  */
/*==============================================================*/
create index PRESCRIPCION_DETALLE_PRESCRIPCION_ID_PRESCRIPCION_FK on DETALLE_PRESCRIPCION (
DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION ASC
)
go

/*==============================================================*/
/* Index: MEDICAMENTO_DETALLE_PRESCRIPCION_ID_MEDICAMENTO_FK    */
/*==============================================================*/
create index MEDICAMENTO_DETALLE_PRESCRIPCION_ID_MEDICAMENTO_FK on DETALLE_PRESCRIPCION (
DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION ASC
)
go

/*==============================================================*/
/* Table: DETALLE_SOLICITUD_LABORATORIO                         */
/*==============================================================*/
create table DETALLE_SOLICITUD_LABORATORIO (
   DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD int                  not null,
   RESULTADO_LABORATORIO_ID_RESULTADO int                  not null,
   DETALLE_SOLICITUD_LABORATORIO_CODIGO_MUESTRA char(80)             null,
   DETALLE_SOLICITUD_LABORATORIO_ESTADO char(30)             not null,
   constraint PK_DETALLE_SOLICITUD_LABORATOR primary key nonclustered (DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('DETALLE_SOLICITUD_LABORATORIO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'DETALLE_SOLICITUD_LABORATORIO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'DETALLE_SOLICITUD_LABORATORIO'
go

/*============================================================================*/
/* Index: SOLICITUD_LABORATORIO_DETALLE_SOLICITUD_LABORATORIO_ID_SOLICITUD_FK */
/*============================================================================*/
create index SOLICITUD_LABORATORIO_DETALLE_SOLICITUD_LABORATORIO_ID_SOLICITUD_FK on DETALLE_SOLICITUD_LABORATORIO (
DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD ASC
)
go

/*======================================================================*/
/* Index: PRUEBA_LABORATORIO_DETALLE_SOLICITUD_LABORATORIO_ID_PRUEBA_FK */
/*======================================================================*/
create index PRUEBA_LABORATORIO_DETALLE_SOLICITUD_LABORATORIO_ID_PRUEBA_FK on DETALLE_SOLICITUD_LABORATORIO (
DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD ASC
)
go

/*==============================================================*/
/* Table: DIAGNOSTICO                                           */
/*==============================================================*/
create table DIAGNOSTICO (
   DIAGNOSTICO_ID_DIAGNOSTICO int                  not null,
   DIAGNOSTICO_CODIGO_CIE char(15)             null,
   DIAGNOSTICO_DESCRIPCION char(250)            not null,
   DIAGNOSTICO_TIPO     char(30)             not null,
   DIAGNOSTICO_FECHA_REGISTRO datetime             not null,
   constraint PK_DIAGNOSTICO primary key nonclustered (DIAGNOSTICO_ID_DIAGNOSTICO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('DIAGNOSTICO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'DIAGNOSTICO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'DIAGNOSTICO'
go

/*==============================================================*/
/* Index: EPISODIO_ATENCION_DIAGNOSTICO_ID_EPISODIO_FK          */
/*==============================================================*/
create index EPISODIO_ATENCION_DIAGNOSTICO_ID_EPISODIO_FK on DIAGNOSTICO (
DIAGNOSTICO_ID_DIAGNOSTICO ASC
)
go

/*==============================================================*/
/* Index: PROFESIONAL_DIAGNOSTICO_ID_PROFESIONAL_FK             */
/*==============================================================*/
create index PROFESIONAL_DIAGNOSTICO_ID_PROFESIONAL_FK on DIAGNOSTICO (
DIAGNOSTICO_ID_DIAGNOSTICO ASC
)
go

/*==============================================================*/
/* Table: DISPENSACION                                          */
/*==============================================================*/
create table DISPENSACION (
   DISPENSACION_ID_DISPENSACION int                  not null,
   DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION int                  not null,
   DISPENSACION_FECHA_DISPENSACION datetime             not null,
   DISPENSACION_ESTADO  char(30)             not null,
   constraint PK_DISPENSACION primary key nonclustered (DISPENSACION_ID_DISPENSACION)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('DISPENSACION') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'DISPENSACION' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'DISPENSACION'
go

/*==============================================================*/
/* Index: PRESCRIPCION_DISPENSACION_ID_PRESCRIPCION_FK          */
/*==============================================================*/
create index PRESCRIPCION_DISPENSACION_ID_PRESCRIPCION_FK on DISPENSACION (
DISPENSACION_ID_DISPENSACION ASC
)
go

/*==============================================================*/
/* Index: USUARIO_DISPENSACION_ID_USUARIO_FARMACIA_FK           */
/*==============================================================*/
create index USUARIO_DISPENSACION_ID_USUARIO_FARMACIA_FK on DISPENSACION (
DISPENSACION_ID_DISPENSACION ASC
)
go

/*==============================================================*/
/* Table: EPISODIO_ATENCION                                     */
/*==============================================================*/
create table EPISODIO_ATENCION (
   EPISODIO_ATENCION_ID_EPISODIO int                  not null,
   CITA_ID_CITA         int                  null,
   CONSULTA_MEDICA_ID_CONSULTA int                  not null,
   SIGNO_VITAL_ID_SIGNO int                  not null,
   NOTA_CLINICA_ID_NOTA int                  not null,
   DIAGNOSTICO_ID_DIAGNOSTICO int                  not null,
   TRIAJE_EMERGENCIA_ID_TRIAJE int                  not null,
   SOLICITUD_LABORATORIO_ID_SOLICITUD int                  not null,
   ESTUDIO_IMAGEN_ID_ESTUDIO int                  not null,
   PRESCRIPCION_ID_PRESCRIPCION int                  not null,
   ADMISION_ID_ADMISION int                  not null,
   NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA int                  not null,
   PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO int                  not null,
   CARGO_ID_CARGO       int                  not null,
   EPISODIO_ATENCION_TIPO_ATENCION char(40)             not null,
   EPISODIO_ATENCION_FECHA_INICIO datetime             not null,
   EPISODIO_ATENCION_FECHA_FIN datetime             null,
   EPISODIO_ATENCION_ESTADO char(30)             not null,
   constraint PK_EPISODIO_ATENCION primary key nonclustered (EPISODIO_ATENCION_ID_EPISODIO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('EPISODIO_ATENCION') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'EPISODIO_ATENCION' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'EPISODIO_ATENCION'
go

/*==============================================================*/
/* Index: HISTORIA_CLINICA_EPISODIOS_FK                         */
/*==============================================================*/
create index HISTORIA_CLINICA_EPISODIOS_FK on EPISODIO_ATENCION (
EPISODIO_ATENCION_ID_EPISODIO ASC
)
go

/*==============================================================*/
/* Index: PACIENTE_EPISODIO_ATENCION_ID_PACIENTE_FK             */
/*==============================================================*/
create index PACIENTE_EPISODIO_ATENCION_ID_PACIENTE_FK on EPISODIO_ATENCION (
EPISODIO_ATENCION_ID_EPISODIO ASC
)
go

/*====================================================================*/
/* Index: PROFESIONAL_EPISODIO_ATENCION_ID_PROFESIONAL_RESPONSABLE_FK */
/*====================================================================*/
create index PROFESIONAL_EPISODIO_ATENCION_ID_PROFESIONAL_RESPONSABLE_FK on EPISODIO_ATENCION (
EPISODIO_ATENCION_ID_EPISODIO ASC
)
go

/*==============================================================*/
/* Index: CITA_EPISODIO_ATENCION_ID_CITA2_FK                    */
/*==============================================================*/
create index CITA_EPISODIO_ATENCION_ID_CITA2_FK on EPISODIO_ATENCION (
EPISODIO_ATENCION_ID_EPISODIO ASC
)
go

/*==============================================================*/
/* Table: ESPECIALIDAD                                          */
/*==============================================================*/
create table ESPECIALIDAD (
   ESPECIALIDAD_ID_ESPECIALIDAD int                  not null,
   AGENDA_MEDICA_ID_AGENDA int                  not null,
   ESPECIALIDAD_NOMBRE  char(100)            not null,
   ESPECIALIDAD_DESCRIPCION char(200)            null,
   constraint PK_ESPECIALIDAD primary key nonclustered (ESPECIALIDAD_ID_ESPECIALIDAD)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('ESPECIALIDAD') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'ESPECIALIDAD' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Personal. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'ESPECIALIDAD'
go

/*==============================================================*/
/* Table: ESTUDIO_IMAGEN                                        */
/*==============================================================*/
create table ESTUDIO_IMAGEN (
   ESTUDIO_IMAGEN_ID_ESTUDIO int                  not null,
   INFORME_IMAGEN_ID_INFORME_IMAGEN int                  not null,
   ESTUDIO_IMAGEN_TIPO_ESTUDIO char(100)            not null,
   ESTUDIO_IMAGEN_FECHA_SOLICITUD datetime             not null,
   ESTUDIO_IMAGEN_FECHA_REALIZACION datetime             null,
   ESTUDIO_IMAGEN_ESTADO char(30)             not null,
   ESTUDIO_IMAGEN_REFERENCIA_ARCHIVO char(250)            null,
   constraint PK_ESTUDIO_IMAGEN primary key nonclustered (ESTUDIO_IMAGEN_ID_ESTUDIO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('ESTUDIO_IMAGEN') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'ESTUDIO_IMAGEN' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'ESTUDIO_IMAGEN'
go

/*==============================================================*/
/* Index: EPISODIO_ATENCION_ESTUDIO_IMAGEN_ID_EPISODIO_FK       */
/*==============================================================*/
create index EPISODIO_ATENCION_ESTUDIO_IMAGEN_ID_EPISODIO_FK on ESTUDIO_IMAGEN (
ESTUDIO_IMAGEN_ID_ESTUDIO ASC
)
go

/*=================================================================*/
/* Index: PROFESIONAL_ESTUDIO_IMAGEN_ID_PROFESIONAL_SOLICITANTE_FK */
/*=================================================================*/
create index PROFESIONAL_ESTUDIO_IMAGEN_ID_PROFESIONAL_SOLICITANTE_FK on ESTUDIO_IMAGEN (
ESTUDIO_IMAGEN_ID_ESTUDIO ASC
)
go

/*==============================================================*/
/* Index: ESTUDIO_IMAGEN_INFORME_IMAGEN_ID_ESTUDIO_FK           */
/*==============================================================*/
create index ESTUDIO_IMAGEN_INFORME_IMAGEN_ID_ESTUDIO_FK on ESTUDIO_IMAGEN (
ESTUDIO_IMAGEN_ID_ESTUDIO ASC
)
go

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   FACTURA_ID_FACTURA   int                  not null,
   FAC_FACTURA_ID_FACTURA int                  null,
   DETALLE_FACTURA_ID_DETALLE_FACTURA int                  not null,
   PAGO_ID_PAGO         int                  not null,
   FACTURA_NUMERO_COMPROBANTE char(60)             not null,
   FACTURA_FECHA_EMISION datetime             not null,
   FACTURA_SUBTOTAL     numeric(12,2)        not null,
   FACTURA_IVA          numeric(12,2)        not null,
   FACTURA_TOTAL        numeric(12,2)        not null,
   FACTURA_ESTADO       char(30)             not null,
   FACTURA_MOTIVO_ANULACION char(250)            null,
   constraint PK_FACTURA primary key nonclustered (FACTURA_ID_FACTURA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('FACTURA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'FACTURA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Finanzas. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'FACTURA'
go

/*==============================================================*/
/* Index: PACIENTE_FACTURA_ID_PACIENTE_FK                       */
/*==============================================================*/
create index PACIENTE_FACTURA_ID_PACIENTE_FK on FACTURA (
FACTURA_ID_FACTURA ASC
)
go

/*==============================================================*/
/* Index: FACTURA_FACTURA_ID_FACTURA_ORIGINAL_FK                */
/*==============================================================*/
create index FACTURA_FACTURA_ID_FACTURA_ORIGINAL_FK on FACTURA (
FAC_FACTURA_ID_FACTURA ASC
)
go

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION (
   HABITACION_ID_HABITACION int                  not null,
   CAMA_ID_CAMA         int                  not null,
   HABITACION_CODIGO    char(30)             not null,
   HABITACION_PISO      char(20)             null,
   constraint PK_HABITACION primary key nonclustered (HABITACION_ID_HABITACION)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('HABITACION') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'HABITACION' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'HABITACION'
go

/*==============================================================*/
/* Index: AREA_HOSPITALARIA_HABITACION_ID_AREA_FK               */
/*==============================================================*/
create index AREA_HOSPITALARIA_HABITACION_ID_AREA_FK on HABITACION (
HABITACION_ID_HABITACION ASC
)
go

/*==============================================================*/
/* Table: HISTORIAL_CITA                                        */
/*==============================================================*/
create table HISTORIAL_CITA (
   HISTORIAL_CITA_ID_HISTORIAL int                  not null,
   HISTORIAL_CITA_FECHA_CAMBIO datetime             not null,
   HISTORIAL_CITA_ESTADO_ANTERIOR char(30)             null,
   HISTORIAL_CITA_ESTADO_NUEVO char(30)             not null,
   HISTORIAL_CITA_FECHA_HORA_ANTERIOR datetime             null,
   HISTORIAL_CITA_FECHA_HORA_NUEVA datetime             null,
   HISTORIAL_CITA_MOTIVO char(250)            null,
   constraint PK_HISTORIAL_CITA primary key nonclustered (HISTORIAL_CITA_ID_HISTORIAL)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('HISTORIAL_CITA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'HISTORIAL_CITA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'HISTORIAL_CITA'
go

/*==============================================================*/
/* Index: CITA_HISTORIAL_CITA_ID_CITA_FK                        */
/*==============================================================*/
create index CITA_HISTORIAL_CITA_ID_CITA_FK on HISTORIAL_CITA (
HISTORIAL_CITA_ID_HISTORIAL ASC
)
go

/*==============================================================*/
/* Index: USUARIO_HISTORIAL_CITA_ID_USUARIO_FK                  */
/*==============================================================*/
create index USUARIO_HISTORIAL_CITA_ID_USUARIO_FK on HISTORIAL_CITA (
HISTORIAL_CITA_ID_HISTORIAL ASC
)
go

/*==============================================================*/
/* Table: HISTORIA_CLINICA                                      */
/*==============================================================*/
create table HISTORIA_CLINICA (
   HISTORIA_CLINICA_ID_HISTORIA int                  not null,
   PACIENTE_ID_PACIENTE int                  null,
   ANTECEDENTE_CLINICO_ID_ANTECEDENTE int                  not null,
   EPISODIO_ATENCION_ID_EPISODIO int                  not null,
   HISTORIA_CLINICA_FECHA_APERTURA datetime             not null,
   HISTORIA_CLINICA_ESTADO char(30)             not null,
   constraint PK_HISTORIA_CLINICA primary key nonclustered (HISTORIA_CLINICA_ID_HISTORIA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('HISTORIA_CLINICA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'HISTORIA_CLINICA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'HISTORIA_CLINICA'
go

/*==============================================================*/
/* Index: PACIENTE_HISTORIA_CLINICA_ID_PACIENTE2_FK             */
/*==============================================================*/
create index PACIENTE_HISTORIA_CLINICA_ID_PACIENTE2_FK on HISTORIA_CLINICA (
HISTORIA_CLINICA_ID_HISTORIA ASC
)
go

/*==============================================================*/
/* Table: INFORME_IMAGEN                                        */
/*==============================================================*/
create table INFORME_IMAGEN (
   INFORME_IMAGEN_ID_INFORME_IMAGEN int                  not null,
   ESTUDIO_IMAGEN_ID_ESTUDIO int                  null,
   INFORME_IMAGEN_INFORME char(254)            not null,
   INFORME_IMAGEN_FECHA_EMISION datetime             not null,
   INFORME_IMAGEN_ESTADO char(30)             not null,
   constraint PK_INFORME_IMAGEN primary key nonclustered (INFORME_IMAGEN_ID_INFORME_IMAGEN)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('INFORME_IMAGEN') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'INFORME_IMAGEN' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'INFORME_IMAGEN'
go

/*==============================================================*/
/* Index: ESTUDIO_IMAGEN_INFORME_IMAGEN_ID_ESTUDIO2_FK          */
/*==============================================================*/
create index ESTUDIO_IMAGEN_INFORME_IMAGEN_ID_ESTUDIO2_FK on INFORME_IMAGEN (
INFORME_IMAGEN_ID_INFORME_IMAGEN ASC
)
go

/*================================================================*/
/* Index: PROFESIONAL_INFORME_IMAGEN_ID_PROFESIONAL_INFORMANTE_FK */
/*================================================================*/
create index PROFESIONAL_INFORME_IMAGEN_ID_PROFESIONAL_INFORMANTE_FK on INFORME_IMAGEN (
INFORME_IMAGEN_ID_INFORME_IMAGEN ASC
)
go

/*==============================================================*/
/* Table: LOTE                                                  */
/*==============================================================*/
create table LOTE (
   LOTE_ID_LOTE         int                  not null,
   DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION int                  not null,
   MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO int                  not null,
   LOTE_NUMERO_LOTE     char(60)             not null,
   LOTE_FECHA_CADUCIDAD datetime             not null,
   LOTE_EXISTENCIA_ACTUAL int                  not null,
   LOTE_ESTADO          char(30)             not null,
   constraint PK_LOTE primary key nonclustered (LOTE_ID_LOTE)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('LOTE') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'LOTE' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'LOTE'
go

/*==============================================================*/
/* Index: MEDICAMENTO_LOTE_ID_MEDICAMENTO_FK                    */
/*==============================================================*/
create index MEDICAMENTO_LOTE_ID_MEDICAMENTO_FK on LOTE (
LOTE_ID_LOTE ASC
)
go

/*==============================================================*/
/* Table: MEDICAMENTO                                           */
/*==============================================================*/
create table MEDICAMENTO (
   MEDICAMENTO_ID_MEDICAMENTO int                  not null,
   DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION int                  not null,
   LOTE_ID_LOTE         int                  not null,
   MEDICAMENTO_CODIGO   char(40)             not null,
   MEDICAMENTO_NOMBRE_GENERICO char(150)            not null,
   MEDICAMENTO_PRESENTACION char(100)            not null,
   MEDICAMENTO_CONCENTRACION char(60)             null,
   MEDICAMENTO_STOCK_MINIMO int                  not null,
   MEDICAMENTO_ACTIVO   char(1)              not null,
   constraint PK_MEDICAMENTO primary key nonclustered (MEDICAMENTO_ID_MEDICAMENTO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('MEDICAMENTO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'MEDICAMENTO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'MEDICAMENTO'
go

/*==============================================================*/
/* Table: MOVIMIENTO_INVENTARIO                                 */
/*==============================================================*/
create table MOVIMIENTO_INVENTARIO (
   MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO int                  not null,
   MOVIMIENTO_INVENTARIO_TIPO_MOVIMIENTO char(30)             not null,
   MOVIMIENTO_INVENTARIO_CANTIDAD int                  not null,
   MOVIMIENTO_INVENTARIO_FECHA_MOVIMIENTO datetime             not null,
   MOVIMIENTO_INVENTARIO_MOTIVO char(250)            null,
   constraint PK_MOVIMIENTO_INVENTARIO primary key nonclustered (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('MOVIMIENTO_INVENTARIO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'MOVIMIENTO_INVENTARIO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'MOVIMIENTO_INVENTARIO'
go

/*==============================================================*/
/* Index: LOTE_MOVIMIENTO_INVENTARIO_ID_LOTE_FK                 */
/*==============================================================*/
create index LOTE_MOVIMIENTO_INVENTARIO_ID_LOTE_FK on MOVIMIENTO_INVENTARIO (
MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO ASC
)
go

/*==============================================================*/
/* Index: USUARIO_MOVIMIENTO_INVENTARIO_ID_USUARIO_FK           */
/*==============================================================*/
create index USUARIO_MOVIMIENTO_INVENTARIO_ID_USUARIO_FK on MOVIMIENTO_INVENTARIO (
MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO ASC
)
go

/*==============================================================================*/
/* Index: DETALLE_DISPENSACION_MOVIMIENTO_INVENTARIO_ID_DETALLE_DISPENSACION_FK */
/*==============================================================================*/
create index DETALLE_DISPENSACION_MOVIMIENTO_INVENTARIO_ID_DETALLE_DISPENSACION_FK on MOVIMIENTO_INVENTARIO (
MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO ASC
)
go

/*==============================================================*/
/* Table: NOTA_CLINICA                                          */
/*==============================================================*/
create table NOTA_CLINICA (
   NOTA_CLINICA_ID_NOTA int                  not null,
   NOT_NOTA_CLINICA_ID_NOTA int                  null,
   NOTA_CLINICA_TIPO    char(40)             not null,
   NOTA_CLINICA_CONTENIDO char(254)            not null,
   NOTA_CLINICA_ESTADO  char(30)             not null,
   NOTA_CLINICA_FECHA_CREACION datetime             not null,
   NOTA_CLINICA_FECHA_FIRMA datetime             null,
   constraint PK_NOTA_CLINICA primary key nonclustered (NOTA_CLINICA_ID_NOTA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('NOTA_CLINICA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'NOTA_CLINICA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'NOTA_CLINICA'
go

/*==============================================================*/
/* Index: EPISODIO_ATENCION_NOTA_CLINICA_ID_EPISODIO_FK         */
/*==============================================================*/
create index EPISODIO_ATENCION_NOTA_CLINICA_ID_EPISODIO_FK on NOTA_CLINICA (
NOTA_CLINICA_ID_NOTA ASC
)
go

/*==============================================================*/
/* Index: NOTA_CLINICA_NOTA_CLINICA_ID_NOTA_ORIGINAL_FK         */
/*==============================================================*/
create index NOTA_CLINICA_NOTA_CLINICA_ID_NOTA_ORIGINAL_FK on NOTA_CLINICA (
NOT_NOTA_CLINICA_ID_NOTA ASC
)
go

/*==============================================================*/
/* Index: USUARIO_NOTA_CLINICA_ID_USUARIO_AUTOR_FK              */
/*==============================================================*/
create index USUARIO_NOTA_CLINICA_ID_USUARIO_AUTOR_FK on NOTA_CLINICA (
NOTA_CLINICA_ID_NOTA ASC
)
go

/*==============================================================*/
/* Table: NOTA_ENFERMERIA                                       */
/*==============================================================*/
create table NOTA_ENFERMERIA (
   NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA int                  not null,
   NOTA_ENFERMERIA_FECHA_REGISTRO datetime             not null,
   NOTA_ENFERMERIA_OBSERVACIONES char(254)            not null,
   NOTA_ENFERMERIA_CUIDADOS_REALIZADOS char(254)            null,
   constraint PK_NOTA_ENFERMERIA primary key nonclustered (NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('NOTA_ENFERMERIA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'NOTA_ENFERMERIA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'NOTA_ENFERMERIA'
go

/*==============================================================*/
/* Index: EPISODIO_ATENCION_NOTA_ENFERMERIA_ID_EPISODIO_FK      */
/*==============================================================*/
create index EPISODIO_ATENCION_NOTA_ENFERMERIA_ID_EPISODIO_FK on NOTA_ENFERMERIA (
NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA ASC
)
go

/*==============================================================*/
/* Index: PROFESIONAL_NOTA_ENFERMERIA_ID_PROFESIONAL_FK         */
/*==============================================================*/
create index PROFESIONAL_NOTA_ENFERMERIA_ID_PROFESIONAL_FK on NOTA_ENFERMERIA (
NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA ASC
)
go

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE (
   PACIENTE_ID_PACIENTE int                  not null,
   CONTACTO_EMERGENCIA_ID_CONTACTO int                  not null,
   HISTORIA_CLINICA_ID_HISTORIA int                  not null,
   ALERGIA_ID_ALERGIA   int                  not null,
   CITA_ID_CITA         int                  not null,
   EPISODIO_ATENCION_ID_EPISODIO int                  not null,
   ADMISION_ID_ADMISION int                  not null,
   FACTURA_ID_FACTURA   int                  not null,
   PACIENTE_IDENTIFICADOR_HOSPITALARIO char(30)             not null,
   PACIENTE_TIPO_DOCUMENTO char(25)             null,
   PACIENTE_NUMERO_DOCUMENTO char(30)             null,
   PACIENTE_NOMBRES     char(100)            not null,
   PACIENTE_APELLIDOS   char(100)            not null,
   PACIENTE_FECHA_NACIMIENTO datetime             null,
   PACIENTE_TELEFONO    char(25)             null,
   PACIENTE_CORREO_ELECTRONICO char(120)            null,
   PACIENTE_DIRECCION   char(250)            null,
   PACIENTE_ESTADO_REGISTRO char(20)             not null,
   PACIENTE_FECHA_REGISTRO datetime             not null,
   PACIENTE_FECHA_ACTUALIZACION datetime             null,
   constraint PK_PACIENTE primary key nonclustered (PACIENTE_ID_PACIENTE)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PACIENTE') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PACIENTE' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'PACIENTE'
go

/*==============================================================*/
/* Index: PACIENTE_HISTORIA_CLINICA_ID_PACIENTE_FK              */
/*==============================================================*/
create index PACIENTE_HISTORIA_CLINICA_ID_PACIENTE_FK on PACIENTE (
PACIENTE_ID_PACIENTE ASC
)
go

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   PAGO_ID_PAGO         int                  not null,
   PAGO_FECHA_PAGO      datetime             not null,
   PAGO_MONTO           numeric(12,2)        not null,
   PAGO_METODO_PAGO     char(40)             not null,
   PAGO_REFERENCIA      char(100)            null,
   PAGO_ESTADO          char(30)             not null,
   constraint PK_PAGO primary key nonclustered (PAGO_ID_PAGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PAGO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PAGO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Finanzas. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'PAGO'
go

/*==============================================================*/
/* Index: FACTURA_PAGO_ID_FACTURA_FK                            */
/*==============================================================*/
create index FACTURA_PAGO_ID_FACTURA_FK on PAGO (
PAGO_ID_PAGO ASC
)
go

/*==============================================================*/
/* Index: USUARIO_PAGO_ID_USUARIO_REGISTRO_FK                   */
/*==============================================================*/
create index USUARIO_PAGO_ID_USUARIO_REGISTRO_FK on PAGO (
PAGO_ID_PAGO ASC
)
go

/*==============================================================*/
/* Table: PARTICIPACION_QUIRURGICA                              */
/*==============================================================*/
create table PARTICIPACION_QUIRURGICA (
   PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO char(80)             not null,
   constraint PK_PARTICIPACION_QUIRURGICA primary key nonclustered (PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PARTICIPACION_QUIRURGICA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PARTICIPACION_QUIRURGICA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'PARTICIPACION_QUIRURGICA'
go

/*==============================================================================*/
/* Index: PROCEDIMIENTO_QUIRURGICO_PARTICIPACION_QUIRURGICA_ID_PROCEDIMIENTO_FK */
/*==============================================================================*/
create index PROCEDIMIENTO_QUIRURGICO_PARTICIPACION_QUIRURGICA_ID_PROCEDIMIENTO_FK on PARTICIPACION_QUIRURGICA (
PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO ASC
)
go

/*===============================================================*/
/* Index: PROFESIONAL_PARTICIPACION_QUIRURGICA_ID_PROFESIONAL_FK */
/*===============================================================*/
create index PROFESIONAL_PARTICIPACION_QUIRURGICA_ID_PROFESIONAL_FK on PARTICIPACION_QUIRURGICA (
PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO ASC
)
go

/*==============================================================*/
/* Table: PERMISO                                               */
/*==============================================================*/
create table PERMISO (
   PERMISO_ID_PERMISO   int                  not null,
   PERMISO_CODIGO       char(100)            not null,
   PERMISO_DESCRIPCION  char(200)            null,
   constraint PK_PERMISO primary key nonclustered (PERMISO_ID_PERMISO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PERMISO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PERMISO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Seguridad. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'PERMISO'
go

/*==============================================================*/
/* Table: PRESCRIPCION                                          */
/*==============================================================*/
create table PRESCRIPCION (
   PRESCRIPCION_ID_PRESCRIPCION int                  not null,
   DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION int                  not null,
   DISPENSACION_ID_DISPENSACION int                  not null,
   PRESCRIPCION_FECHA_EMISION datetime             not null,
   PRESCRIPCION_ESTADO  char(30)             not null,
   PRESCRIPCION_INDICACIONES char(254)            null,
   constraint PK_PRESCRIPCION primary key nonclustered (PRESCRIPCION_ID_PRESCRIPCION)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PRESCRIPCION') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PRESCRIPCION' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'PRESCRIPCION'
go

/*==============================================================*/
/* Index: EPISODIO_ATENCION_PRESCRIPCION_ID_EPISODIO_FK         */
/*==============================================================*/
create index EPISODIO_ATENCION_PRESCRIPCION_ID_EPISODIO_FK on PRESCRIPCION (
PRESCRIPCION_ID_PRESCRIPCION ASC
)
go

/*==============================================================*/
/* Index: PROFESIONAL_PRESCRIPCION_ID_PROFESIONAL_FK            */
/*==============================================================*/
create index PROFESIONAL_PRESCRIPCION_ID_PROFESIONAL_FK on PRESCRIPCION (
PRESCRIPCION_ID_PRESCRIPCION ASC
)
go

/*==============================================================*/
/* Table: PROCEDIMIENTO_QUIRURGICO                              */
/*==============================================================*/
create table PROCEDIMIENTO_QUIRURGICO (
   PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO int                  not null,
   PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO char(80)             not null,
   PROCEDIMIENTO_QUIRURGICO_NOMBRE_PROCEDIMIENTO char(200)            not null,
   PROCEDIMIENTO_QUIRURGICO_FECHA_PROGRAMADA datetime             not null,
   PROCEDIMIENTO_QUIRURGICO_FECHA_REALIZACION datetime             null,
   PROCEDIMIENTO_QUIRURGICO_QUIROFANO char(50)             null,
   PROCEDIMIENTO_QUIRURGICO_ESTADO char(30)             not null,
   PROCEDIMIENTO_QUIRURGICO_OBSERVACIONES char(254)            null,
   constraint PK_PROCEDIMIENTO_QUIRURGICO primary key nonclustered (PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PROCEDIMIENTO_QUIRURGICO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PROCEDIMIENTO_QUIRURGICO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'PROCEDIMIENTO_QUIRURGICO'
go

/*==================================================================*/
/* Index: EPISODIO_ATENCION_PROCEDIMIENTO_QUIRURGICO_ID_EPISODIO_FK */
/*==================================================================*/
create index EPISODIO_ATENCION_PROCEDIMIENTO_QUIRURGICO_ID_EPISODIO_FK on PROCEDIMIENTO_QUIRURGICO (
PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO ASC
)
go

/*===========================================================================*/
/* Index: PROFESIONAL_PROCEDIMIENTO_QUIRURGICO_ID_PROFESIONAL_RESPONSABLE_FK */
/*===========================================================================*/
create index PROFESIONAL_PROCEDIMIENTO_QUIRURGICO_ID_PROFESIONAL_RESPONSABLE_FK on PROCEDIMIENTO_QUIRURGICO (
PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO ASC
)
go

/*==============================================================*/
/* Table: PROFESIONAL                                           */
/*==============================================================*/
create table PROFESIONAL (
   PROFESIONAL_ID_PROFESIONAL int                  not null,
   USUARIO_ID_USUARIO   int                  null,
   AGENDA_MEDICA_ID_AGENDA int                  not null,
   EPISODIO_ATENCION_ID_EPISODIO int                  null,
   CONSULTA_MEDICA_ID_CONSULTA int                  not null,
   SIGNO_VITAL_ID_SIGNO int                  not null,
   DIAGNOSTICO_ID_DIAGNOSTICO int                  not null,
   TRIAJE_EMERGENCIA_ID_TRIAJE int                  not null,
   SOLICITUD_LABORATORIO_ID_SOLICITUD int                  not null,
   RESULTADO_LABORATORIO_ID_RESULTADO int                  null,
   ESTUDIO_IMAGEN_ID_ESTUDIO int                  not null,
   INFORME_IMAGEN_ID_INFORME_IMAGEN int                  not null,
   PRESCRIPCION_ID_PRESCRIPCION int                  not null,
   NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA int                  not null,
   PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO int                  not null,
   PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO char(80)             not null,
   PROFESIONAL_NUMERO_REGISTRO char(60)             not null,
   PROFESIONAL_NOMBRES  char(100)            not null,
   PROFESIONAL_APELLIDOS char(100)            not null,
   PROFESIONAL_TIPO_PROFESIONAL char(40)             not null,
   PROFESIONAL_ACTIVO   char(1)              not null,
   constraint PK_PROFESIONAL primary key nonclustered (PROFESIONAL_ID_PROFESIONAL)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PROFESIONAL') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PROFESIONAL' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Personal. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'PROFESIONAL'
go

/*==============================================================*/
/* Index: USUARIO_PROFESIONAL_ID_USUARIO_FK                     */
/*==============================================================*/
create index USUARIO_PROFESIONAL_ID_USUARIO_FK on PROFESIONAL (
USUARIO_ID_USUARIO ASC
)
go

/*==============================================================*/
/* Table: PROFESIONAL_ESPECIALIDAD                              */
/*==============================================================*/
create table PROFESIONAL_ESPECIALIDAD (
   PROFESIONAL_ID_PROFESIONAL int                  not null,
   ESPECIALIDAD_ID_ESPECIALIDAD int                  not null,
   constraint PK_PROFESIONAL_ESPECIALIDAD primary key nonclustered (PROFESIONAL_ID_PROFESIONAL, ESPECIALIDAD_ID_ESPECIALIDAD)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PROFESIONAL_ESPECIALIDAD') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PROFESIONAL_ESPECIALIDAD' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Profesional sanitario ejerce especialidad Especialidad. Cardinalidades: 0..n y 0..n.', 
   'user', @CurrentUser, 'table', 'PROFESIONAL_ESPECIALIDAD'
go

/*==============================================================*/
/* Index: PROFESIONAL_ESPECIALIDAD_FK                           */
/*==============================================================*/
create index PROFESIONAL_ESPECIALIDAD_FK on PROFESIONAL_ESPECIALIDAD (
ESPECIALIDAD_ID_ESPECIALIDAD ASC
)
go

/*==============================================================*/
/* Index: PROFESIONAL_ESPECIALIDAD_FK2                          */
/*==============================================================*/
create index PROFESIONAL_ESPECIALIDAD_FK2 on PROFESIONAL_ESPECIALIDAD (
PROFESIONAL_ID_PROFESIONAL ASC
)
go

/*==============================================================*/
/* Table: PRUEBA_LABORATORIO                                    */
/*==============================================================*/
create table PRUEBA_LABORATORIO (
   PRUEBA_LABORATORIO_ID_PRUEBA int                  not null,
   DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD int                  not null,
   PRUEBA_LABORATORIO_CODIGO char(30)             not null,
   PRUEBA_LABORATORIO_NOMBRE char(120)            not null,
   PRUEBA_LABORATORIO_UNIDAD_MEDIDA char(30)             null,
   PRUEBA_LABORATORIO_ACTIVA char(1)              not null,
   constraint PK_PRUEBA_LABORATORIO primary key nonclustered (PRUEBA_LABORATORIO_ID_PRUEBA)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PRUEBA_LABORATORIO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PRUEBA_LABORATORIO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'PRUEBA_LABORATORIO'
go

/*==============================================================*/
/* Table: RESULTADO_LABORATORIO                                 */
/*==============================================================*/
create table RESULTADO_LABORATORIO (
   RESULTADO_LABORATORIO_ID_RESULTADO int                  not null,
   RESULTADO_LABORATORIO_VALOR_RESULTADO char(200)            not null,
   RESULTADO_LABORATORIO_UNIDAD_MEDIDA char(30)             null,
   RESULTADO_LABORATORIO_ESTADO_VALIDACION char(30)             not null,
   RESULTADO_LABORATORIO_FECHA_RESULTADO datetime             not null,
   RESULTADO_LABORATORIO_FECHA_VALIDACION datetime             null,
   constraint PK_RESULTADO_LABORATORIO primary key nonclustered (RESULTADO_LABORATORIO_ID_RESULTADO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('RESULTADO_LABORATORIO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'RESULTADO_LABORATORIO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'RESULTADO_LABORATORIO'
go

/*====================================================================================*/
/* Index: DETALLE_SOLICITUD_LABORATORIO_RESULTADO_LABORATORIO_ID_DETALLE_SOLICITUD_FK */
/*====================================================================================*/
create index DETALLE_SOLICITUD_LABORATORIO_RESULTADO_LABORATORIO_ID_DETALLE_SOLICITUD_FK on RESULTADO_LABORATORIO (
RESULTADO_LABORATORIO_ID_RESULTADO ASC
)
go

/*======================================================================*/
/* Index: PROFESIONAL_RESULTADO_LABORATORIO_ID_PROFESIONAL_VALIDADOR_FK */
/*======================================================================*/
create index PROFESIONAL_RESULTADO_LABORATORIO_ID_PROFESIONAL_VALIDADOR_FK on RESULTADO_LABORATORIO (
RESULTADO_LABORATORIO_ID_RESULTADO ASC
)
go

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL (
   ROL_ID_ROL           int                  not null,
   ROL_NOMBRE           char(70)             not null,
   ROL_DESCRIPCION      char(200)            null,
   constraint PK_ROL primary key nonclustered (ROL_ID_ROL)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('ROL') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'ROL' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Seguridad. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'ROL'
go

/*==============================================================*/
/* Table: ROL_PERMISO                                           */
/*==============================================================*/
create table ROL_PERMISO (
   ROL_ID_ROL           int                  not null,
   PERMISO_ID_PERMISO   int                  not null,
   constraint PK_ROL_PERMISO primary key nonclustered (ROL_ID_ROL, PERMISO_ID_PERMISO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('ROL_PERMISO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'ROL_PERMISO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Rol otorga permisos Permiso. Cardinalidades: 0..n y 0..n.', 
   'user', @CurrentUser, 'table', 'ROL_PERMISO'
go

/*==============================================================*/
/* Index: ROL_PERMISO_FK                                        */
/*==============================================================*/
create index ROL_PERMISO_FK on ROL_PERMISO (
PERMISO_ID_PERMISO ASC
)
go

/*==============================================================*/
/* Index: ROL_PERMISO_FK2                                       */
/*==============================================================*/
create index ROL_PERMISO_FK2 on ROL_PERMISO (
ROL_ID_ROL ASC
)
go

/*==============================================================*/
/* Table: SERVICIO_FACTURABLE                                   */
/*==============================================================*/
create table SERVICIO_FACTURABLE (
   SERVICIO_FACTURABLE_ID_SERVICIO int                  not null,
   CARGO_ID_CARGO       int                  not null,
   SERVICIO_FACTURABLE_CODIGO char(40)             not null,
   SERVICIO_FACTURABLE_DESCRIPCION char(200)            not null,
   SERVICIO_FACTURABLE_TARIFA_ACTUAL numeric(12,2)        not null,
   SERVICIO_FACTURABLE_PORCENTAJE_IVA numeric(10,2)        not null,
   SERVICIO_FACTURABLE_ACTIVO char(1)              not null,
   constraint PK_SERVICIO_FACTURABLE primary key nonclustered (SERVICIO_FACTURABLE_ID_SERVICIO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('SERVICIO_FACTURABLE') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'SERVICIO_FACTURABLE' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Finanzas. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'SERVICIO_FACTURABLE'
go

/*==============================================================*/
/* Table: SESION_USUARIO                                        */
/*==============================================================*/
create table SESION_USUARIO (
   SESION_USUARIO_ID_SESION int                  not null,
   SESION_USUARIO_INICIO datetime             not null,
   SESION_USUARIO_FIN   datetime             null,
   SESION_USUARIO_ESTADO char(20)             not null,
   constraint PK_SESION_USUARIO primary key nonclustered (SESION_USUARIO_ID_SESION)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('SESION_USUARIO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'SESION_USUARIO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Seguridad. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'SESION_USUARIO'
go

/*==============================================================*/
/* Index: USUARIO_SESION_USUARIO_ID_USUARIO_FK                  */
/*==============================================================*/
create index USUARIO_SESION_USUARIO_ID_USUARIO_FK on SESION_USUARIO (
SESION_USUARIO_ID_SESION ASC
)
go

/*==============================================================*/
/* Table: SIGNO_VITAL                                           */
/*==============================================================*/
create table SIGNO_VITAL (
   SIGNO_VITAL_ID_SIGNO int                  not null,
   SIGNO_VITAL_FECHA_MEDICION datetime             not null,
   SIGNO_VITAL_TEMPERATURA_C numeric(10,2)        null,
   SIGNO_VITAL_FRECUENCIA_CARDIACA int                  null,
   SIGNO_VITAL_PRESION_SISTOLICA int                  null,
   SIGNO_VITAL_PRESION_DIASTOLICA int                  null,
   SIGNO_VITAL_SATURACION_OXIGENO numeric(10,2)        null,
   constraint PK_SIGNO_VITAL primary key nonclustered (SIGNO_VITAL_ID_SIGNO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('SIGNO_VITAL') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'SIGNO_VITAL' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'SIGNO_VITAL'
go

/*==============================================================*/
/* Index: EPISODIO_ATENCION_SIGNO_VITAL_ID_EPISODIO_FK          */
/*==============================================================*/
create index EPISODIO_ATENCION_SIGNO_VITAL_ID_EPISODIO_FK on SIGNO_VITAL (
SIGNO_VITAL_ID_SIGNO ASC
)
go

/*==============================================================*/
/* Index: PROFESIONAL_SIGNO_VITAL_ID_PROFESIONAL_FK             */
/*==============================================================*/
create index PROFESIONAL_SIGNO_VITAL_ID_PROFESIONAL_FK on SIGNO_VITAL (
SIGNO_VITAL_ID_SIGNO ASC
)
go

/*==============================================================*/
/* Table: SOLICITUD_LABORATORIO                                 */
/*==============================================================*/
create table SOLICITUD_LABORATORIO (
   SOLICITUD_LABORATORIO_ID_SOLICITUD int                  not null,
   DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD int                  not null,
   SOLICITUD_LABORATORIO_FECHA_SOLICITUD datetime             not null,
   SOLICITUD_LABORATORIO_ESTADO char(30)             not null,
   SOLICITUD_LABORATORIO_PRIORIDAD char(30)             not null,
   constraint PK_SOLICITUD_LABORATORIO primary key nonclustered (SOLICITUD_LABORATORIO_ID_SOLICITUD)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('SOLICITUD_LABORATORIO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'SOLICITUD_LABORATORIO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'SOLICITUD_LABORATORIO'
go

/*===============================================================*/
/* Index: EPISODIO_ATENCION_SOLICITUD_LABORATORIO_ID_EPISODIO_FK */
/*===============================================================*/
create index EPISODIO_ATENCION_SOLICITUD_LABORATORIO_ID_EPISODIO_FK on SOLICITUD_LABORATORIO (
SOLICITUD_LABORATORIO_ID_SOLICITUD ASC
)
go

/*========================================================================*/
/* Index: PROFESIONAL_SOLICITUD_LABORATORIO_ID_PROFESIONAL_SOLICITANTE_FK */
/*========================================================================*/
create index PROFESIONAL_SOLICITUD_LABORATORIO_ID_PROFESIONAL_SOLICITANTE_FK on SOLICITUD_LABORATORIO (
SOLICITUD_LABORATORIO_ID_SOLICITUD ASC
)
go

/*==============================================================*/
/* Table: TRIAJE_EMERGENCIA                                     */
/*==============================================================*/
create table TRIAJE_EMERGENCIA (
   TRIAJE_EMERGENCIA_ID_TRIAJE int                  not null,
   TRIAJE_EMERGENCIA_NIVEL_PRIORIDAD char(30)             not null,
   TRIAJE_EMERGENCIA_OBSERVACIONES char(254)            null,
   TRIAJE_EMERGENCIA_FECHA_TRIAJE datetime             not null,
   TRIAJE_EMERGENCIA_DISPOSICION char(40)             null,
   constraint PK_TRIAJE_EMERGENCIA primary key nonclustered (TRIAJE_EMERGENCIA_ID_TRIAJE)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('TRIAJE_EMERGENCIA') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'TRIAJE_EMERGENCIA' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Gestión Hospitalaria. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'TRIAJE_EMERGENCIA'
go

/*==============================================================*/
/* Index: EPISODIO_ATENCION_TRIAJE_EMERGENCIA_ID_EPISODIO_FK    */
/*==============================================================*/
create index EPISODIO_ATENCION_TRIAJE_EMERGENCIA_ID_EPISODIO_FK on TRIAJE_EMERGENCIA (
TRIAJE_EMERGENCIA_ID_TRIAJE ASC
)
go

/*==============================================================*/
/* Index: PROFESIONAL_TRIAJE_EMERGENCIA_ID_PROFESIONAL_FK       */
/*==============================================================*/
create index PROFESIONAL_TRIAJE_EMERGENCIA_ID_PROFESIONAL_FK on TRIAJE_EMERGENCIA (
TRIAJE_EMERGENCIA_ID_TRIAJE ASC
)
go

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   USUARIO_ID_USUARIO   int                  not null,
   SESION_USUARIO_ID_SESION int                  not null,
   PROFESIONAL_ID_PROFESIONAL int                  not null,
   AUDITORIA_ID_AUDITORIA int                  null,
   PACIENTE_ID_PACIENTE int                  not null,
   ANTECEDENTE_CLINICO_ID_ANTECEDENTE int                  not null,
   CITA_ID_CITA         int                  not null,
   HISTORIAL_CITA_ID_HISTORIAL int                  not null,
   NOTA_CLINICA_ID_NOTA int                  not null,
   DISPENSACION_ID_DISPENSACION int                  not null,
   MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO int                  not null,
   PAGO_ID_PAGO         int                  not null,
   USUARIO_NOMBRE_USUARIO char(60)             not null,
   USUARIO_HASH_CONTRASENA char(254)            not null,
   USUARIO_CORREO       char(120)            null,
   USUARIO_ACTIVO       char(1)              not null,
   USUARIO_FECHA_CREACION datetime             not null,
   constraint PK_USUARIO primary key nonclustered (USUARIO_ID_USUARIO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('USUARIO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'USUARIO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Área funcional: Seguridad. Modelo conceptual basado en ERS SIGH GR06 y enunciado.', 
   'user', @CurrentUser, 'table', 'USUARIO'
go

/*==============================================================*/
/* Index: USUARIO_PACIENTE_ID_USUARIO_REGISTRO_FK               */
/*==============================================================*/
create index USUARIO_PACIENTE_ID_USUARIO_REGISTRO_FK on USUARIO (
PACIENTE_ID_PACIENTE ASC
)
go

/*==============================================================*/
/* Index: USUARIO_PROFESIONAL_ID_USUARIO2_FK                    */
/*==============================================================*/
create index USUARIO_PROFESIONAL_ID_USUARIO2_FK on USUARIO (
PROFESIONAL_ID_PROFESIONAL ASC
)
go

/*==============================================================*/
/* Table: USUARIO_ROL                                           */
/*==============================================================*/
create table USUARIO_ROL (
   USUARIO_ID_USUARIO   int                  not null,
   ROL_ID_ROL           int                  not null,
   constraint PK_USUARIO_ROL primary key nonclustered (USUARIO_ID_USUARIO, ROL_ID_ROL)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('USUARIO_ROL') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'USUARIO_ROL' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Usuario tiene roles Rol. Cardinalidades: 0..n y 0..n.', 
   'user', @CurrentUser, 'table', 'USUARIO_ROL'
go

/*==============================================================*/
/* Index: USUARIO_ROL_FK                                        */
/*==============================================================*/
create index USUARIO_ROL_FK on USUARIO_ROL (
ROL_ID_ROL ASC
)
go

/*==============================================================*/
/* Index: USUARIO_ROL_FK2                                       */
/*==============================================================*/
create index USUARIO_ROL_FK2 on USUARIO_ROL (
USUARIO_ID_USUARIO ASC
)
go

alter table ADMISION
   add constraint FK_ADMISION_EPISODIO__EPISODIO foreign key (ADMISION_ID_ADMISION)
      references EPISODIO_ATENCION (ADMISION_ID_ADMISION)
go

alter table ADMISION
   add constraint FK_ADMISION_PACIENTE__PACIENTE foreign key (ADMISION_ID_ADMISION)
      references PACIENTE (ADMISION_ID_ADMISION)
go

alter table AGENDA_MEDICA
   add constraint FK_AGENDA_M_CONSULTOR_CONSULTO foreign key (AGENDA_MEDICA_ID_AGENDA)
      references CONSULTORIO (AGENDA_MEDICA_ID_AGENDA)
go

alter table AGENDA_MEDICA
   add constraint FK_AGENDA_M_ESPECIALI_ESPECIAL foreign key (AGENDA_MEDICA_ID_AGENDA)
      references ESPECIALIDAD (AGENDA_MEDICA_ID_AGENDA)
go

alter table AGENDA_MEDICA
   add constraint FK_AGENDA_M_PROFESION_PROFESIO foreign key (AGENDA_MEDICA_ID_AGENDA)
      references PROFESIONAL (AGENDA_MEDICA_ID_AGENDA)
go

alter table ALERGIA
   add constraint FK_ALERGIA_PACIENTE__PACIENTE foreign key (ALERGIA_ID_ALERGIA)
      references PACIENTE (ALERGIA_ID_ALERGIA)
go

alter table ANTECEDENTE_CLINICO
   add constraint FK_ANTECEDE_HISTORIA__HISTORIA foreign key (ANTECEDENTE_CLINICO_ID_ANTECEDENTE)
      references HISTORIA_CLINICA (ANTECEDENTE_CLINICO_ID_ANTECEDENTE)
go

alter table ANTECEDENTE_CLINICO
   add constraint FK_ANTECEDE_USUARIO_A_USUARIO foreign key (ANTECEDENTE_CLINICO_ID_ANTECEDENTE)
      references USUARIO (ANTECEDENTE_CLINICO_ID_ANTECEDENTE)
go

alter table ASIGNACION_CAMA
   add constraint FK_ASIGNACI_ADMISION__ADMISION foreign key (ASIGNACION_CAMA_ID_ASIGNACION)
      references ADMISION (ASIGNACION_CAMA_ID_ASIGNACION)
go

alter table ASIGNACION_CAMA
   add constraint FK_ASIGNACI_CAMA_ASIG_CAMA foreign key (ASIGNACION_CAMA_ID_ASIGNACION)
      references CAMA (ASIGNACION_CAMA_ID_ASIGNACION)
go

alter table AUDITORIA
   add constraint FK_AUDITORI_USUARIO_A_USUARIO foreign key (AUDITORIA_ID_AUDITORIA)
      references USUARIO (AUDITORIA_ID_AUDITORIA)
go

alter table CAMA
   add constraint FK_CAMA_HABITACIO_HABITACI foreign key (CAMA_ID_CAMA)
      references HABITACION (CAMA_ID_CAMA)
go

alter table CARGO
   add constraint FK_CARGO_CARGO_DET_DETALLE_ foreign key (CARGO_ID_CARGO)
      references DETALLE_FACTURA (CARGO_ID_CARGO)
go

alter table CARGO
   add constraint FK_CARGO_EPISODIO__EPISODIO foreign key (CARGO_ID_CARGO)
      references EPISODIO_ATENCION (CARGO_ID_CARGO)
go

alter table CARGO
   add constraint FK_CARGO_SERVICIO__SERVICIO foreign key (CARGO_ID_CARGO)
      references SERVICIO_FACTURABLE (CARGO_ID_CARGO)
go

alter table CITA
   add constraint FK_CITA_AGENDA_ME_AGENDA_M foreign key (CITA_ID_CITA)
      references AGENDA_MEDICA (CITA_ID_CITA)
go

alter table CITA
   add constraint FK_CITA_CITA_EPIS_EPISODIO foreign key (CITA_ID_CITA)
      references EPISODIO_ATENCION (CITA_ID_CITA)
go

alter table CITA
   add constraint FK_CITA_PACIENTE__PACIENTE foreign key (CITA_ID_CITA)
      references PACIENTE (CITA_ID_CITA)
go

alter table CITA
   add constraint FK_CITA_USUARIO_C_USUARIO foreign key (CITA_ID_CITA)
      references USUARIO (CITA_ID_CITA)
go

alter table CONSULTA_MEDICA
   add constraint FK_CONSULTA_EPISODIO__EPISODIO foreign key (CONSULTA_MEDICA_ID_CONSULTA)
      references EPISODIO_ATENCION (CONSULTA_MEDICA_ID_CONSULTA)
go

alter table CONSULTA_MEDICA
   add constraint FK_CONSULTA_PROFESION_PROFESIO foreign key (CONSULTA_MEDICA_ID_CONSULTA)
      references PROFESIONAL (CONSULTA_MEDICA_ID_CONSULTA)
go

alter table CONTACTO_EMERGENCIA
   add constraint FK_CONTACTO_PACIENTE__PACIENTE foreign key (CONTACTO_EMERGENCIA_ID_CONTACTO)
      references PACIENTE (CONTACTO_EMERGENCIA_ID_CONTACTO)
go

alter table DETALLE_DISPENSACION
   add constraint FK_DETALLE__DETALLE_P_DETALLE_ foreign key (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION)
      references DETALLE_PRESCRIPCION (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION)
go

alter table DETALLE_DISPENSACION
   add constraint FK_DETALLE__DISPENSAC_DISPENSA foreign key (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION)
      references DISPENSACION (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION)
go

alter table DETALLE_DISPENSACION
   add constraint FK_DETALLE__LOTE_DETA_LOTE foreign key (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION)
      references LOTE (DETALLE_DISPENSACION_ID_DETALLE_DISPENSACION)
go

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__CARGO_DET_CARGO foreign key (DETALLE_FACTURA_ID_DETALLE_FACTURA)
      references CARGO (DETALLE_FACTURA_ID_DETALLE_FACTURA)
go

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__FACTURA_D_FACTURA foreign key (DETALLE_FACTURA_ID_DETALLE_FACTURA)
      references FACTURA (DETALLE_FACTURA_ID_DETALLE_FACTURA)
go

alter table DETALLE_PRESCRIPCION
   add constraint FK_DETALLE__MEDICAMEN_MEDICAME foreign key (DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION)
      references MEDICAMENTO (DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION)
go

alter table DETALLE_PRESCRIPCION
   add constraint FK_DETALLE__PRESCRIPC_PRESCRIP foreign key (DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION)
      references PRESCRIPCION (DETALLE_PRESCRIPCION_ID_DETALLE_PRESCRIPCION)
go

alter table DETALLE_SOLICITUD_LABORATORIO
   add constraint FK_DETALLE__PRUEBA_LA_PRUEBA_L foreign key (DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD)
      references PRUEBA_LABORATORIO (DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD)
go

alter table DETALLE_SOLICITUD_LABORATORIO
   add constraint FK_DETALLE__SOLICITUD_SOLICITU foreign key (DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD)
      references SOLICITUD_LABORATORIO (DETALLE_SOLICITUD_LABORATORIO_ID_DETALLE_SOLICITUD)
go

alter table DIAGNOSTICO
   add constraint FK_DIAGNOST_EPISODIO__EPISODIO foreign key (DIAGNOSTICO_ID_DIAGNOSTICO)
      references EPISODIO_ATENCION (DIAGNOSTICO_ID_DIAGNOSTICO)
go

alter table DIAGNOSTICO
   add constraint FK_DIAGNOST_PROFESION_PROFESIO foreign key (DIAGNOSTICO_ID_DIAGNOSTICO)
      references PROFESIONAL (DIAGNOSTICO_ID_DIAGNOSTICO)
go

alter table DISPENSACION
   add constraint FK_DISPENSA_PRESCRIPC_PRESCRIP foreign key (DISPENSACION_ID_DISPENSACION)
      references PRESCRIPCION (DISPENSACION_ID_DISPENSACION)
go

alter table DISPENSACION
   add constraint FK_DISPENSA_USUARIO_D_USUARIO foreign key (DISPENSACION_ID_DISPENSACION)
      references USUARIO (DISPENSACION_ID_DISPENSACION)
go

alter table EPISODIO_ATENCION
   add constraint FK_EPISODIO_CITA_EPIS_CITA foreign key (EPISODIO_ATENCION_ID_EPISODIO)
      references CITA (EPISODIO_ATENCION_ID_EPISODIO)
go

alter table EPISODIO_ATENCION
   add constraint FK_EPISODIO_HISTORIA__HISTORIA foreign key (EPISODIO_ATENCION_ID_EPISODIO)
      references HISTORIA_CLINICA (EPISODIO_ATENCION_ID_EPISODIO)
go

alter table EPISODIO_ATENCION
   add constraint FK_EPISODIO_PACIENTE__PACIENTE foreign key (EPISODIO_ATENCION_ID_EPISODIO)
      references PACIENTE (EPISODIO_ATENCION_ID_EPISODIO)
go

alter table EPISODIO_ATENCION
   add constraint FK_EPISODIO_PROFESION_PROFESIO foreign key (EPISODIO_ATENCION_ID_EPISODIO)
      references PROFESIONAL (EPISODIO_ATENCION_ID_EPISODIO)
go

alter table ESTUDIO_IMAGEN
   add constraint FK_ESTUDIO__EPISODIO__EPISODIO foreign key (ESTUDIO_IMAGEN_ID_ESTUDIO)
      references EPISODIO_ATENCION (ESTUDIO_IMAGEN_ID_ESTUDIO)
go

alter table ESTUDIO_IMAGEN
   add constraint FK_ESTUDIO__ESTUDIO_I_INFORME_ foreign key (ESTUDIO_IMAGEN_ID_ESTUDIO)
      references INFORME_IMAGEN (ESTUDIO_IMAGEN_ID_ESTUDIO)
go

alter table ESTUDIO_IMAGEN
   add constraint FK_ESTUDIO__PROFESION_PROFESIO foreign key (ESTUDIO_IMAGEN_ID_ESTUDIO)
      references PROFESIONAL (ESTUDIO_IMAGEN_ID_ESTUDIO)
go

alter table FACTURA
   add constraint FK_FACTURA_FACTURA_F_FACTURA foreign key (FAC_FACTURA_ID_FACTURA)
      references FACTURA (FACTURA_ID_FACTURA)
go

alter table FACTURA
   add constraint FK_FACTURA_PACIENTE__PACIENTE foreign key (FACTURA_ID_FACTURA)
      references PACIENTE (FACTURA_ID_FACTURA)
go

alter table HABITACION
   add constraint FK_HABITACI_AREA_HOSP_AREA_HOS foreign key (HABITACION_ID_HABITACION)
      references AREA_HOSPITALARIA (HABITACION_ID_HABITACION)
go

alter table HISTORIAL_CITA
   add constraint FK_HISTORIA_CITA_HIST_CITA foreign key (HISTORIAL_CITA_ID_HISTORIAL)
      references CITA (HISTORIAL_CITA_ID_HISTORIAL)
go

alter table HISTORIAL_CITA
   add constraint FK_HISTORIA_USUARIO_H_USUARIO foreign key (HISTORIAL_CITA_ID_HISTORIAL)
      references USUARIO (HISTORIAL_CITA_ID_HISTORIAL)
go

alter table HISTORIA_CLINICA
   add constraint FK_HISTORIA_PACIENTE__PACIENTE foreign key (HISTORIA_CLINICA_ID_HISTORIA)
      references PACIENTE (HISTORIA_CLINICA_ID_HISTORIA)
go

alter table INFORME_IMAGEN
   add constraint FK_INFORME__ESTUDIO_I_ESTUDIO_ foreign key (INFORME_IMAGEN_ID_INFORME_IMAGEN)
      references ESTUDIO_IMAGEN (INFORME_IMAGEN_ID_INFORME_IMAGEN)
go

alter table INFORME_IMAGEN
   add constraint FK_INFORME__PROFESION_PROFESIO foreign key (INFORME_IMAGEN_ID_INFORME_IMAGEN)
      references PROFESIONAL (INFORME_IMAGEN_ID_INFORME_IMAGEN)
go

alter table LOTE
   add constraint FK_LOTE_MEDICAMEN_MEDICAME foreign key (LOTE_ID_LOTE)
      references MEDICAMENTO (LOTE_ID_LOTE)
go

alter table MOVIMIENTO_INVENTARIO
   add constraint FK_MOVIMIEN_DETALLE_D_DETALLE_ foreign key (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO)
      references DETALLE_DISPENSACION (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO)
go

alter table MOVIMIENTO_INVENTARIO
   add constraint FK_MOVIMIEN_LOTE_MOVI_LOTE foreign key (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO)
      references LOTE (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO)
go

alter table MOVIMIENTO_INVENTARIO
   add constraint FK_MOVIMIEN_USUARIO_M_USUARIO foreign key (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO)
      references USUARIO (MOVIMIENTO_INVENTARIO_ID_MOVIMIENTO)
go

alter table NOTA_CLINICA
   add constraint FK_NOTA_CLI_EPISODIO__EPISODIO foreign key (NOTA_CLINICA_ID_NOTA)
      references EPISODIO_ATENCION (NOTA_CLINICA_ID_NOTA)
go

alter table NOTA_CLINICA
   add constraint FK_NOTA_CLI_NOTA_CLIN_NOTA_CLI foreign key (NOT_NOTA_CLINICA_ID_NOTA)
      references NOTA_CLINICA (NOTA_CLINICA_ID_NOTA)
go

alter table NOTA_CLINICA
   add constraint FK_NOTA_CLI_USUARIO_N_USUARIO foreign key (NOTA_CLINICA_ID_NOTA)
      references USUARIO (NOTA_CLINICA_ID_NOTA)
go

alter table NOTA_ENFERMERIA
   add constraint FK_NOTA_ENF_EPISODIO__EPISODIO foreign key (NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA)
      references EPISODIO_ATENCION (NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA)
go

alter table NOTA_ENFERMERIA
   add constraint FK_NOTA_ENF_PROFESION_PROFESIO foreign key (NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA)
      references PROFESIONAL (NOTA_ENFERMERIA_ID_NOTA_ENFERMERIA)
go

alter table PACIENTE
   add constraint FK_PACIENTE_PACIENTE__HISTORIA foreign key (PACIENTE_ID_PACIENTE)
      references HISTORIA_CLINICA (PACIENTE_ID_PACIENTE)
go

alter table PAGO
   add constraint FK_PAGO_FACTURA_P_FACTURA foreign key (PAGO_ID_PAGO)
      references FACTURA (PAGO_ID_PAGO)
go

alter table PAGO
   add constraint FK_PAGO_USUARIO_P_USUARIO foreign key (PAGO_ID_PAGO)
      references USUARIO (PAGO_ID_PAGO)
go

alter table PARTICIPACION_QUIRURGICA
   add constraint FK_PARTICIP_PROCEDIMI_PROCEDIM foreign key (PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO)
      references PROCEDIMIENTO_QUIRURGICO (PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO)
go

alter table PARTICIPACION_QUIRURGICA
   add constraint FK_PARTICIP_PROFESION_PROFESIO foreign key (PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO)
      references PROFESIONAL (PARTICIPACION_QUIRURGICA_FUNCION_EQUIPO)
go

alter table PRESCRIPCION
   add constraint FK_PRESCRIP_EPISODIO__EPISODIO foreign key (PRESCRIPCION_ID_PRESCRIPCION)
      references EPISODIO_ATENCION (PRESCRIPCION_ID_PRESCRIPCION)
go

alter table PRESCRIPCION
   add constraint FK_PRESCRIP_PROFESION_PROFESIO foreign key (PRESCRIPCION_ID_PRESCRIPCION)
      references PROFESIONAL (PRESCRIPCION_ID_PRESCRIPCION)
go

alter table PROCEDIMIENTO_QUIRURGICO
   add constraint FK_PROCEDIM_EPISODIO__EPISODIO foreign key (PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO)
      references EPISODIO_ATENCION (PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO)
go

alter table PROCEDIMIENTO_QUIRURGICO
   add constraint FK_PROCEDIM_PROFESION_PROFESIO foreign key (PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO)
      references PROFESIONAL (PROCEDIMIENTO_QUIRURGICO_ID_PROCEDIMIENTO)
go

alter table PROFESIONAL
   add constraint FK_PROFESIO_USUARIO_P_USUARIO foreign key (USUARIO_ID_USUARIO)
      references USUARIO (USUARIO_ID_USUARIO)
go

alter table PROFESIONAL_ESPECIALIDAD
   add constraint FK_PROFESIO_PROFESION_ESPECIAL foreign key (PROFESIONAL_ID_PROFESIONAL)
      references ESPECIALIDAD (PROFESIONAL_ID_PROFESIONAL)
go

alter table PROFESIONAL_ESPECIALIDAD
   add constraint FK_PROFESIO_PROFESION_PROFESIO foreign key (ESPECIALIDAD_ID_ESPECIALIDAD)
      references PROFESIONAL (ESPECIALIDAD_ID_ESPECIALIDAD)
go

alter table RESULTADO_LABORATORIO
   add constraint FK_RESULTAD_DETALLE_S_DETALLE_ foreign key (RESULTADO_LABORATORIO_ID_RESULTADO)
      references DETALLE_SOLICITUD_LABORATORIO (RESULTADO_LABORATORIO_ID_RESULTADO)
go

alter table RESULTADO_LABORATORIO
   add constraint FK_RESULTAD_PROFESION_PROFESIO foreign key (RESULTADO_LABORATORIO_ID_RESULTADO)
      references PROFESIONAL (RESULTADO_LABORATORIO_ID_RESULTADO)
go

alter table ROL_PERMISO
   add constraint FK_ROL_PERM_ROL_PERMI_PERMISO foreign key (ROL_ID_ROL)
      references PERMISO (ROL_ID_ROL)
go

alter table ROL_PERMISO
   add constraint FK_ROL_PERM_ROL_PERMI_ROL foreign key (PERMISO_ID_PERMISO)
      references ROL (PERMISO_ID_PERMISO)
go

alter table SESION_USUARIO
   add constraint FK_SESION_U_USUARIO_S_USUARIO foreign key (SESION_USUARIO_ID_SESION)
      references USUARIO (SESION_USUARIO_ID_SESION)
go

alter table SIGNO_VITAL
   add constraint FK_SIGNO_VI_EPISODIO__EPISODIO foreign key (SIGNO_VITAL_ID_SIGNO)
      references EPISODIO_ATENCION (SIGNO_VITAL_ID_SIGNO)
go

alter table SIGNO_VITAL
   add constraint FK_SIGNO_VI_PROFESION_PROFESIO foreign key (SIGNO_VITAL_ID_SIGNO)
      references PROFESIONAL (SIGNO_VITAL_ID_SIGNO)
go

alter table SOLICITUD_LABORATORIO
   add constraint FK_SOLICITU_EPISODIO__EPISODIO foreign key (SOLICITUD_LABORATORIO_ID_SOLICITUD)
      references EPISODIO_ATENCION (SOLICITUD_LABORATORIO_ID_SOLICITUD)
go

alter table SOLICITUD_LABORATORIO
   add constraint FK_SOLICITU_PROFESION_PROFESIO foreign key (SOLICITUD_LABORATORIO_ID_SOLICITUD)
      references PROFESIONAL (SOLICITUD_LABORATORIO_ID_SOLICITUD)
go

alter table TRIAJE_EMERGENCIA
   add constraint FK_TRIAJE_E_EPISODIO__EPISODIO foreign key (TRIAJE_EMERGENCIA_ID_TRIAJE)
      references EPISODIO_ATENCION (TRIAJE_EMERGENCIA_ID_TRIAJE)
go

alter table TRIAJE_EMERGENCIA
   add constraint FK_TRIAJE_E_PROFESION_PROFESIO foreign key (TRIAJE_EMERGENCIA_ID_TRIAJE)
      references PROFESIONAL (TRIAJE_EMERGENCIA_ID_TRIAJE)
go

alter table USUARIO
   add constraint FK_USUARIO_USUARIO_P_PACIENTE foreign key (PACIENTE_ID_PACIENTE)
      references PACIENTE (PACIENTE_ID_PACIENTE)
go

alter table USUARIO
   add constraint FK_USUARIO_USUARIO_P_PROFESIO foreign key (PROFESIONAL_ID_PROFESIONAL)
      references PROFESIONAL (PROFESIONAL_ID_PROFESIONAL)
go

alter table USUARIO_ROL
   add constraint FK_USUARIO__USUARIO_R_ROL foreign key (USUARIO_ID_USUARIO)
      references ROL (USUARIO_ID_USUARIO)
go

alter table USUARIO_ROL
   add constraint FK_USUARIO__USUARIO_R_USUARIO foreign key (ROL_ID_ROL)
      references USUARIO (ROL_ID_ROL)
go

