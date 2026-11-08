-- =============================================================================
-- Carga masiva para el ejercicio 3 (EXPLAIN). OPCIONAL.
-- Correr en nodo1 despues de 02_poblacion_tp5a.sql.
--
-- Genera 3000 planillas (ids 7 a 3006) repartidas entre las dos sedes y entre
-- 3 y 6 filas de detalle_asistencia por planilla. 
--
-- Si ya corrieron el ejercicio 1 con este script, nodo2 recibe los datos solo.
-- Cuando recreen planilla_asistencia como particionada en el ejercicio 3,
-- guarden estos datos antes (por ejemplo con INSERT ... SELECT a una tabla
-- temporal) y vuelvan a cargarlos por la tabla padre.
-- =============================================================================

INSERT INTO planilla_asistencia (id_planilla, tipo_dni, nro_dni, sede, revisiones)
SELECT g,
       CASE WHEN g % 2 = 0 THEN 'LC'       ELSE 'DNI'      END,
       CASE WHEN g % 2 = 0 THEN '30000003' ELSE '30000001' END,
       CASE WHEN g % 2 = 0 THEN 'Norte'    ELSE 'Centro'   END,
       g % 6
FROM generate_series(7, 3006) AS g;

INSERT INTO detalle_asistencia (id_planilla, tipo_dni_socio, nro_dni_socio, estado_asistencia)
SELECT p.id_planilla,
       s.tipo_dni,
       s.nro_dni,
       (ARRAY['Presente', 'Ausente', 'Ausente justificado'])[1 + (p.id_planilla + s.rn) % 3]
FROM planilla_asistencia p
CROSS JOIN (
    SELECT tipo_dni, nro_dni, row_number() OVER (ORDER BY tipo_dni, nro_dni) AS rn
    FROM socio
) s
WHERE p.id_planilla >= 7
  AND s.rn <= 3 + (p.id_planilla % 4);

ALTER TABLE planilla_asistencia ALTER COLUMN id_planilla RESTART WITH 3007;
