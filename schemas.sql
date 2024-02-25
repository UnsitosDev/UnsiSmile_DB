-- Active: 1708882779654@@127.0.0.1@3306@clinica
-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS clinica;

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS clinica;

-- Usar la base de datos
USE clinica;

-- Crear la tabla Direccion
CREATE TABLE
    direcciones (
        direccionID BIGINT AUTO_INCREMENT PRIMARY KEY,
        calle VARCHAR(100),
        colonia VARCHAR(100)
    );

-- Crear la tabla Responsables
CREATE TABLE
    Responsables (
        responsableID BIGINT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50),
        apellido VARCHAR(50),
        telefono VARCHAR(20),
        correo_electronico VARCHAR(50)
    );

-- Crear la tabla Sexo
CREATE TABLE
    sexos (sexoID BIGINT PRIMARY KEY, sexo VARCHAR(100));

-- Crear la tabla Estado_civil
CREATE TABLE
    Estado_civil (
        edo_civilID BIGINT PRIMARY KEY,
        edo_civil VARCHAR(100)
    );

-- Crear la tabla Ocupacion
CREATE TABLE
    ocupaciones (
        ocupacionID BIGINT PRIMARY KEY,
        ocupacion VARCHAR(100)
    );

create table
    grupos_etnico (
        grupo_etinicoID BIGINT PRIMARY key,
        grupo_etnico VARCHAR(100)
    );

create table
    religiones (
        religionID BIGINT PRIMARY KEY,
        religion VARCHAR(100)
    );

create table
    nacionalidades (
        nacionalidadID BIGINT PRIMARY KEY,
        nacionalidad VARCHAR(100)
    );

create table
    signos_vitales (
        id_signos_vitales int not null auto_increment primary key,
        peso FLOAT,
        estatura FLOAT,
        temperatura FLOAT,
        frecuencia_cardiaca FLOAT,
        frecuencia_respiratoria FLOAT,
        pesion_arterial FLOAT,
        saturacion_oxigeno FLOAT,
        glucosa FLOAT,
        pulso FLOAT
    );

-- Crear la tabla Pacientes
CREATE TABLE
    Pacientes (
        pacienteID BIGINT AUTO_INCREMENT PRIMARY KEY,
        primer_nombre VARCHAR(50),
        segundo_nombre VARCHAR(50),
        primer_apellido VARCHAR(50),
        segundo_apellido VARCHAR(50),
        fecha_nacimiento DATE,
        correo_electronico VARCHAR(200),
        FK_DireccionID BIGINT,
        FK_sexo BIGINT,
        FK_edo_civil BIGINT,
        FK_ocupacion BIGINT,
        fk_grupo_etnico BIGINT,
        FK_religion BIGINT, -- Corregido
        FK_nacionalidad BIGINT, -- Corregido
        fecha_Ingreso DATE,
        telefono VARCHAR(20),
        es_menor BOOLEAN,
        FK_ResponsableID BIGINT,
        discapacidad BOOLEAN,
        FOREIGN KEY (FK_DireccionID) REFERENCES direcciones (direccionID) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (FK_sexo) REFERENCES sexos (sexoID),
        FOREIGN KEY (FK_edo_civil) REFERENCES Estado_civil (edo_civilID),
        FOREIGN KEY (FK_ocupacion) REFERENCES ocupaciones (ocupacionID),
        FOREIGN KEY (fk_grupo_etnico) REFERENCES grupos_etnico (grupo_etinicoID),
        FOREIGN KEY (FK_religion) REFERENCES religiones (religionID),
        FOREIGN KEY (FK_nacionalidad) REFERENCES nacionalidades (nacionalidadID),
        FOREIGN KEY (FK_ResponsableID) REFERENCES Responsables (responsableID) ON DELETE CASCADE ON UPDATE CASCADE
    );

/*INICIO DE ESQUEMAS DE HISTORIA CLINICA GENERAL*/
create table
    perfil_facial (
        perfil_facilaID int AUTO_INCREMENT PRIMARY key,
        perfil_facial VARCHAR(50)
    );

create table
    frente_facial (
        frente_facilaID int AUTO_INCREMENT PRIMARY key,
        frente_facial VARCHAR(50)
    );

-- Crear la tabla Examen Facial
CREATE TABLE
    examen_facial (
        id_examen_facial BIGINT PRIMARY KEY AUTO_INCREMENT,
        fk_perfil int,
        fk_frente int, -- Ajustar según tu modelo de datos
        senias_particulares TEXT,
        FOREIGN KEY (fk_perfil) REFERENCES perfil_facial (perfil_facilaID),
        FOREIGN KEY (fk_frente) REFERENCES frente_facial (frente_facilaID) -- Ajustar según tu modelo de datos
    );

CREATE TABLE
    PreguntasAntecedentesHeredofamiliares (
        preguntaID BIGINT AUTO_INCREMENT PRIMARY KEY,
        pregunta VARCHAR(255)
    );

INSERT INTO
    PreguntasAntecedentesHeredofamiliares (pregunta)
VALUES
    ('Neoplasia (Cáncer)'),
    ('Diabetes'),
    ('Hipertensión Arterial'),
    ('Padecimientos mentales/neurológicos'),
    ('Obesidad'),
    ('Padecimientos hematológicos'),
    ('Malformaciones congénitas'),
    ('Problemas cardiacos');

-- Crear la tabla Antecedentes Heredofamiliares
CREATE TABLE
    AntecedentesHeredofamiliares (
        Antecedentes_heredofamiliaresID BIGINT PRIMARY KEY AUTO_INCREMENT,
        preguntaID BIGINT,
        respuesta_principal ENUM ('si', 'no', 'ampliar') NOT NULL,
        detalle_respuesta TEXT,
        FOREIGN KEY (preguntaID) REFERENCES PreguntasAntecedentesHeredofamiliares (preguntaID) ON DELETE CASCADE ON UPDATE CASCADE
    );

-- Crear la tabla Material de Vivienda
CREATE TABLE
    material_vivienda (
        material_vivienda_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
        material VARCHAR(100)
    );

CREATE TABLE
    AP_no_patologicos (
        ap_no_patologicosID BIGINT PRIMARY KEY AUTO_INCREMENT,
        come_frutas_verduras BOOLEAN,
        come_carnes BOOLEAN,
        come_cereales BOOLEAN,
        come_alimentos_chatarra BOOLEAN,
        toma_agua_diario BOOLEAN,
        toma_refrescos BOOLEAN,
        horas_sueno_diarias INT,
        veces_se_bana_semana INT,
        veces_cepilla_dientes_dia INT,
        vivienda_con_piso BOOLEAN,
        fk_material_viviendaID BIGINT, -- Foreign key a material de vivienda
        FOREIGN KEY (fk_material_viviendaID) REFERENCES material_vivienda (material_vivienda_ID) ON DELETE CASCADE ON UPDATE CASCADE
    );

-- Crear la tabla Historias Clínicas
CREATE TABLE
    historias_clinicas (
        historia_clinicaID BIGINT PRIMARY KEY AUTO_INCREMENT,
        fk_paciente BIGINT,
        fk_examen_facial BIGINT,
        fk_antecedentes_heredofamiliares BIGINT,
        fk_ap_no_patologicosID BIGINT, -- Foreign key a antecedentes personales no patologicos
        FOREIGN KEY (fk_examen_facial) REFERENCES examen_facial (id_examen_facial) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_antecedentes_heredofamiliares) REFERENCES AntecedentesHeredofamiliares (Antecedentes_heredofamiliaresID) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_paciente) REFERENCES Pacientes (pacienteID) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_ap_no_patologicosID) REFERENCES AP_no_patologicos (ap_no_patologicosID) ON DELETE CASCADE ON UPDATE CASCADE
    );




/**INCIO DE ESQUEMAS PARA CONSULTAS*/