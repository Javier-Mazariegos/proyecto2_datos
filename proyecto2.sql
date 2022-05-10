create table EQUIPOS 
(equipo_id VARCHAR(3) CONSTRAINT equipo_id_pk PRIMARY KEY,
país VARCHAR(50) NOT NULL,
grupo CHAR(1) NOT NULL,
ranking INTEGER);	

create table SEDES
(sede_id VARCHAR2(15) CONSTRAINT sede_id_pk primary key, 
ciudad VARCHAR2(40) NOT NULL, 
nombre_sede VARCHAR2(100) NOT NULL);

create table ARBITROS
(arbitro_id VARCHAR2(15) CONSTRAINT arbitro_id_pk primary key, 
nombre VARCHAR2(100) NOT NULL, 
nacionalidad VARCHAR2(100) NOT NULL,
funcion CHAR(1) NOT NULL);

create table MIEMBROS
(miembro_id VARCHAR(20) CONSTRAINT miembro_id_pk primary key,
nombre VARCHAR(100) NOT NULL,
fecha_de_nacimiento DATE  NOT NULL, 
posición_habitual VARCHAR2(100) NOT NULL, 
tipo VARCHAR(3) NOT NULL, 
club VARCHAR(30),
goles INTEGER,
id_equipo VARCHAR(3) CONSTRAINT miem_equipo_id_fk REFERENCES EQUIPOS(equipo_id));

create table PARTIDOS
(id_partido INTEGER CONSTRAINT partido_id_pk primary key,
fecha_hora TIMESTAMP  NOT NULL, 
sede_id VARCHAR2(100) CONSTRAINT partido_sede_id_fk REFERENCES SEDES(sede_id),
equi_loc_id VARCHAR(3) CONSTRAINT partido_equi_loc_id_fk REFERENCES EQUIPOS(equipo_id),
equi_vis_id VARCHAR(3) CONSTRAINT partido_equi_vis_id_fk REFERENCES EQUIPOS(equipo_id));

create table MIEMBROS_FEDERACION
(federativo_id VARCHAR2(100) CONSTRAINT federativo_id_pk primary key, 
nombre VARCHAR2(100) NOT NULL, 
teléfono INTEGER NOT NULL);

create table LABORATORIOS
(lab_id VARCHAR2(100) CONSTRAINT lab_id_pk primary key, 
nombre VARCHAR2(100) NOT NULL,
dirección VARCHAR2(400) NOT NULL, 
teléfono INTEGER NOT NULL);

create table PARTIDOS_JUGADOS			
(fecha_y_hora TIMESTAMP NOT NULL,			
gol_local INTEGER NOT NULL,			
gol_visitante INTEGER NOT NULL,			
resultado INTEGER NOT NULL,			
espectadores INTEGER NOT NULL,			
 amonestaciones INTEGER NOT NULL,			
expulsiones INTEGER NOT NULL, 			
id_partido NOT NULL CONSTRAINT partidos_juagos_id_partido_FK REFERENCES partidos(id_partido),			
id_arbitro1 NOT NULL CONSTRAINT arbitros_id_arbitro1_FK REFERENCES arbitros(arbitro_id),			
id_arbitro2 NOT NULL CONSTRAINT arbitros_id_arbitro2_FK REFERENCES arbitros(arbitro_id),			
id_arbitro3 CONSTRAINT arbitros_id_arbitro3_FK REFERENCES arbitros(arbitro_id),			
id_arbitro4 CONSTRAINT arbitros_id_arbitro4_FK REFERENCES arbitros(arbitro_id),			
CONSTRAINT partido_PK PRIMARY KEY (id_partido));			

create table PARTICIPANTES 
(posicion_jugada VARCHAR2(50) NOT NULL,
minutos_jugados INTEGER NOT NULL,
resultado_muestra VARCHAR(15), 
id_miembro VARCHAR(20) CONSTRAINT id_miembro_fk REFERENCES MIEMBROS(miembro_id),
id_partido INTEGER CONSTRAINT id_partido_fk REFERENCES PARTIDOS(id_partido),
federativo_id VARCHAR2(100) CONSTRAINT federativo_id_fk REFERENCES MIEMBROS_FEDERACION(federativo_id),
lab_id VARCHAR2(100) CONSTRAINT lab_id_fk REFERENCES LABORATORIOS(lab_id),CONSTRAINT miembro_partido_PK PRIMARY KEY (id_miembro,id_partido) );

create table SUSTITUCIONES
(id_sustitucion INTEGER CONSTRAINT id_sustitucion_pk primary key,
minuto_sustitucion INTEGER NOT NULL,
id_partido NOT NULL CONSTRAINT sustitucion_id_partido_FK REFERENCES PARTIDOS(id_partido),
id_entrante VARCHAR(20) CONSTRAINT sustitucion_id_entrante_fk REFERENCES MIEMBROS(miembro_id),
id_saliente VARCHAR(20) CONSTRAINT sustitucion_id_saliente_fk REFERENCES MIEMBROS(miembro_id),
id_partido_null CONSTRAINT sustitucion_id_partido_null_FK REFERENCES PARTIDOS(id_partido));

create table HISTORIAL_GOLES
(id_gol INTEGER ,
tiempo_gol INTEGER NOT NULL,
id_miembro VARCHAR(20) CONSTRAINT historial_id_miembro_fk REFERENCES MIEMBROS(miembro_id),
id_partido INTEGER NOT NULL CONSTRAINT historial_id_partido_FK REFERENCES PARTIDOS(id_partido),
CONSTRAINT miembro_partido_historial_PK PRIMARY KEY (id_gol, id_miembro, id_partido));












			
		



