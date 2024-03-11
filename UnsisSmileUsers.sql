--Table pacientes
CREATE TABLE paciente (
    curp VARCHAR(20) UNIQUE PRIMARY KEY,
    nombre TEXT,
    apellido_paterno TEXT,
    apellido_materno TEXT,
    nivel_socioeconomico TEXT,
    fk_id_vivienda int,
    fk_id_tipo_sanguineo int,
    fk_id_discapacidad int,
    fk_id_grupo_etnico int,
    fk_id_religion int,
    FOREIGN KEY (fk_id_vivienda) REFERENCES vivienda (id_vivienda) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_tipo_sanguineo) REFERENCES tipo_sanguineo (id_tipo_sanguineo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_discapacidad) REFERENCES discapacidad (id_discapacidad) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_grupo_etnico) REFERENCES grupo_etnico (id_grupo_etnico) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_id_religion) REFERENCES religion (id_religion) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE Table domicilio(
    id_domicilio int auto_increment not null PRIMARY KEY,
    tipo ,
    calle TEXT,
    numero_ext TEXT,
    numero_int TEXT,
    fk_id_estado int,
    fk_id_municipio int,
    fk_id_localidad int,
    colonia TEXT,
    fk_id_codigo_postal int,
    telefono_1 VARCHAR(15),
    telefono_2 VARCHAR(15),
        FOREIGN KEY (fk_id_estado) REFERENCES estado (id_estado) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_id_municipio) REFERENCES municipio (id_municipio) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_id_localidad) REFERENCES localidad (id_localidad) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_id_codigo_postal) REFERENCES codigo_postal (id_codigo_postal) ON DELETE CASCADE ON UPDATE CASCADE
);

--Tabla Ususarios
CREATE Table usuarios(
    cedula VARCHAR(10) UNIQUE  PRIMARY KEY,
    curp VARCHAR(20),
    nombre  TEXT,
    apellido_paterno TEXT,
    apellido_materno TEXT,
    fk_id_especialidad INT,
    fk_id_sub_especialidad INT,
    fk_id_domicilio int,
    fk_id_clues INT,
    fk_id_rol INT,
        FOREIGN KEY (fk_id_especialidad) REFERENCES especialidad (id_especialidad) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_id_sub_especialidad) REFERENCES sub_especialidad (id_sub_especialidad) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_id_domicilio) REFERENCES domicilio (id_domicilio) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_id_clues) REFERENCES clues (id_clue) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_id_rol) REFERENCES roles (id_rol) ON DELETE CASCADE ON UPDATE CASCADE
    );

--tabla recetas
CREATE Table recetas(
    id_receta int PRIMARY  KEY,
    medico VARCHAR(50),--- pendiente a verificar la  relación
    medicamento TEXT,
    unidad_de_medida TEXT,
    dosis int,
    frecuencia TEXT,
    fk_id_via_de_administracion int,
    fecha_inicio  DATE,
    fecha_fin DATE,
        FOREIGN KEY (fk_id_via_de_administracion) REFERENCES via_de_administracion (id_via_de_administracion) ON DELETE CASCADE ON UPDATE CASCADE
);

--  tabla ordenes
CREATE  Table  ordenes(
    id_orden  int auto_increment PRIMARY KEY,
    fecha date,
    id_tipo INT,
    instrucciones_de_suministro TEXT,
    instrucciones_adicionales TEXT,
    medico VARCHAR(50),--- pendiente a verificar la  relación
    fk_id_paciente VARCHAR(20),
    destinatario VARCHAR(50),--- pendiente a verificar la  relación
    fk_id_medicamento INT,
    bool_consentimiento BOOLEAN,
    impresion_diagnostica TEXT,
    fecha_inicio date,
    fecha_entrega  date,
    fecha_termino date,
    fk_id_diagnostico INT,
    fk_id_cie9mc int,--verificar  se refiere a  tipo de procedimiento
    fk_id_estatus int,--estado de la orden
    fk_id_prioridad int,
        FOREIGN KEY (fk_id_paciente) REFERENCES pacientes (curp) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_id_medicamento) REFERENCES medicamentos (id_medicamento) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_id_diagnostico) REFERENCES diagnosticos (id_diagnostico) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_id_cie9mc) REFERENCES procedimientos (id_procedimiento) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_id_estatus) REFERENCES estatus (id_estatus) ON DELETE CASCADE ON UPDATE CASCADE
        FOREIGN KEY (fk_id_prioridad) REFERENCES prioridad (id_prioridad) ON DELETE CASCADE ON UPDATE CASCADE
);

-- tabla  auxiliar de  diaagnostico
CREATE TABLE auxiliar_de_diagnostico(
    id_auxiliar INT PRIMARY KEY,
    fk_id_tipo_de_estudio int,
    fk_id_diagnostico_relacionado INT,
    fk_id_urgencia INT,
    indicaciones TEXT,
    Foreign Key (fk_id_tipo_de_estudio) REFERENCES tipo_de_estudio(id_tipo_de_estudio) on delete CASCADE on update CASCADE,
    Foreign Key (fk_id_diagnostico_relacionado) REFERENCES diagnostico_relacionado(id_diagnostico_relacionado) on delete CASCADE on update CASCADE.BIGINT
    Foreign Key (fk_id_urgencia) REFERENCES urgencias(id_urgencia) on delete CASCADE on update CASCADE
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