CREATE DATABASE examen1;

USE examen1;

-- se crea deportes
CREATE TABLE deportes(
	id_deporte int PRIMARY KEY,
	nombre varchar(100),
	num_jugadores int
);

-- se crea jefes 
CREATE TABLE jefes (
	id_jefe int PRIMARY KEY,
	nombre varchar(100),
	email varchar(100),
	titulo varchar(100)
);

-- se crea equipamiento 
CREATE TABLE equipamiento (
	id_equipamiento int PRIMARY KEY,
	nombre_equipos varchar(100),
	stock int
);

-- se crea comisario 
CREATE TABLE comisario (
	id_comisario int PRIMARY KEY,
	nombre varchar(100),
	email varchar(100),
	telefono varchar(20),
	tipo enum ('juez', 'observador')
);

-- se crea info_complejo
CREATE TABLE info_complejo (
 	id_complejo int PRIMARY KEY,
 	locacion varchar(100),
 	area_complejo float,
 	id_jefe int,
 	foreign key (id_jefe) references jefes(id_jefe)
);

-- se crea complejo_polideportivo 
CREATE TABLE complejo_polideportivo(
	id_complejo_polideportivo int PRIMARY KEY,
	nombre varchar(100),
	id_deporte int,
	id_complejo int,
	foreign key (id_complejo) references info_complejo(id_complejo),
	foreign key (id_deporte) references deportes(id_deporte)
);

-- se crea complejo deportivo
CREATE TABLE complejo_deportivo(
	id_complejo_deportivo int PRIMARY KEY,
	nombre varchar(100),
	id_deporte int,
	id_complejo int,
	foreign key (id_complejo) references info_complejo(id_complejo),
	foreign key (id_deporte) references deportes(id_deporte)
);

-- se crea eventos 
CREATE TABLE eventos (
	id_eventos int PRIMARY KEY,
	nombre varchar(100),
	fecha datetime,
	duracion time,
	num_participantes int
);

-- se crea evento_complejo_poli 
CREATE TABLE evento_complejo_poli (
	id_evento_complejo int PRIMARY KEY,
	id_evento int,
	id_complejo int,
	foreign key (id_evento) references eventos(id_eventos),
	foreign key (id_complejo) references complejo_polideportivo(id_complejo_polideportivo)
);

-- create evento_complejo_deportivo 
CREATE TABLE evento_complejo_deportivo(
	id_evento_complejo int PRIMARY KEY,
	id_evento int,
	id_complejo int,
	foreign key (id_evento) references eventos(id_eventos),
	foreign key (id_complejo) references complejo_deportivo(id_complejo_deportivo)
);

-- se crea evento_comisario 
CREATE TABLE evento_comisario(
	id_evento_comisario int PRIMARY KEY,
	id_evento int,
	id_comisario int,
	foreign key (id_evento) references eventos(id_eventos),
	foreign key (id_comisario) references comisario(id_comisario)
);

-- se crea evento_equipo
CREATE TABLE evento_equipo(
	id_evento_equipo int PRIMARY KEY,
	id_evento int,
	id_equipamiento int,
	foreign key (id_evento) references eventos(id_eventos),
	foreign key (id_equipamiento) references equipamiento(id_equipamiento)
);

-- se crea sede 
CREATE TABLE sede(
	id_sede int PRIMARY KEY,
	nombre varchar(100),
	num_complejos 
);


CREATE TABLE sede_complejo_deportivo (
	id_sede int PRIMARY KEY,
	nombre varchar(100),
	id_complejo int,
	presupuesto float,
	foreign key (id_complejo) references complejo_deportivo(id_complejo_deportivo)
);

CREATE TABLE sede_complejo_polideportivo (
	id_sede int PRIMARY KEY,
	nombre varchar(100),
	id_complejo int,
	presupuesto float,
	foreign key (id_complejo) references complejo_polideportivo(id_complejo_polideportivo)
);


-- se realizan las inserciones 


INSERT INTO deportes VALUES
(1,'Natacion', 5),
(2,'Futbol', 25),
(3,'Microfutbol', 20),
(4,'Voleibol', 16),
(5,'Tennis', 2);


INSERT INTO jefes VALUES
(1,'Jose Hernandez','jh@gmail.com','Especialista en Natacion'),
(2,'Camila Perez','cp@gmail.com','Especialista en Voleibol'),
(3,'Ana Rojas','ar@gmail.com','Especialista en Futbool'),
(4,'Carlos Duarte','cd@gmail.com','Especialista en Tennis'),
(5,'Horacio Hernandez','hh@gmail.com','Especialista en Tennis');



INSERT INTO equipamiento VALUES
(1, 'Arcos',5),
(2, 'Pértigas',15),
(3, 'Barras Paralelas',10),
(4, 'Flotadores',35),
(5, 'Raquetas',5),
(6, 'Balones',17);


INSERT INTO comisario VALUES
(1, 'Diego Rojas','dr@hotmail.com','555-555-12345','juez'),
(2, 'Dracula Rosas','drR@hotmail.com','555-555-67895','juez'),
(3, 'Tomas suarez','ts@hotmail.com','555-555-35485','juez'),
(4, 'Lorena Martinez','lm@hotmail.com','444-555-12345','observador'),
(5, 'Rosa Martinez','Rm@hotmail.com','444-457-12345','observador'),
(6, 'Laura Bermudez','lBer@hotmail.com','444-856-12345','observador');


INSERT INTO info_complejo VALUES
(1, 'Bucaramanga', 5, 2),
(2, 'Giron', 14.2, 1),
(3, 'Floridablanca', 54, 5),
(4, 'Zapatoca', 65, 3),
(5, 'Lebrija', 48, 4),
(6, 'Sangil', 5, 2),
(7, 'Socorro', 14.2, 1),
(8, 'Soacha', 54, 5),
(9, 'Bogota', 65, 3),
(10, 'Chia', 48, 4);


INSERT INTO complejo_polideportivo VALUES
(1,'Complejo Deportivo Bucaramanga', 4,2),
(2,'Complejo Deportivo Sangil',2,6),
(3,'Complejo Deportivo Soacha', 4,8),
(4,'Complejo Deportivo Bucaramanga', 5,2),
(5,'Complejo Deportivo Sangil',3,6),
(6,'Complejo Deportivo Soacha', 1,8),
(7,'Complejo Deportivo Sangil',1,6),
(8,'Complejo Deportivo Soacha', 5,8);


INSERT INTO complejo_deportivo VALUES
(1,'Complejo Deportivo Giron', 1,2),
(2,'Complejo Deportivo Floridablanca',3,3),
(3,'Complejo Deportivo Zapatoca', 2,4);


INSERT INTO eventos VALUES
(1, 'Torneo de Tennis','2023-05-12 10:00:00', '01:30:00', 25),
(2, 'Torneo de Microfutbol','2023-11-20 10:00:00', '03:15:00', 75),
(3, 'Torneo de Voleibol','2023-06-02 09:00:00', '05:30:00', 25),
(4, 'Torneo de Natacion','2023-12-12 16:00:00', '02:45:00', 5),
(5, 'Torneo de Futbol','2024-01-04 10:00:00', '01:45:00', 85),
(6, 'Torneo de Futbol ninos','2024-01-04 14:00:00', '01:45:00', 85);

INSERT INTO evento_complejo_poli VALUES
(1,1,4),
(2,3,3),
(3,4,7),
(4,1,8);


INSERT INTO evento_complejo_deportivo VALUES
(1,2,1),
(2,2,2),
(4,5,3),
(5,2,3),
(6,6,3);


INSERT INTO evento_comisario VALUES
(1,1,1),
(2,3,5),
(3,4,3);

INSERT INTO evento_equipo VALUES
(1,3,6),
(2,1,5),
(3,4,4);

INSERT INTO sede_complejo_polideportivo VALUES
(1,'sede1',1,12.300),
(2,'sede2',5,150000.03),
(3,'sede3',4,34561.215);

INSERT INTO sede_complejo_deportivo VALUES
(1,'sede1',1,78.098);
