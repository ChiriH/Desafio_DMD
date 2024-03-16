create database Spa_Diego
use Spa_Diego

------------------------------------SPA CENTRO-----------------------------------------------------


----MUESTRA TODAS LAS PERSONAS DE SEXO FEMENINO
SELECT id,Sexo  FROM SpaCentro
WHERE Sexo = 0

----MUESTRA LA CANTIDAD DE MUJERES
SELECT Sexo, COUNT(*) AS Cantidad
FROM SpaCentro	
WHERE Sexo = 0
GROUP BY Sexo

----MUESTRA TODAS LAS PERSONAS DE SEXO MASCULINO
SELECT id, Sexo FROM SpaCentro
WHERE Sexo = 1

----MUESTRA LA CANTIDAD DE HOMBRES
SELECT Sexo, COUNT(*) AS Cantidad
FROM SpaCentro
WHERE Sexo = 1
GROUP BY Sexo

----MUESTRA LA CANTIDAD DE PERSONAS QUE TIENEN LA MISMA EDAD
SELECT Edad, COUNT(*) AS Cantidad
FROM SpaCentro
GROUP BY Edad
ORDER BY Edad

----MUESTRA LA EDAD MEDIA DE LOS CLIENTES
SELECT SUM(Edad)/50 AS "Edad Media"
FROM SpaCentro

----MUESTRA EL PORCENTAJE DE HOMBRES Y MUJERES
SELECT 
    SUM(CASE WHEN Sexo = 1 THEN 1 ELSE 0 END) AS Hombres,
    SUM(CASE WHEN Sexo = 0 THEN 1 ELSE 0 END) AS Mujeres,
    COUNT(*) AS Total,
    CAST((SUM(CASE WHEN Sexo = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS Porcentaje_Hombres,
    CAST((SUM(CASE WHEN Sexo = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS Porcentaje_Mujeres
FROM 
    SpaCentro

----MUESTRA EL TOP 15 DE PERSONAS QUE MÁS HAN CONSUMIDO DEL SERVICIO DE SPA
SELECT TOP 15 id, Sexo, ingresos FROM SpaCentro
ORDER BY ingresos DESC

----MUESTRA LA MEDIA DE CONSUMO POR PERSONA EN EL SPA
SELECT CAST(SUM(ingresos)/COUNT(*) AS DECIMAL(6,2))AS "Media de Ingresos" FROM SpaCentro

----MUESTRA A LAS PERSONAS QUE HAN USADO EL SERVICIO DE SAUNA
SELECT id, Sexo, Sauna FROM SpaCentro
WHERE Sauna = 1

----MUESTRA A LAS PERSONAS QUE HAN USADO EL SERVICIO DE MASAJE
SELECT id, Sexo, Masaje FROM SpaCentro
WHERE Masaje = 1

----MUESTRA A LAS PERSONAS QUE HAN USADO EL SERVICIO DE HIDRO
SELECT id, Sexo, Hidro FROM SpaCentro
WHERE Hidro = 1

----MUESTRA A LAS PERSONAS QUE HAN USADO EL SERVICIO DE YOGA
SELECT id, Sexo, Yoga FROM SpaCentro
WHERE Yoga = 1


----MUESTRA EL PORCENTAJE DE USO DE CADA SERVICIO
SELECT  
	SUM(CASE WHEN Sauna = 1 THEN 1 ELSE 0 END) AS "Personas",
	COUNT(*) AS "Total",
	CAST((SUM(CASE WHEN Sauna = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS "Porcentaje",
	SUM(CASE WHEN Sauna = 1 AND Sexo = 0 THEN 1 ELSE 0 END) AS "Mujeres",
	SUM(CASE WHEN Sauna = 1 AND Sexo = 1  THEN 1 ELSE 0 END) AS "Hombres",
    'Sauna' AS "Tipo de Servicio"
FROM SpaCentro

UNION ALL

SELECT  
	SUM(CASE WHEN Masaje = 1 THEN 1 ELSE 0 END) AS "Personas",
	COUNT(*) AS "Total",
	CAST((SUM(CASE WHEN Masaje = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS "Porcentaje",
	SUM(CASE WHEN Masaje = 1 AND Sexo = 0 THEN 1 ELSE 0 END) AS "Mujeres",
	SUM(CASE WHEN Masaje = 1 AND Sexo = 1  THEN 1 ELSE 0 END) AS "Hombres",
    'Masaje' AS "Tipo de Servicio"
FROM SpaCentro

UNION ALL

SELECT  
	SUM(CASE WHEN Hidro = 1 THEN 1 ELSE 0 END) AS "Personas",
	COUNT(*) AS "Total",
	CAST((SUM(CASE WHEN Hidro = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS "Porcentaje",
	SUM(CASE WHEN Hidro = 1 AND Sexo = 0 THEN 1 ELSE 0 END) AS "Mujeres",
	SUM(CASE WHEN Hidro = 1 AND Sexo = 1  THEN 1 ELSE 0 END) AS "Hombres",
    'Hidro' AS "Tipo de Servicio"
FROM SpaCentro

UNION ALL

SELECT  
	SUM(CASE WHEN Yoga = 1 THEN 1 ELSE 0 END) AS "Personas",
	COUNT(*) AS "Total",
	CAST((SUM(CASE WHEN Yoga = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS "Porcentaje",
	SUM(CASE WHEN Yoga = 1 AND Sexo = 0 THEN 1 ELSE 0 END) AS "Mujeres",
	SUM(CASE WHEN Yoga = 1 AND Sexo = 1  THEN 1 ELSE 0 END) AS "Hombres",
    'Yoga' AS "Tipo de Servicio"
FROM SpaCentro
	Order by "Porcentaje" DESC

----MUESTRA EL TOP 10 DE PERSONAS QUE MÁS VISITAN EL SPA
SELECT TOP 10 id, Sexo, PromVisit FROM SpaCentro
ORDER BY PromVisit DESC

SELECT * FROM SpaCentro

------------------------------------SPA ESCALON-----------------------------------------------

----MUESTRA TODAS LAS PERSONAS DE SEXO FEMENINO
SELECT id,Sexo  FROM SpaEscalon
WHERE Sexo = 0

----MUESTRA LA CANTIDAD DE MUJERES
SELECT Sexo, COUNT(*) AS Cantidad
FROM SpaEscalon
WHERE Sexo = 0
GROUP BY Sexo

----MUESTRA TODAS LAS PERSONAS DE SEXO MASCULINO
SELECT id, Sexo FROM SpaEscalon
WHERE Sexo = 1

----MUESTRA LA CANTIDAD DE HOMBRES
SELECT Sexo, COUNT(*) AS Cantidad
FROM SpaEscalon
WHERE Sexo = 1
GROUP BY Sexo

----MUESTRA LA CANTIDAD DE PERSONAS QUE TIENEN LA MISMA EDAD
SELECT Edad, COUNT(*) AS Cantidad
FROM SpaEscalon
GROUP BY Edad
ORDER BY Edad

----MUESTRA LA EDAD MEDIA DE LOS CLIENTES
SELECT
	SUM(Edad)/COUNT(*) as Media_Edad
FROM
	SpaEscalon

----MUESTRA EL PORCENTAJE DE HOMBRES Y MUJERES
SELECT 
    SUM(CASE WHEN Sexo = 1 THEN 1 ELSE 0 END) AS Hombres,
    SUM(CASE WHEN Sexo = 0 THEN 1 ELSE 0 END) AS Mujeres,
    COUNT(*) AS Total,
    CAST((SUM(CASE WHEN Sexo = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS Porcentaje_Hombres,
    CAST((SUM(CASE WHEN Sexo = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS Porcentaje_Mujeres
FROM 
    SpaEscalon

----MUESTRA EL TOP 15 DE PERSONAS QUE MÁS HAN CONSUMIDO DEL SERVICIO DE SPA
SELECT TOP 15 id, Sexo, ingresos FROM SpaEscalon
ORDER BY ingresos DESC

----MUESTRA LA MEDIA DE CONSUMO POR PERSONA EN EL SPA
SELECT CAST(SUM(ingresos)/COUNT(*) AS DECIMAL(6,2))AS "Media de Ingresos" FROM SpaEscalon

----MUESTRA A LAS PERSONAS QUE HAN USADO EL SERVICIO DE SAUNA
SELECT id, Sexo, Sauna FROM SpaEscalon
WHERE Sauna = 1

----MUESTRA A LAS PERSONAS QUE HAN USADO EL SERVICIO DE MASAJE
SELECT id, Sexo, Masaje FROM SpaEscalon
WHERE Masaje = 1

----MUESTRA A LAS PERSONAS QUE HAN USADO EL SERVICIO DE HIDRO
SELECT id, Sexo, Hidro FROM SpaEscalon
WHERE Hidro = 1

----MUESTRA A LAS PERSONAS QUE HAN USADO EL SERVICIO DE YOGA
SELECT id, Sexo, Yoga FROM SpaEscalon
WHERE Yoga = 1


----MUESTRA EL PORCENTAJE DE USO DE CADA SERVICIO
SELECT  
	SUM(CASE WHEN Sauna = 1 THEN 1 ELSE 0 END) AS "Personas",
	COUNT(*) AS "Total",
	CAST((SUM(CASE WHEN Sauna = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS "Porcentaje",
	SUM(CASE WHEN Sauna = 1 AND Sexo = 0 THEN 1 ELSE 0 END) AS "Mujeres",
	SUM(CASE WHEN Sauna = 1 AND Sexo = 1  THEN 1 ELSE 0 END) AS "Hombres",
    'Sauna' AS "Tipo de Servicio"
FROM SpaEscalon

UNION ALL

SELECT  
	SUM(CASE WHEN Masaje = 1 THEN 1 ELSE 0 END) AS "Personas",
	COUNT(*) AS "Total",
	CAST((SUM(CASE WHEN Masaje = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS "Porcentaje",
	SUM(CASE WHEN Masaje = 1 AND Sexo = 0 THEN 1 ELSE 0 END) AS "Mujeres",
	SUM(CASE WHEN Masaje = 1 AND Sexo = 1  THEN 1 ELSE 0 END) AS "Hombres",
    'Masaje' AS "Tipo de Servicio"
FROM SpaEscalon

UNION ALL

SELECT  
	SUM(CASE WHEN Hidro = 1 THEN 1 ELSE 0 END) AS "Personas",
	COUNT(*) AS "Total",
	CAST((SUM(CASE WHEN Hidro = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS "Porcentaje",
	SUM(CASE WHEN Hidro = 1 AND Sexo = 0 THEN 1 ELSE 0 END) AS "Mujeres",
	SUM(CASE WHEN Hidro = 1 AND Sexo = 1  THEN 1 ELSE 0 END) AS "Hombres",
    'Hidro' AS "Tipo de Servicio"
FROM SpaEscalon

UNION ALL

SELECT  
	SUM(CASE WHEN Yoga = 1 THEN 1 ELSE 0 END) AS "Personas",
	COUNT(*) AS "Total",
	CAST((SUM(CASE WHEN Yoga = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS "Porcentaje",
	SUM(CASE WHEN Yoga = 1 AND Sexo = 0 THEN 1 ELSE 0 END) AS "Mujeres",
	SUM(CASE WHEN Yoga = 1 AND Sexo = 1  THEN 1 ELSE 0 END) AS "Hombres",
    'Yoga' AS "Tipo de Servicio"
FROM SpaEscalon
	Order by "Porcentaje" DESC

----MUESTRA EL TOP 10 DE PERSONAS QUE MÁS VISITAN EL SPA
SELECT TOP 10 id, Sexo, PromVisit FROM SpaEscalon
ORDER BY PromVisit DESC

------------------------------------SPA SANTA TECLA-----------------------------------------------

----MUESTRA TODAS LAS PERSONAS DE SEXO FEMENINO
SELECT id,Sexo  FROM SpaSantaTecla
WHERE Sexo = 0

----MUESTRA LA CANTIDAD DE MUJERES
SELECT Sexo, COUNT(*) AS Cantidad
FROM SpaSantaTecla
WHERE Sexo = 0
GROUP BY Sexo

----MUESTRA TODAS LAS PERSONAS DE SEXO MASCULINO
SELECT id, Sexo FROM SpaSantaTecla
WHERE Sexo = 1

----MUESTRA LA CANTIDAD DE HOMBRES
SELECT Sexo, COUNT(*) AS Cantidad
FROM SpaSantaTecla
WHERE Sexo = 1
GROUP BY Sexo

----MUESTRA LA CANTIDAD DE PERSONAS QUE TIENEN LA MISMA EDAD
SELECT Edad, COUNT(*) AS Cantidad
FROM SpaSantaTecla	
GROUP BY Edad
ORDER BY Edad

----MUESTRA LA EDAD MEDIA DE LOS CLIENTES
SELECT
	SUM(Edad)/COUNT(*) as Media_Edad
FROM
	SpaSantaTecla

----MUESTRA EL PORCENTAJE DE HOMBRES Y MUJERES
SELECT 
    SUM(CASE WHEN Sexo = 1 THEN 1 ELSE 0 END) AS Hombres,
    SUM(CASE WHEN Sexo = 0 THEN 1 ELSE 0 END) AS Mujeres,
    COUNT(*) AS Total,
    CAST((SUM(CASE WHEN Sexo = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS Porcentaje_Hombres,
    CAST((SUM(CASE WHEN Sexo = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS Porcentaje_Mujeres
FROM 
    SpaSantaTecla

----MUESTRA EL TOP 15 DE PERSONAS QUE MÁS HAN CONSUMIDO DEL SERVICIO DE SPA
SELECT TOP 15 id, Sexo, ingresos FROM SpaSantaTecla
ORDER BY ingresos DESC

----MUESTRA LA MEDIA DE CONSUMO POR PERSONA EN EL SPA
SELECT CAST(SUM(ingresos)/COUNT(*) AS DECIMAL(6,2))AS "Media de Ingresos" FROM SpaSantaTecla

----MUESTRA A LAS PERSONAS QUE HAN USADO EL SERVICIO DE SAUNA
SELECT id, Sexo, Sauna FROM SpaSantaTecla
WHERE Sauna = 1

----MUESTRA A LAS PERSONAS QUE HAN USADO EL SERVICIO DE MASAJE
SELECT id, Sexo, Masaje FROM SpaSantaTecla
WHERE Masaje = 1

----MUESTRA A LAS PERSONAS QUE HAN USADO EL SERVICIO DE HIDRO
SELECT id, Sexo, Hidro FROM SpaSantaTecla
WHERE Hidro = 1

----MUESTRA A LAS PERSONAS QUE HAN USADO EL SERVICIO DE YOGA
SELECT id, Sexo, Yoga FROM SpaSantaTecla
WHERE Yoga = 1


----MUESTRA EL PORCENTAJE DE USO DE CADA SERVICIO
SELECT  
	SUM(CASE WHEN Sauna = 1 THEN 1 ELSE 0 END) AS "Personas",
	COUNT(*) AS "Total",
	CAST((SUM(CASE WHEN Sauna = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS "Porcentaje",
	SUM(CASE WHEN Sauna = 1 AND Sexo = 0 THEN 1 ELSE 0 END) AS "Mujeres",
	SUM(CASE WHEN Sauna = 1 AND Sexo = 1  THEN 1 ELSE 0 END) AS "Hombres",
    'Sauna' AS "Tipo de Servicio"
FROM SpaSantaTecla

UNION ALL

SELECT  
	SUM(CASE WHEN Masaje = 1 THEN 1 ELSE 0 END) AS "Personas",
	COUNT(*) AS "Total",
	CAST((SUM(CASE WHEN Masaje = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS "Porcentaje",
	SUM(CASE WHEN Masaje = 1 AND Sexo = 0 THEN 1 ELSE 0 END) AS "Mujeres",
	SUM(CASE WHEN Masaje = 1 AND Sexo = 1  THEN 1 ELSE 0 END) AS "Hombres",
    'Masaje' AS "Tipo de Servicio"
FROM SpaSantaTecla

UNION ALL

SELECT  
	SUM(CASE WHEN Hidro = 1 THEN 1 ELSE 0 END) AS "Personas",
	COUNT(*) AS "Total",
	CAST((SUM(CASE WHEN Hidro = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS "Porcentaje",
	SUM(CASE WHEN Hidro = 1 AND Sexo = 0 THEN 1 ELSE 0 END) AS "Mujeres",
	SUM(CASE WHEN Hidro = 1 AND Sexo = 1  THEN 1 ELSE 0 END) AS "Hombres",
    'Hidro' AS "Tipo de Servicio"
FROM SpaSantaTecla

UNION ALL

SELECT  
	SUM(CASE WHEN Yoga = 1 THEN 1 ELSE 0 END) AS "Personas",
	COUNT(*) AS "Total",
	CAST((SUM(CASE WHEN Yoga = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS decimal(5,2)) AS "Porcentaje",
	SUM(CASE WHEN Yoga = 1 AND Sexo = 0 THEN 1 ELSE 0 END) AS "Mujeres",
	SUM(CASE WHEN Yoga = 1 AND Sexo = 1  THEN 1 ELSE 0 END) AS "Hombres",
    'Yoga' AS "Tipo de Servicio"
FROM SpaSantaTecla
	Order by "Porcentaje" DESC

----MUESTRA EL TOP 10 DE PERSONAS QUE MÁS VISITAN EL SPA
SELECT TOP 10 id, Sexo, PromVisit FROM SpaSantaTecla
ORDER BY PromVisit DESC
