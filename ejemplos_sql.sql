
-- CREAR TABLA
CREATE TABLE pacientes (
    paciente_id CHAR(4) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad INT,
    presion_sistolica INT,
    colesterol INT,
    biomarcador FLOAT,
    resultado INT
);

-- AÑADIR COLUMNAS
ALTER TABLE pacientes ADD COLUMN fecha_registro DATE;
ALTER TABLE pacientes ADD COLUMN observaciones VARCHAR(255);

-- MODIFICAR COLUMNA
ALTER TABLE pacientes MODIFY presion_sistolica CHAR(5); -- MySQL
-- ALTER TABLE pacientes ALTER COLUMN presion_sistolica SET DATA TYPE CHAR(5); -- DB2

-- ELIMINAR COLUMNA
ALTER TABLE pacientes DROP COLUMN observaciones;

-- RENOMBRAR COLUMNA
ALTER TABLE pacientes CHANGE COLUMN nombre nombre_completo VARCHAR(100); -- MySQL
-- ALTER TABLE pacientes RENAME COLUMN nombre TO nombre_completo; -- DB2

-- INSERTAR DATOS
INSERT INTO pacientes (paciente_id, nombre_completo, edad, presion_sistolica, colesterol, biomarcador, resultado, fecha_registro) VALUES
('P001', 'Ana Pérez', 45, 130, 200, 1.2, 0, '2025-01-01'),
('P002', 'Luis Gómez', 50, 140, 230, 2.1, 1, '2025-01-02'),
('P003', 'Carla Ruiz', 38, 120, 180, 0.9, 0, '2025-01-03');

-- CONSULTAS BÁSICAS
SELECT * FROM pacientes;

SELECT nombre_completo, edad FROM pacientes WHERE presion_sistolica > 135;

SELECT DISTINCT resultado FROM pacientes;

SELECT COUNT(*) FROM pacientes WHERE resultado = 1;

SELECT * FROM pacientes WHERE nombre_completo LIKE '%Pérez%';

SELECT * FROM pacientes WHERE edad BETWEEN 40 AND 60;

SELECT * FROM pacientes ORDER BY colesterol DESC;

-- CONSULTAS CON AGRUPAMIENTO
SELECT resultado, COUNT(*) AS cantidad, AVG(colesterol) AS colesterol_promedio
FROM pacientes
GROUP BY resultado
HAVING cantidad > 0
ORDER BY colesterol_promedio DESC;

-- ACTUALIZAR DATOS
UPDATE pacientes SET presion_sistolica = 135 WHERE paciente_id = 'P003';

-- ELIMINAR DATOS
DELETE FROM pacientes WHERE resultado = 0;

-- BORRAR TODAS LAS FILAS
TRUNCATE TABLE pacientes;

-- ELIMINAR TABLA
DROP TABLE pacientes;
