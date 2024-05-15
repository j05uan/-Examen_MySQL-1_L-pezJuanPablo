-- ######## Consultas  #########

USE examen1;

-- 1.Consulta de Todos los Eventos en un Complejo Deportivo Específico.

SELECT id_evento_complejo from evento_complejo_deportivo ecd 
WHERE id_complejo=(SELECT id_complejo from evento_complejo_deportivo 
WHERE id_evento_complejo= 2);

-- 2.Consulta de Comisarios Asignados a un Evento en Particular.

SELECT COUNT(id_comisario) from evento_comisario e
where id_evento =3;
-- 3.Consulta de Todos los Eventos en un Rango de Fechas.

SELECT nombre from eventos 
WHERE fecha BETWEEN '2023-05-12 10:00:00' AND '2024-01-04 14:00:00';

-- 4. Consulta del Número Total de Comisarios Asignados a Eventos.

SELECT COUNT(id_evento_comisario) from evento_comisario ;

-- 5. Consulta de Complejos Polideportivos con Área Total Ocupada Superior a un Valor Específico.

SELECT complejo_polideportivo.nombre,info_complejo.area_complejo, complejo_polideportivo.id_complejo_polideportivo, info_complejo.id_complejo from complejo_polideportivo 
inner join info_complejo on complejo_polideportivo.id_complejo_polideportivo = info_complejo.id_complejo
WHERE info_complejo.area_complejo > 5 ;

-- 6.Consulta de Eventos con Número de Participantes Mayor que la Media.
SELECT nombre, num_participantes  from eventos 
WHERE num_participantes > (SELECT AVG (num_participantes) from eventos);

-- 7.Consulta de Equipamiento Necesario para un Evento Específico.
SELECT e.nombre_equipos from evento_equipo ee 
left join equipamiento e on e.id_equipamiento = ee.id_equipamiento 
WHere ee.id_evento =3;
-- 8.Consulta de Eventos Celebrados en Complejos Deportivos con Jefe de Organización Específico.
SELECT  

-- 9.Consulta de Complejos Polideportivos sin Eventos Celebrados.
SELECT evento_complejo_poli.id_evento_complejo , eventos.nombre, eventos.id_eventos from  evento_complejo_poli
inner join eventos on evento_complejo_poli.id_evento_complejo = eventos.id_eventos WHERE eventos.fecha < '2024-01-04 14:00:00';

-- 10.Consulta de Comisarios que Actúan como Jueces en Todos los Eventos.
SELECT nombre from comisario c 
WHERE tipo = 'juez';
