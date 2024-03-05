-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS unsis_smile;

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS unsis_smile;

-- Usar la base de datos
USE unsis_smile;

-- crear tabla administradores
create table administradores(
id_administrador int not null auto_increment primary key,
nombre1 varchar(50),
nombre2 varchar(50),
apellido1 varchar(50),
apellido2 varchar(50),
curp varchar (20),
telefono varchar(10),
numero_trabajador varchar(15),
fecha_nacimiento date,
sexo char, -- utilizar un check para validar si es f, m u otro,
email_admin varchar (100) not NULL,
estatus boolean default true,
fk_usuario int,
foreign key (fk_usuario) references usuarios(id_usuario)
);

-- Crear la tabla Direccion
CREATE TABLE
    direcciones (
        id_direccion BIGINT AUTO_INCREMENT PRIMARY KEY,
        calle VARCHAR(100),
        colonia VARCHAR(100)
    );

-- Crear la tabla Responsables
CREATE TABLE
    Responsables (
        id_responsable BIGINT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50),
        apellido VARCHAR(50),
        telefono VARCHAR(20) UNIQUE,
        correo_electronico VARCHAR(50)
    );

-- Crear la tabla Sexo
CREATE TABLE
    sexos (
        id_sexo BIGINT PRIMARY KEY,
        sexo VARCHAR(100) UNIQUE
    );

-- Crear la tabla Estado_civil
CREATE TABLE
    Estado_civil (
        id_edo_civil BIGINT PRIMARY KEY,
        edo_civil VARCHAR(100) UNIQUE
    );

-- Crear la tabla Ocupacion
CREATE TABLE
    ocupaciones (
        id_ocupacion BIGINT PRIMARY KEY,
        ocupacion VARCHAR(100) UNIQUE
    );

CREATE TABLE
    grupos_etnico (
        id_grupo_etinico BIGINT PRIMARY KEY,
        grupo_etnico VARCHAR(100) UNIQUE
    );

CREATE TABLE
    religiones (
        id_religion BIGINT PRIMARY KEY,
        religion VARCHAR(100) UNIQUE
    );

CREATE TABLE
    nacionalidades (
        id_nacionalidad BIGINT PRIMARY KEY,
        nacionalidad VARCHAR(100) UNIQUE
    );

CREATE TABLE
    signos_vitales (
        id_signos_vitales INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        peso FLOAT,
        estatura FLOAT,
        temperatura FLOAT,
        frecuencia_cardiaca FLOAT,
        frecuencia_respiratoria FLOAT,
        presion_arterial FLOAT,
        saturacion_oxigeno FLOAT,
        glucosa FLOAT,
        pulso FLOAT
    );

-- Crear la tabla Pacientes
CREATE TABLE
    Pacientes (
        id_paciente BIGINT AUTO_INCREMENT PRIMARY KEY,
        primer_nombre VARCHAR(50),
        segundo_nombre VARCHAR(50),
        primer_apellido VARCHAR(50),
        segundo_apellido VARCHAR(50),
        fecha_nacimiento DATE,
        correo_electronico VARCHAR(200),
        FK_direccion BIGINT,
        FK_sexo BIGINT,
        FK_edo_civil BIGINT,
        FK_ocupacion BIGINT,
        fk_grupo_etnico BIGINT,
        FK_religion BIGINT,
        FK_nacionalidad BIGINT,
        fecha_Ingreso DATE,
        telefono VARCHAR(20),
        es_menor BOOLEAN,
        FK_Responsable BIGINT,
        discapacidad BOOLEAN,
        FOREIGN KEY (FK_direccion) REFERENCES direcciones (id_direccion) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (FK_sexo) REFERENCES sexos (id_sexo),
        FOREIGN KEY (FK_edo_civil) REFERENCES Estado_civil (id_edo_civil),
        FOREIGN KEY (FK_ocupacion) REFERENCES ocupaciones (id_ocupacion),
        FOREIGN KEY (fk_grupo_etnico) REFERENCES grupos_etnico (id_grupo_etinico),
        FOREIGN KEY (FK_religion) REFERENCES religiones (id_religion),
        FOREIGN KEY (FK_nacionalidad) REFERENCES nacionalidades (id_nacionalidad),
        FOREIGN KEY (FK_Responsable) REFERENCES Responsables (id_responsable) ON DELETE CASCADE ON UPDATE CASCADE
    );

-- INICIO DE ESQUEMAS DE HISTORIA CLINICA GENERAL
CREATE TABLE
    perfil_facial (
        id_perfil_facial INT AUTO_INCREMENT PRIMARY KEY,
        perfil_facial VARCHAR(50)
    );

CREATE TABLE
    frente_facial (
        id_frente_facial INT AUTO_INCREMENT PRIMARY KEY,
        frente_facial VARCHAR(50)
    );

-- Crear la tabla Examen Facial
CREATE TABLE
    examen_facial (
        id_examen_facial BIGINT PRIMARY KEY AUTO_INCREMENT,
        fk_perfil INT,
        fk_frente INT,
        senias_particulares TEXT,
        FOREIGN KEY (fk_perfil) REFERENCES perfil_facial (id_perfil_facial),
        FOREIGN KEY (fk_frente) REFERENCES frente_facial (id_frente_facial)
    );

CREATE TABLE
    PreguntasAntecedentesHeredofamiliares (
        id_pregunta BIGINT AUTO_INCREMENT PRIMARY KEY,
        pregunta ENUM (
            'Neoplasia (Cáncer)',
            'Diabetes',
            'Hipertensión Arterial',
            'Padecimientos mentales/neurológicos',
            'Obesidad',
            'Padecimientos hematológicos',
            'Malformaciones congénitas',
            'Problemas cardiacos'
        ) NOT NULL
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

CREATE TABLE
    AntecedentesHeredofamiliares (
        id_antecedentes_heredofamiliares BIGINT PRIMARY KEY AUTO_INCREMENT,
        fk_pregunta BIGINT,
        respuesta_principal ENUM ('si', 'no') NOT NULL,
        detalle_respuesta TEXT,
        FOREIGN KEY (fk_pregunta) REFERENCES PreguntasAntecedentesHeredofamiliares (id_pregunta) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    material_vivienda (
        material_vivienda_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
        material VARCHAR(100) UNIQUE
    );

CREATE TABLE
    AP_no_patologicos (
        id_ap_no_patologicos BIGINT PRIMARY KEY AUTO_INCREMENT,
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
        fk_material_vivienda BIGINT,
        FOREIGN KEY (fk_material_vivienda) REFERENCES material_vivienda (material_vivienda_ID) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    PreguntasCerradasAPPatologicos (
        id_preguntaCerrada BIGINT AUTO_INCREMENT PRIMARY KEY,
        pregunta ENUM (
            'Tabaquismo',
            'Alcoholismo',
            'Otras sustancias psicoactivas o recreativas',
            'Perforaciones (Aretes, en mujeres además de los 2 aretes en cada oreja)',
            'Tatuajes',
            'Neoplasia (Cáncer)',
            'Diabetes',
            'Obesidad diagnosticada',
            'Padecimientos hematológicos/hemorrágicos/anemia/leucemia',
            'Malformaciones congénitas/Síndromes',
            'Problemas cardiacos/angina de pecho/infarto/tromboembolia/marcapasos/bypass',
            'Radioterapia/Quimioterapia',
            'Padecimientos reumatológicos/artritis/osteoporosis',
            'Enfermedades del riñón',
            'Enfermedades hepáticas/Hepatitis',
            'Enfermedades de transmisión sexual',
            'Hipertiroidismo/Hipotiroidismo',
            'Enfermedades de vías aéreas/asma',
            'Problemas oculares',
            'Enfermedades digestivas',
            'Tuberculosis o vive con persona(s) con este padecimiento',
            'Enfermedades de la piel',
            'Trasplantes de órganos',
            'Hipertensión Arterial',
            'Padecimientos mentales/convulsiones/desmayos/migraña/neuralgia'
        ) NOT NULL
    );

INSERT INTO
    PreguntasCerradasAPPatologicos (pregunta)
VALUES
    ('Tabaquismo'),
    ('Alcoholismo'),
    ('Otras sustancias psicoactivas o recreativas'),
    (
        'Perforaciones (Aretes, en mujeres además de los 2 aretes en cada oreja)'
    ),
    ('Tatuajes'),
    ('Neoplasia (Cáncer)'),
    ('Diabetes'),
    ('Obesidad diagnosticada'),
    (
        'Padecimientos hematológicos/hemorrágicos/anemia/leucemia'
    ),
    ('Malformaciones congénitas/Síndromes'),
    (
        'Problemas cardiacos/angina de pecho/infarto/tromboembolia/marcapasos/bypass'
    ),
    ('Radioterapia/Quimioterapia'),
    (
        'Padecimientos reumatológicos/artritis/osteoporosis'
    ),
    ('Enfermedades del riñón'),
    ('Enfermedades hepáticas/Hepatitis'),
    ('Enfermedades de transmisión sexual'),
    ('Hipertiroidismo/Hipotiroidismo'),
    ('Enfermedades de vías aéreas/asma'),
    ('Problemas oculares'),
    ('Enfermedades digestivas'),
    (
        'Tuberculosis o vive con persona(s) con este padecimiento'
    ),
    ('Enfermedades de la piel'),
    ('Trasplantes de órganos'),
    ('Hipertensión Arterial'),
    (
        'Padecimientos mentales/convulsiones/desmayos/migraña/neuralgia'
    );

CREATE TABLE
    PreguntasAbiertasAPPatologicos (
        id_preguntaAbierta BIGINT AUTO_INCREMENT PRIMARY KEY,
        pregunta ENUM (
            '¿Has sido hospitalizado? (en mujeres también anotar datos de parto)',
            'Motivo de la hospitalización',
            '¿Ha tomado algún medicamento recientemente?',
            '¿Cuál es el motivo?',
            '¿Ha tenido algún problema con la anestesia dental o anestesia general?',
            '¿Cuál es el problema?',
            '¿Es alérgico/a a algún medicamento o sustancia?',
            '¿Cuál es la sustancia a la que es alérgico/a?',
            '(Solo para mujeres) ¿Está embarazada?',
            'Meses de embarazo'
        )
    );

INSERT INTO
    PreguntasAbiertasAPPatologicos (pregunta)
VALUES
    (
        '¿Has sido hospitalizado? (en mujeres también anotar datos de parto)'
    ),
    ('Motivo de la hospitalización'),
    ('¿Ha tomado algún medicamento recientemente?'),
    ('¿Cuál es el motivo?'),
    (
        '¿Ha tenido algún problema con la anestesia dental o anestesia general?'
    ),
    ('¿Cuál es el problema?'),
    ('¿Es alérgico/a a algún medicamento o sustancia?'),
    ('¿Cuál es la sustancia a la que es alérgico/a?'),
    ('(Solo para mujeres) ¿Está embarazada?'),
    ('Meses de embarazo');

-- Esquemas de odontogramas
CREATE TABLE
    odontograma (
        id_odontograma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        descripcion TEXT,
        fecha DATE
    );

CREATE TABLE
    codigo_pieza_dental (
        id_codigo_pieza_dental INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        codigo VARCHAR(3),
        adulto BOOLEAN
    );

CREATE TABLE
    estado_diente (
        id_estado_diente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        descripcion VARCHAR(50)
    );

CREATE TABLE
    region_diente (
        id_region INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        descripcion VARCHAR(50)
    );

CREATE TABLE
    diente_detalle (
        id_diente_detalle INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        fk_id_codigo_pieza_dental INT,
        fk_estado_diente INT,
        fk_region_diente INT,
        fk_odontograma INT,
        FOREIGN KEY (fk_id_codigo_pieza_dental) REFERENCES codigo_pieza_dental (id_codigo_pieza_dental),
        FOREIGN KEY (fk_estado_diente) REFERENCES estado_diente (id_estado_diente),
        FOREIGN KEY (fk_odontograma) REFERENCES odontograma (id_odontograma),
        FOREIGN KEY (fk_region_diente) REFERENCES region_diente (id_region)
    );

-- ** inicio tablas de periodontogrma (medicion de bolsas inicial)
-- tabla de periodontograma
create table
    periodontograma (
        id_periodontograma int not null auto_increment primary key,
        descripcion text,
        fecha date
    );

-- tabla que contiene la region (distal, mesial, etc)
create table
    regiones_diente_periodontograma ( -- entidad catalogo
        id_regiones_diente_periodontograma int not null auto_increment primary key,
        region varchar(2)
    );

-- esquema que contendra las regiones: vestibulares_superiores, palatinas, vestibulares_inferiores y linguales
CREATE TABLE
    regiones_medicion_bolsas ( -- entidad catalogo 
        id_regiones_medicion_bolsas int not null auto_increment primary key,
        region ENUM (
            'VESTIBULARES SUPERIORES',
            'PALATINAS',
            'VESTIBULARES INFERIORES',
            'LINGUALES'
        )
    );

INSERT INTO
    regiones_medicion_bolsas (region)
VALUES
    ('VESTIBULARES SUPERIORES'),
    ('PALATINAS'),
    ('VESTIBULARES INFERIORES'),
    ('LINGUALES');
    
create table
    medicion_bolsas_detalle ( -- tabla que contendra la medicion de bolsas de un diente en particular
        id_medicion_bolsas_detalle int not null auto_increment primary key,
        fk_regiones_diente_periodontograma int,
        fk_codigo_pieza_dental int,
        fk_regiones_medicion_bolsas int,
        fk_periodontograma int,
        medicion float,
        FOREIGN KEY (fk_regiones_diente_periodontograma) references regiones_diente_periodontograma (id_regiones_diente_periodontograma),
        FOREIGN KEY (fk_codigo_pieza_dental) references codigo_pieza_dental (id_codigo_pieza_dental),
        FOREIGN KEY (fk_regiones_medicion_bolsas) references regiones_medicion_bolsas (id_regiones_medicion_bolsas),
        FOREIGN KEY (fk_periodontograma) references periodontograma (id_periodontograma)
    );

-- fin tabla medicion de bolsas inicial
-- Crear la tabla Historias Clínicas
CREATE TABLE
    historias_clinicas (
        id_historia_clinica BIGINT PRIMARY KEY AUTO_INCREMENT,
        fk_paciente BIGINT,
        fk_examen_facial BIGINT,
        fk_antecedentes_heredofamiliares BIGINT,
        fk_ap_no_patologicos BIGINT,
        fk_odontograma_inicial INT,
        fk_odontograma_final INT,
        FOREIGN KEY (fk_examen_facial) REFERENCES examen_facial (id_examen_facial) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_antecedentes_heredofamiliares) REFERENCES AntecedentesHeredofamiliares (id_antecedentes_heredofamiliares) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_paciente) REFERENCES Pacientes (id_paciente) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_ap_no_patologicos) REFERENCES AP_no_patologicos (id_ap_no_patologicos) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_odontograma_inicial) REFERENCES odontograma (id_odontograma),
        FOREIGN KEY (fk_odontograma_final) REFERENCES odontograma (id_odontograma)
    );

-- Apartado para preguntas de antecedentes personales no patologicos
CREATE TABLE
    RespuestasCerradasNoPatologicos (
        id_respuestaCerradaNoPatologicos BIGINT AUTO_INCREMENT PRIMARY KEY,
        fk_preguntaCerradasID BIGINT,
        fk_historias_clinicas BIGINT,
        respuesta TEXT,
        FOREIGN KEY (fk_preguntaCerradasID) REFERENCES PreguntasCerradasAPPatologicos (id_preguntaCerrada) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_historias_clinicas) REFERENCES historias_clinicas (id_historia_clinica) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    RespuestasAbiertasNoPatologicos (
        id_respuestaAbiertaNoPatologicos BIGINT AUTO_INCREMENT PRIMARY KEY,
        fk_preguntaAbiertaID BIGINT,
        fk_historias_clinicas BIGINT,
        respuesta TEXT,
        FOREIGN KEY (fk_preguntaAbiertaID) REFERENCES PreguntasAbiertasAPPatologicos (id_preguntaAbierta) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_historias_clinicas) REFERENCES historias_clinicas (id_historia_clinica) ON DELETE CASCADE ON UPDATE CASCADE
    );

-- consulta
/**INCIO DE ESQUEMAS PARA CONSULTAS*/