--Table pacientes
CREATE TABLE pacientes (
    curp VARCHAR(20) UNIQUE PRIMARY KEY,
    nombre TEXT,
    apellido_paterno TEXT,
    apellido_materno TEXT,
    nivel_socioeconomico TEXT,
    telefono_1 VARCHAR(15),
    telefono_2 VARCHAR(15),
    fk_tipo_sanguineo int,
    fk_discapacidad int,
    fk_grupo_etnico int,
    fk_religion int,
    fk_domicilio int,
    FOREIGN KEY (fk_tipo_sanguineo) REFERENCES tipo_sanguineo (id_tipo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_discapacidad) REFERENCES discapacidades (id_discapacidad) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_grupo_etnico) REFERENCES grupo_etnico (id_grupo_etnico) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_religion) REFERENCES religiones (id_religion) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_domicilio) REFERENCES domicilios (id_domicilio) ON DELETE CASCADE ON UPDATE CASCADE);


CREATE Table domicilios(
    id_domicilio int auto_increment not null PRIMARY KEY,
    numero_ext TEXT,
    numero_int TEXT,
    fk_vivienda VARCHAR(2),
    fk_localidad int,
    fk_colonias_has_calles  int,
        FOREIGN KEY (fk_vivienda) REFERENCES viviendas (id_vivienda) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_localidad) REFERENCES localidades (id_localidad) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_colonias_has_calles) REFERENCES colonias_has_calles (id_colonias_has_calles) ON DELETE CASCADE ON UPDATE CASCADE
);

--Tabla Ususarios
CREATE Table usuarios(
    cedula VARCHAR(10) UNIQUE  PRIMARY KEY,
    curp VARCHAR(20),
    nombre  TEXT,
    apellido_paterno TEXT,
    apellido_materno TEXT,
    fk_especialidad INT,
    fk_sub_especialidad INT,
    fk_domicilio int,
    fk_clues INT,
    fk_rol INT,
        FOREIGN KEY (fk_especialidad) REFERENCES especialidad (id_especialidad) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_sub_especialidad) REFERENCES sub_especialidad (id_sub_especialidad) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_domicilio) REFERENCES domicilio (id_domicilio) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_clues) REFERENCES clues (id_clue) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_rol) REFERENCES roles (id_rol) ON DELETE CASCADE ON UPDATE CASCADE
    );

--tabla recetas
CREATE Table recetas(
    id_receta int PRIMARY  KEY,
    medico VARCHAR(50),--- pendiente a verificar la  relación
    medicamento TEXT,
    unidad_de_medida TEXT,
    dosis int,
    frecuencia TEXT,
    fk_via_de_administracion int,
    fecha_inicio  DATE,
    fecha_fin DATE,
        FOREIGN KEY (fk_via_de_administracion) REFERENCES via_de_administracion (id_via_de_administracion) ON DELETE CASCADE ON UPDATE CASCADE
);

--  tabla ordenes
CREATE  Table  ordenes(
    id_orden  int auto_increment PRIMARY KEY,
    fecha date,
    id_tipo INT,
    instrucciones_de_suministro TEXT,
    instrucciones_adicionales TEXT,
    medico VARCHAR(50),--- pendiente a verificar la  relación
    fk_paciente VARCHAR(20),
    destinatario VARCHAR(50),--- pendiente a verificar la  relación
    fk_medicamento INT,
    bool_consentimiento BOOLEAN,
    impresion_diagnostica TEXT,
    fecha_inicio date,
    fecha_entrega  date,
    fecha_termino date,
    fk_diagnostico INT,
    fk_cie9mc int,--verificar  se refiere a  tipo de procedimiento
    fk_estatus int,--estado de la orden
    fk_prioridad int,
        FOREIGN KEY (fk_paciente) REFERENCES pacientes (curp) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_medicamento) REFERENCES medicamentos (id_medicamento) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_diagnostico) REFERENCES diagnosticos (id_diagnostico) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_cie9mc) REFERENCES procedimientos (id_procedimiento) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_estatus) REFERENCES estatus (id_estatus) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_prioridad) REFERENCES prioridad (id_prioridad) ON DELETE CASCADE ON UPDATE CASCADE
);

-- tabla  auxiliar de  diaagnostico
CREATE TABLE auxiliar_de_diagnostico(
    id_auxiliar INT PRIMARY KEY,
    fk_tipo_de_estudio int,
    fk_diagnostico_relacionado INT,
    fk_urgencia INT,
    indicaciones TEXT,
    Foreign Key (fk_tipo_de_estudio) REFERENCES tipo_de_estudio(id_tipo_de_estudio) on delete CASCADE on update CASCADE,
    Foreign Key (fk_diagnostico_relacionado) REFERENCES diagnostico_relacionado(id_diagnostico_relacionado) on delete CASCADE on update CASCADE.BIGINT
    Foreign Key (fk_urgencia) REFERENCES urgencias(id_urgencia) on delete CASCADE on update CASCADE
);

create TABLE banco_de_sangre(
    fk_tipo_de_sangre int,
    identificador_producto int,
    cantidad int,
    fk_unidades int,
    seguimiento TEXT,
    tiempo_de_administracion TEXT,
        Foreign Key (fk_tipo_de_sangre) REFERENCES tipo_de_sangre(id_tipo_de_sangre) on delete CASCADE on update CASCADE,
        Foreign Key (fk_unidades) REFERENCES unidades(id_unidades) on delete CASCADE on update CASCADE
);

-- Tabla alergias
create table alergias (
    fk_reacciones_alergicas int,
    descripcion TEXT,
    fk_medicamento int,
    fecha_deteccion DATE,
        Foreign Key (fk_reacciones_alergicas) REFERENCES reacciones_alergicas(id_reacciones_alergicas) on delete CASCADE on update CASCADE,
        Foreign Key (fk_medicamento) REFERENCES medicamentos(id_medicamento) on delete CASCADE on update CASCADE
);

-- Tabla documento externo
create table documento_externo(
    clave_documento int not null PRIMARY key,
    nombre_documento TEXT,
    fuente TEXT,
    fecha_creacion date,
    fk_paciente int,
        Foreign Key (fk_paciente) REFERENCES pacientes(curp) on delete CASCADE on update CASCADE
);

-- Tabla alerta sanitaria
create table alerta_sanitaria(
    fk_tipo_de_riesgo int,
    fk_prioridad int,
    acciones_aplicables TEXT,
    factores_de_riesgo TEXT,
    edad_minima int,
    edad_maxima int,
    fk_sexo int,
    fk_estado int,
    fk_municipio int,
    fk_localidad int,
    tiempo_notificacion TEXT,
        Foreign Key (fk_tipo_de_riesgo) REFERENCES tipo_de_riesgo(id_tipo_de_riesgo) on delete CASCADE on update CASCADE,
        Foreign Key (fk_prioridad) REFERENCES prioridad(id_prioridad) on delete CASCADE on update CASCADE,
        Foreign Key (fk_sexo) REFERENCES sexo(id_sexo) on delete CASCADE on update CASCADE,
        Foreign Key (fk_estado) REFERENCES estados(id_estado) on delete CASCADE on update CASCADE,
        Foreign Key (fk_municipio) REFERENCES municipios(id_municipio) on delete CASCADE on update CASCADE,
        Foreign Key (fk_localidad) REFERENCES localidades(id_localidad) on delete CASCADE on update CASCADE
);

-- tabla casos notificables
create table casos_notificables(
    fk_medico int,
    fk_paciente VARCHAR(20),
    resumen_clinico TEXT,
    descripcion_de_acciones TEXT,
    fk_riesgos_identificados int,
        Foreign Key (fk_medico) REFERENCES medicos(id_medico) on delete CASCADE on update CASCADE,
        Foreign Key (fk_paciente) REFERENCES pacientes(curp) on delete CASCADE on update CASCADE,
        Foreign Key (fk_riesgos_identificados) REFERENCES riesgos_identificados(id_riesgo) on delete CASCADE on update CASCADE
);

-- Tabla guías clinicas
create table guias_clinicas(
    clave_guia int not null PRIMARY key,
    fecha_aplicacion date,
    nombre_guia TEXT,
    fk_diagnostico_relacionado int,
    fk_procedimiento_relacionado int,
    descripcion TEXT,
    edad_minima int,
    edad_maxima int,
    fk_sexo int,
        Foreign Key (fk_diagnostico_relacionado) REFERENCES diagnostico_relacionado(id_diagnostico) on delete CASCADE on update CASCADE,
        Foreign Key (fk_procedimiento_relacionado) REFERENCES procedimiento_relacionado(id_procedimiento) on delete CASCADE on update CASCADE,
        Foreign Key (fk_sexo) REFERENCES sexo(id_sexo) on delete CASCADE on update CASCADE

);


-- tabla catalogo  de vivienda
create  table viviendas(
    id_vivienda VARCHAR(2) PRIMARY key,
    categoria TEXT
);

-- tabla catalogo  de tipo sanguineo
create  table tipo_sanguineo(
    id_tipo INT PRIMARY KEY,
    tipo VARCHAR(3) NOT NULL
);

CREATE TABLE compatibilidad_sanguinea (
    fk_tipo int,
    fk_tipo_compatible int,
    FOREIGN KEY (fk_tipo) REFERENCES tipo_sanguineo(id_tipo),
    FOREIGN KEY (fk_tipo_compatible) REFERENCES tipo_sanguineo(id_tipo),
    PRIMARY KEY (fk_tipo, fk_tipo_compatible)
);

create  table discapacidades(
    id_discapacidad INT PRIMARY KEY,
    tipo TEXT
);

CREATE TABLE grupos_etnicos (
    id_grupo INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE religiones (
    id_religion varchar(6) PRIMARY KEY,
    religion VARCHAR(100) NOT NULL
);

CREATE TABLE estados (
    id_estado varchar(2) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE municipios (
    id_municipio varchar(2) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fk_estado varchar(2),
        FOREIGN KEY (fk_estado) REFERENCES estados (id_estado) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE localidades (
    id_localidad varchar(2) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fk_municipio varchar(2),
    fk_codigo_postal int,
        FOREIGN KEY (fk_municipio) REFERENCES municipios (id_municipio) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_codigo_postal) REFERENCES codigo_postal (id_codigo_postal) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE colonias (
    id_colonia int PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE calles (
    id_calle int PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE colonias_has_calles (
    id_colonias_has_calles int PRIMARY key,
    fk_colonia int not null,
    fk_calle int NOT NULL,
        FOREIGN KEY (fk_colonia) REFERENCES colonias (id_colonia) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_calle) REFERENCES calles (id_calle) ON DELETE CASCADE ON UPDATE CASCADE
);




-- Crear la tabla Responsables
CREATE TABLE Responsables (
    id_responsable BIGINT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(50), apellido VARCHAR(50), telefono VARCHAR(20) UNIQUE, correo_electronico VARCHAR(50)
);

-- Crear la tabla Sexo
CREATE TABLE sexos (
    id_sexo BIGINT PRIMARY KEY, sexo VARCHAR(100) UNIQUE
);

-- Crear la tabla Estado_civil
CREATE TABLE Estado_civil (
    id_edo_civil BIGINT PRIMARY KEY, edo_civil VARCHAR(100) UNIQUE
);

-- Crear la tabla Ocupacion
CREATE TABLE ocupaciones (
    id_ocupacion BIGINT PRIMARY KEY, ocupacion VARCHAR(100) UNIQUE
);

CREATE TABLE grupos_etnico (
    id_grupo_etinico BIGINT PRIMARY KEY, grupo_etnico VARCHAR(100) UNIQUE
);

CREATE TABLE religiones (
    id_religion BIGINT PRIMARY KEY, religion VARCHAR(100) UNIQUE
);

CREATE TABLE nacionalidades (
    id_nacionalidad BIGINT PRIMARY KEY, nacionalidad VARCHAR(100) UNIQUE
);

CREATE TABLE signos_vitales (
    id_signos_vitales INT NOT NULL AUTO_INCREMENT PRIMARY KEY, peso FLOAT, estatura FLOAT, temperatura FLOAT, frecuencia_cardiaca FLOAT, frecuencia_respiratoria FLOAT, presion_arterial FLOAT, saturacion_oxigeno FLOAT, glucosa FLOAT, pulso FLOAT
);

-- Crear la tabla Pacientes
CREATE TABLE Pacientes (
    id_paciente BIGINT AUTO_INCREMENT PRIMARY KEY, primer_nombre VARCHAR(50), segundo_nombre VARCHAR(50), primer_apellido VARCHAR(50), segundo_apellido VARCHAR(50), fecha_nacimiento DATE, correo_electronico VARCHAR(200), FK_direccion BIGINT, FK_sexo BIGINT, FK_edo_civil BIGINT, FK_ocupacion BIGINT, fk_grupo_etnico BIGINT, FK_religion BIGINT, FK_nacionalidad BIGINT, fecha_Ingreso DATE, telefono VARCHAR(20), es_menor BOOLEAN, FK_Responsable BIGINT, discapacidad BOOLEAN, FOREIGN KEY (FK_direccion) REFERENCES direcciones (id_direccion) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (FK_sexo) REFERENCES sexos (id_sexo), FOREIGN KEY (FK_edo_civil) REFERENCES Estado_civil (id_edo_civil), FOREIGN KEY (FK_ocupacion) REFERENCES ocupaciones (id_ocupacion), FOREIGN KEY (fk_grupo_etnico) REFERENCES grupos_etnico (id_grupo_etinico), FOREIGN KEY (FK_religion) REFERENCES religiones (id_religion), FOREIGN KEY (FK_nacionalidad) REFERENCES nacionalidades (id_nacionalidad), FOREIGN KEY (FK_Responsable) REFERENCES Responsables (id_responsable) ON DELETE CASCADE ON UPDATE CASCADE
);

-- administradores, profesores, estudiantes