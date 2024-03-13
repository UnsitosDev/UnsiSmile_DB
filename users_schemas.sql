-- drop database unsis_smile;
drop database if exists usuarios_unsis_smile;

create database usuarios_unsis_smile;

use usuarios_unsis_smile;

-- ******************************************** ESQUEMAS PARA LOS USUARIOS (LOGUEO) *******************************
-- Tabla tipos de roles
CREATE TABLE
    roles_tipos_usuario (
        id_rol INT auto_increment PRIMARY KEY,
        nombre_rol VARCHAR(50) NOT NULL
    );

-- Tabla usuario
CREATE TABLE
    usuarios (
        id_usuario INT auto_increment PRIMARY KEY,
        nombre_usuario VARCHAR(20) NOT NULL,
        pass_usuario VARCHAR(15) NOT NULL,
        fk_id_rol int NOT NULL,
        estatus boolean default true,
        foreign key (fk_id_rol) references roles_tipos_usuario (id_rol)
    );

-- ************************************ ESQUEMAS PARA LOS GRUPOS **************************************************
create table
    carreras (
        id_carrera varchar (2) PRIMARY KEY,
        carrera varchar(100),
    );

create table
    grupos (
        id_grupo int auto_increment primary key,
        grupo varchar(100),
        fk_carrera int,
        foreign key (fk_carrera) references carreras (id_carrera)
    );

create table
    ciclos (
        id_ciclo int AUTO_INCREMENT PRIMARY KEY,
        ciclo varchar(100),
        estatus BOOLEAN DEFAULT true
    );

-- ******************************************** ESQUEMAS DE USUARIOS DE LA APLICACION (usuarios finales)*******************************
-- tablas administradores de clinica
create table
    personas (
        id_persona int AUTO_INCREMENT PRIMARY key,
        nombre1 varchar(50),
        nombre2 varchar(50),
        apellido1 varchar(50),
        apellido2 varchar(50),
        curp varchar(20),
        telefono varchar(10),
        fecha_nacimiento date,
        correo varchar(200),
        fk_sexo int,
            Foreign Key (fk_sexo) REFERENCES sexo(id_sexo) on delete CASCADE on update CASCADE

    );

create table
    administradores (
        id_administrador int not null auto_increment primary key,
        numero_trabajador varchar(15),
        -- email_admin varchar(100) not NULL, --SE  QUITÓ DE AQUÍ PORQUE PERSONA YA GUARDA UN CORREO
        fk_persona int,
        fk_usuario int,
        foreign key (fk_persona) references personas (id_persona),
        foreign key (fk_usuario) references usuarios (id_usuario)
    );

-- ************************datos de personal de salud***********************************
create table
    catedraticos (
        id_catedratico int not null auto_increment primary key,
        numero_trabajador varchar(15),
        -- email_catedratico varchar(100) not NULL,--SE  QUITÓ DE AQUÍ PORQUE PERSONA YA GUARDA UN CORREO
        fk_usuario int,
        fk_persona int,
        foreign key (fk_persona) references personas (id_persona),
        fk_id_usuario int not null,
        FOREIGN KEY (fk_id_usuario) references usuarios (id_usuario)
    );

create table
    semestres (
        id_semestre int AUTO_INCREMENT PRIMARY KEY,
        fk_grupo int,
        fk_ciclo int,
        foreign key (fk_grupo) references grupos (id_grupo),
        foreign key (fk_ciclo) references ciclos (id_ciclo)
    );

create table
    catedratico_grupo (
        id_catedratico_semestre_grupo int not null auto_increment primary key,
        fk_catedratico int,
        fk_semestre int,
        FOREIGN KEY (fk_catedratico) references catedraticos (id_catedratico),
        FOREIGN KEY (fk_semestre) references semestres (id_semestre)
    );

create table
    alumnos (
        id_alumno int not null auto_increment primary key,
        fk_id_semestre_grupo int,
        matricula varchar(10),
        fk_usuario int,
        fk_persona int,
        foreign key (fk_persona) references personas (id_persona),
        FOREIGN KEY (fk_usuario) references usuarios (id_usuario)
    );

create table
    alumno_semestre (
        id_alumno_semestre int,
        fk_alumno int,
        fk_semestre int,
        FOREIGN KEY (fk_alumno) references alumnos (id_alumno),
        FOREIGN KEY (fk_semestre) references semestres (id_semestre)
    );