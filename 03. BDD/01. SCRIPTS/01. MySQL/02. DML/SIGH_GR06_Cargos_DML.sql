-- ===============================================================
-- SIGH - Hospital General Monster Salud | NRC 36879 - Grupo 06
-- Script DML inicial para Departamentos y Cargos (MySQL / MariaDB)
-- ===============================================================

USE SIGH_GR06;

INSERT IGNORE INTO PEDEP_DEPAR (PEDEP_CODIGO, PEDEP_DESCRI) VALUES
 ('D01', 'EMERGENCIAS'),
 ('D02', 'LABORATORIO CLINICO'),
 ('D03', 'FARMACIA HOSPITALARIA');

INSERT IGNORE INTO PECAR_CARGO (PEDEP_CODIGO, PECAR_CODIGO, PECAR_DESCRI) VALUES
 ('D01', 'C01', 'MEDICO DE URGENCIAS'),
 ('D01', 'C02', 'ENFERMERO DE TRIAJE'),
 ('D02', 'C01', 'BIOQUIMICO CLINICO'),
 ('D03', 'C01', 'FARMACEUTICO HOSPITALARIO');
