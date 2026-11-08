-- =============================================================================
-- Club Deportivo Rio Negro - Poblacion PostgreSQL - TP 5A (Grupo 4)
-- Se ejecuta en nodo1 despues de 01_ddl_tp5a.sql (esquema public).
--
-- Cambios respecto de la poblacion original:
--   * Se quito SET search_path TO esq_grupo4.
--   * planilla_asistencia ahora lleva sede y revisiones. Las 6 planillas se
--     reparten entre las dos sedes: 1, 3 y 5 en Centro; 2, 4 y 6 en Norte.
--   * Se agrego el reinicio de contadores para planilla_asistencia (ya estaba).
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Personas
-- -----------------------------------------------------------------------------
-- Dos casos deliberados que muestran como quedo la especializacion.
--   Martin Sosa (DNI 30000001) es profesor Y socio a la vez -> solapada.
--   Carla Ponce (DNI 30000009) no es ni socio ni profesor, solo tutora -> parcial.

INSERT INTO persona (tipo_dni, nro_dni, nombre, apellido, telefono, fecha_nacimiento, mail) VALUES
    ('DNI',       '30000001', 'Martin',  'Sosa',      '299-4001001', '1990-03-15', 'msosa@clubrn.com'),
    ('DNI',       '30000002', 'Laura',   'Fernandez', '299-4001002', '1988-07-22', 'lfernandez@clubrn.com'),
    ('LC',        '30000003', 'Diego',   'Molina',    '299-4001003', '1985-11-30', 'dmolina@clubrn.com'),
    ('DNI',       '30000004', 'Ana',     'Ferreyra',  '299-4001004', '1992-05-10', 'nferreyra@clubrn.com'),
    ('DNI',       '30000005', 'Tomas',   'Ruiz',      NULL,          '2015-04-20', 'truiz@clubrn.com'),
    ('DNI',       '30000006', 'Sofia',   'Vera',      NULL,          '2011-09-05', 'svera@clubrn.com'),
    ('CI',        '30000007', 'Jorge',   'Alvarez',   '299-4001007', '1980-01-12', 'jalvarez@clubrn.com'),
    ('PASAPORTE', '30000008', 'Marina',  'Duarte',    '299-4001008', '1983-06-18', 'mduarte@clubrn.com'),
    ('DNI',       '30000009', 'Carla',   'Ponce',     '299-4001009', '1986-02-25', 'cponce@clubrn.com'),
    ('DNI',       '30000010', 'Pablo',   'Ledesma',   '299-4001010', '1995-08-08', 'pledesma@clubrn.com'),
    ('DNI',       '30000011', 'Nicolas', 'Ibarra',    '299-4001011', '1997-12-03', 'nibarra@clubrn.com');

INSERT INTO profesor (tipo_dni, nro_dni, fecha_ingreso) VALUES
    ('DNI', '30000001', '2016-03-01'),
    ('LC',  '30000003', '2018-07-15');

-- Marina llega a 5 ausencias consecutivas, que es el umbral fijado
-- para que el Tesorero evalue la baja del seguro. Su poliza figura dada de baja.
INSERT INTO socio (tipo_dni, nro_dni, es_federado, ddj_salud, fecha_inscripcion_club, ausencias_consecutivas) VALUES
    ('DNI',       '30000001', TRUE,  TRUE,  '2016-03-10', 0),
    ('DNI',       '30000002', FALSE, TRUE,  '2018-08-01', 1),
    ('DNI',       '30000004', FALSE, TRUE,  '2019-02-05', 2),
    ('DNI',       '30000005', TRUE,  TRUE,  '2024-03-10', 0),
    ('DNI',       '30000006', FALSE, TRUE,  '2023-05-15', 0),
    ('CI',        '30000007', TRUE,  TRUE,  '2017-04-20', 0),
    ('PASAPORTE', '30000008', FALSE, TRUE,  '2020-06-01', 5),
    ('DNI',       '30000010', FALSE, TRUE,  '2022-09-12', 3),
    ('DNI',       '30000011', FALSE, FALSE, '2026-08-20', 0);

-- El nombre de usuario se arma concatenando tipo y numero de documento.
-- La contrasenia se guarda hasheada. Las de aca son un hash de ejemplo.
INSERT INTO usuario (nombre_usuario, contrasenia, tipo_dni, nro_dni) VALUES
    ('DNI30000001', '$2b$12$eXaMpLeHaShClUbRn0000000uJ8kQvZ1rT4wY6bN9cD2fG5hK7mP', 'DNI', '30000001'),
    ('DNI30000002', '$2b$12$eXaMpLeHaShClUbRn0000000uJ8kQvZ1rT4wY6bN9cD2fG5hK7mP', 'DNI', '30000002'),
    ('LC30000003',  '$2b$12$eXaMpLeHaShClUbRn0000000uJ8kQvZ1rT4wY6bN9cD2fG5hK7mP', 'LC',  '30000003'),
    ('DNI30000004', '$2b$12$eXaMpLeHaShClUbRn0000000uJ8kQvZ1rT4wY6bN9cD2fG5hK7mP', 'DNI', '30000004'),
    ('CI30000007',  '$2b$12$eXaMpLeHaShClUbRn0000000uJ8kQvZ1rT4wY6bN9cD2fG5hK7mP', 'CI',  '30000007'),
    ('DNI30000010', '$2b$12$eXaMpLeHaShClUbRn0000000uJ8kQvZ1rT4wY6bN9cD2fG5hK7mP', 'DNI', '30000010');

INSERT INTO rol (nombre_rol, permisos) VALUES
    ('Socio',                  'Consulta de su perfil, asistencias, certificado y cuotas'),
    ('Profesor',               'Toma de asistencia de sus categorias y alta de socio potencial'),
    ('Administrativa general', 'Alta de socios, certificados, seguros y clasificacion'),
    ('Tesorero',               'Listado de deudores, registro de pagos y baja de seguros'),
    ('Recepcionista',          'Registro de socios potenciales y listado de no aptos');

-- El usuario DNI30000010 queda a proposito sin ningun rol.
INSERT INTO tiene_rol (nombre_rol, nombre_usuario, fecha_inicio_rol, fecha_fin_rol) VALUES
    ('Profesor',               'DNI30000001', '2026-01-01', '2026-12-31'),
    ('Socio',                  'DNI30000001', '2026-01-01', '2026-12-31'),
    ('Profesor',               'LC30000003',  '2026-01-01', '2026-12-31'),
    ('Administrativa general', 'DNI30000004', '2026-01-01', '2026-12-31'),
    ('Tesorero',               'CI30000007',  '2026-01-01', '2026-12-31'),
    ('Socio',                  'CI30000007',  '2026-01-01', '2026-12-31'),
    ('Socio',                  'DNI30000002', '2026-01-01', '2026-12-31');

INSERT INTO notificacion (id_notificacion, tipo, mensaje, fecha, nombre_usuario) VALUES
    (1, 'Recordatorio', 'Hay 2 registros pendientes de alta',        '2026-08-20 09:00:00', 'DNI30000004'),
    (2, 'Aviso',        'Marina Duarte alcanzo 5 ausencias seguidas','2026-08-18 11:30:00', 'CI30000007'),
    (3, 'Confirmacion', 'Se registro el pago de la cuota de julio',  '2026-07-05 14:15:00', 'DNI30000001'),
    (4, 'Recordatorio', 'Su cuota de julio figura impaga',           '2026-08-01 10:00:00', 'DNI30000010'),
    (5, 'Aviso',        'Su certificado medico vence en 30 dias',    '2026-08-10 16:45:00', 'DNI30000010');

-- Tomas es menor y tiene los 2 tutores que admite el modelo. Sofia tiene 1.
INSERT INTO tiene_tutor (tipo_dni_socio, nro_dni_socio, parentesco, tipo_dni_tutor, nro_dni_tutor) VALUES
    ('DNI', '30000005', 'Padre', 'CI',        '30000007'),
    ('DNI', '30000005', 'Madre', 'DNI',       '30000009'),
    ('DNI', '30000006', 'Madre', 'PASAPORTE', '30000008');

INSERT INTO estado_socio (tipo_dni, nro_dni, fecha_modificacion, estado, modificado_por) VALUES
    ('DNI',       '30000001', '2016-03-05 10:00:00', 'Pendiente de alta', 'DNI30000004'),
    ('DNI',       '30000001', '2016-03-10 10:00:00', 'Activo',            'DNI30000004'),
    ('DNI',       '30000002', '2018-08-01 10:00:00', 'Activo',            'DNI30000004'),
    ('DNI',       '30000002', '2026-06-01 10:00:00', 'Becado',            'DNI30000004'),
    ('DNI',       '30000004', '2019-02-05 10:00:00', 'Activo',            'DNI30000004'),
    ('DNI',       '30000005', '2024-03-10 10:00:00', 'Activo',            'DNI30000004'),
    ('DNI',       '30000006', '2026-04-10 10:00:00', 'Pendiente de alta', 'DNI30000004'),
    ('CI',        '30000007', '2017-04-20 10:00:00', 'Activo',            'DNI30000004'),
    ('PASAPORTE', '30000008', '2020-06-01 10:00:00', 'Activo',            'DNI30000004'),
    ('PASAPORTE', '30000008', '2026-06-15 10:00:00', 'No activo',         'CI30000007'),
    ('DNI',       '30000010', '2022-09-12 10:00:00', 'Activo',            'DNI30000004'),
    ('DNI',       '30000011', '2026-08-20 10:00:00', 'Socio potencial',   'DNI30000004');

-- -----------------------------------------------------------------------------
-- Actividades
-- -----------------------------------------------------------------------------

INSERT INTO disciplina (nombre_disciplina) VALUES
    ('Voley'),
    ('Handball');

INSERT INTO categoria (nombre_categoria, nombre_disciplina, edad_min, edad_max, enfoque) VALUES
    ('Infantiles', 'Voley',    6,  12, 'Recreativo'),
    ('Juveniles',  'Voley',    13, 17, 'Competitivo'),
    ('Adultos',    'Voley',    18, 60, 'Competitivo'),
    ('Infantiles', 'Handball', 6,  12, 'Recreativo'),
    ('Juveniles',  'Handball', 13, 17, 'Competitivo'),
    ('Adultos',    'Handball', 18, 60, 'Competitivo');

INSERT INTO pertenece (tipo_dni, nro_dni, nombre_disciplina, fecha_inscripcion) VALUES
    ('DNI',       '30000001', 'Voley',    '2016-03-10'),
    ('DNI',       '30000002', 'Handball', '2018-08-01'),
    ('DNI',       '30000004', 'Voley',    '2019-02-05'),
    ('DNI',       '30000005', 'Voley',    '2024-03-10'),
    ('DNI',       '30000006', 'Handball', '2023-05-15'),
    ('CI',        '30000007', 'Voley',    '2017-04-20'),
    ('CI',        '30000007', 'Handball', '2017-04-20'),
    ('PASAPORTE', '30000008', 'Handball', '2020-06-01'),
    ('DNI',       '30000010', 'Voley',    '2022-09-12');

INSERT INTO a_cargo (nombre_disciplina, nombre_categoria, rol_profesor, tipo_dni, nro_dni) VALUES
    ('Voley',    'Infantiles', 'Director Tecnico',  'DNI', '30000001'),
    ('Voley',    'Infantiles', 'Preparador Fisico', 'LC',  '30000003'),
    ('Voley',    'Juveniles',  'Director Tecnico',  'LC',  '30000003'),
    ('Voley',    'Adultos',    'Director Tecnico',  'DNI', '30000001'),
    ('Handball', 'Infantiles', 'Director Tecnico',  'LC',  '30000003'),
    ('Handball', 'Juveniles',  'Director Tecnico',  'DNI', '30000001'),
    ('Handball', 'Adultos',    'Director Tecnico',  'LC',  '30000003');

-- <B>: ahora con sede y revisiones. Centro: 1, 3, 5. Norte: 2, 4, 6.
INSERT INTO planilla_asistencia (id_planilla, tipo_dni, nro_dni, sede, revisiones) VALUES
    (1, 'DNI', '30000001', 'Centro', 0),
    (2, 'LC',  '30000003', 'Norte',  1),
    (3, 'DNI', '30000001', 'Centro', 2),
    (4, 'LC',  '30000003', 'Norte',  0),
    (5, 'DNI', '30000001', 'Centro', 1),
    (6, 'LC',  '30000003', 'Norte',  3);

INSERT INTO clase (nombre_disciplina, nombre_categoria, fecha, hora_inicio, hora_fin, id_planilla) VALUES
    ('Voley',    'Infantiles', '2026-08-03', '17:00', '18:30', 1),
    ('Voley',    'Juveniles',  '2026-08-03', '18:30', '20:00', 2),
    ('Voley',    'Adultos',    '2026-08-04', '20:00', '21:30', 3),
    ('Handball', 'Infantiles', '2026-08-05', '17:00', '18:30', 4),
    ('Handball', 'Juveniles',  '2026-08-05', '18:30', '20:00', 5),
    ('Handball', 'Adultos',    '2026-08-06', '20:00', '21:30', 6);

-- <C>: se usan los tres estados de asistencia.
INSERT INTO detalle_asistencia (id_planilla, tipo_dni_socio, nro_dni_socio, estado_asistencia) VALUES
    (1, 'DNI',       '30000005', 'Presente'),
    (3, 'DNI',       '30000001', 'Presente'),
    (3, 'DNI',       '30000004', 'Ausente'),
    (3, 'CI',        '30000007', 'Presente'),
    (3, 'DNI',       '30000010', 'Ausente justificado'),
    (5, 'DNI',       '30000006', 'Presente'),
    (6, 'DNI',       '30000002', 'Presente'),
    (6, 'PASAPORTE', '30000008', 'Ausente'),
    (6, 'CI',        '30000007', 'Presente');

-- -----------------------------------------------------------------------------
-- Salud y seguro
-- -----------------------------------------------------------------------------

INSERT INTO medico (matricula, nombre, apellido, telefono) VALUES
    ('MP-1001', 'Silvana', 'Rios',   '299-4002001'),
    ('MP-1002', 'Ernesto', 'Vidal',  '299-4002002');

INSERT INTO certificado_medico (tipo_dni, nro_dni, fecha_emision, fecha_vencimiento, es_apto, matricula) VALUES
    ('DNI',       '30000001', '2026-03-01', '2027-03-01', TRUE,  'MP-1001'),
    ('DNI',       '30000002', '2026-05-05', '2027-05-05', TRUE,  'MP-1002'),
    ('DNI',       '30000004', '2026-03-20', '2027-03-20', FALSE, 'MP-1001'),
    ('DNI',       '30000005', '2026-02-15', '2027-02-15', TRUE,  'MP-1001'),
    ('DNI',       '30000006', '2026-04-10', '2027-04-10', TRUE,  'MP-1002'),
    ('CI',        '30000007', '2026-01-20', '2027-01-20', TRUE,  'MP-1002'),
    ('PASAPORTE', '30000008', '2025-06-01', '2026-06-01', TRUE,  'MP-1001');

INSERT INTO seguro (nro_poliza, tipo_dni_socio, nro_dni_socio, fecha_alta, fecha_vencimiento, fecha_baja, tipo) VALUES
    ('POL-3001', 'DNI',       '30000001', '2026-03-05', '2027-03-05', NULL,         'Responsabilidad Civil'),
    ('POL-3002', 'DNI',       '30000005', '2026-02-20', '2027-02-20', NULL,         'Accidentes Personales'),
    ('POL-3003', 'CI',        '30000007', '2026-01-25', '2027-01-25', NULL,         'Accidentes Personales'),
    ('POL-3004', 'PASAPORTE', '30000008', '2025-06-10', '2026-06-10', '2026-06-15', 'Responsabilidad Civil'),
    ('POL-3005', 'DNI',       '30000006', '2026-04-15', '2027-04-15', NULL,         'Accidentes Personales'),
    ('POL-3006', 'DNI', '30000001', '2025-03-01', '2026-03-01', NULL, 'Responsabilidad Civil'),
    ('POL-3007', 'DNI', '30000005', '2025-05-10', '2026-05-10', NULL, 'Accidentes Personales'),
    ('POL-3008', 'CI',  '30000007', '2025-08-20', '2026-08-20', NULL, 'Accidentes Personales');

-- -----------------------------------------------------------------------------
-- Finanzas
-- -----------------------------------------------------------------------------

INSERT INTO cuota (id_cuota, fecha, monto, estado_de_pago, periodo, tipo_dni, nro_dni) VALUES
    (1, '2026-07-01', 15000.00, 'Saldada',    '2026-07', 'DNI',       '30000001'),
    (2, '2026-07-01', 15000.00, 'Saldada',    '2026-07', 'DNI',       '30000004'),
    (3, '2026-07-01', 12000.00, 'Saldada',    '2026-07', 'DNI',       '30000005'),
    (4, '2026-07-01', 12000.00, 'No saldada', '2026-07', 'DNI',       '30000006'),
    (5, '2026-07-01', 15000.00, 'Saldada',    '2026-07', 'CI',        '30000007'),
    (6, '2026-07-01', 15000.00, 'No saldada', '2026-07', 'PASAPORTE', '30000008'),
    (7, '2026-07-01', 15000.00, 'No saldada', '2026-07', 'DNI',       '30000010'),
    (8, '2026-08-01', 15000.00, 'No saldada', '2026-08', 'DNI',       '30000001'),
    (9,  '2024-01-01', 10000.00, 'Saldada',    '2024-01', 'DNI', '30000001'),
    (10, '2024-06-01', 10500.00, 'Saldada',    '2024-06', 'DNI', '30000001'),
    (11, '2025-01-01', 12000.00, 'Saldada',    '2025-01', 'DNI', '30000001'),
    (12, '2025-08-01', 13000.00, 'Saldada',    '2025-08', 'DNI', '30000001'),
    (13, '2026-01-01', 14000.00, 'Saldada',    '2026-01', 'DNI', '30000001'),
    (14, '2025-02-01', 12000.00, 'Saldada',    '2025-02', 'DNI', '30000004'),
    (15, '2025-05-01', 12500.00, 'Saldada',    '2025-05', 'DNI', '30000004'),
    (16, '2026-02-01', 15000.00, 'Saldada',    '2026-02', 'DNI', '30000004'),
    (17, '2024-03-01', 10000.00, 'Saldada',    '2024-03', 'DNI', '30000005'),
    (18, '2024-12-01', 11000.00, 'Saldada',    '2024-12', 'DNI', '30000005'),
    (19, '2025-09-01', 13000.00, 'No saldada', '2025-09', 'DNI', '30000005'),
    (20, '2024-05-01', 10000.00, 'No saldada', '2024-05', 'DNI', '30000006'),
    (21, '2025-05-01', 12000.00, 'No saldada', '2025-05', 'DNI', '30000006'),
    (22, '2026-05-01', 15000.00, 'No saldada', '2026-05', 'DNI', '30000006'),
    (23, '2025-01-01', 12000.00, 'Saldada',    '2025-01', 'CI',  '30000007'),
    (24, '2025-07-01', 13000.00, 'Saldada',    '2025-07', 'CI',  '30000007'),
    (25, '2026-03-01', 15000.00, 'Saldada',    '2026-03', 'CI',  '30000007'),
    (26, '2024-02-01', 10000.00, 'No saldada', '2024-02', 'PASAPORTE', '30000008'),
    (27, '2024-08-01', 10500.00, 'Saldada',    '2024-08', 'PASAPORTE', '30000008'),
    (28, '2025-02-01', 12000.00, 'No saldada', '2025-02', 'PASAPORTE', '30000008'),
    (29, '2026-02-01', 15000.00, 'No saldada', '2026-02', 'PASAPORTE', '30000008'),
    (30, '2025-01-01', 12000.00, 'No saldada', '2025-01', 'DNI', '30000010'),
    (31, '2025-06-01', 13000.00, 'Saldada',    '2025-06', 'DNI', '30000010'),
    (32, '2026-01-01', 15000.00, 'No saldada', '2026-01', 'DNI', '30000010');

INSERT INTO pago (id_pago, fecha_pago, monto, id_cuota) VALUES
    (1, '2026-07-05', 15000.00, 1),
    (2, '2026-07-06', 15000.00, 2),
    (3, '2026-07-04', 12000.00, 3),
    (4, '2026-07-08', 15000.00, 5);

-- -----------------------------------------------------------------------------
-- Cargos
-- -----------------------------------------------------------------------------

INSERT INTO cargo_administrativo (id_cargo, descripcion) VALUES
    (1, 'Tesorero'),
    (2, 'Recepcionista'),
    (3, 'Administrativo General');

INSERT INTO tiene_cargo (tipo_dni, nro_dni, id_cargo, fecha_inicio_cargo, fecha_fin_cargo) VALUES
    ('CI',  '30000007', 1, '2026-01-01', '2026-12-31'),
    ('DNI', '30000004', 3, '2026-01-01', '2026-12-31');

-- -----------------------------------------------------------------------------
-- Reinicio de los contadores
-- -----------------------------------------------------------------------------
-- Cada numero es el ultimo cargado mas uno.

ALTER TABLE notificacion         ALTER COLUMN id_notificacion RESTART WITH 6;
ALTER TABLE planilla_asistencia  ALTER COLUMN id_planilla     RESTART WITH 7;
ALTER TABLE cuota                ALTER COLUMN id_cuota        RESTART WITH 33;
ALTER TABLE pago                 ALTER COLUMN id_pago         RESTART WITH 5;
ALTER TABLE cargo_administrativo ALTER COLUMN id_cargo        RESTART WITH 4;