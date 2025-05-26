-- Consulta para obtener pacientes con presión sistólica alta (>140)
SELECT id, edad, presion_sistolica, colesterol, biomarcador, resultado
FROM pacientes
WHERE presion_sistolica > 140
ORDER BY edad DESC;
