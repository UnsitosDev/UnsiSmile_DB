-- drop database ejemplo;
create database if not exists ejemplo;
use ejemplo;

CREATE TABLE Pacientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    expediente BIGINT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE catalogo_historias_clinicas (
    id_catalogo_historia_clinica INT PRIMARY KEY AUTO_INCREMENT,
    historia_linicas VARCHAR(100) NOT NULL
);


CREATE TABLE secciones_formularios (
    id_seccion_formulario INT PRIMARY KEY AUTO_INCREMENT,
    formulario VARCHAR(100) NOT NULL
);

CREATE TABLE secciones_historias_clinicas (
    fk_catalogo_historia_clinica INT NOT NULL,
    fk_seccion_formulario INT NOT NULL,
    PRIMARY KEY (fk_catalogo_historia_clinica, fk_seccion_formulario),
    FOREIGN KEY (fk_catalogo_historia_clinica) REFERENCES catalogo_historias_clinicas(id_catalogo_historia_clinica),
    FOREIGN KEY (fk_seccion_formulario) REFERENCES secciones_formularios(id_seccion_formulario)
);

CREATE TABLE preguntas (
    id_pregunta INT PRIMARY KEY AUTO_INCREMENT,
    pregunta_texto TEXT NOT NULL,
    fk_seccion_formulario INT NOT NULL,
    FOREIGN KEY (seccion_id) REFERENCES secciones_formularios(fk_seccion_formulario)
);

CREATE TABLE catalogos (
    id_catalogo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_catalogo VARCHAR(50) NOT NULL
);

CREATE TABLE opciones_catalogos (
    id_opcion_catalogo INT PRIMARY KEY AUTO_INCREMENT,
    fk_catalogo INT NOT NULL,
    opcion VARCHAR(50) NOT NULL,
    FOREIGN KEY (fk_catalogo) REFERENCES catalogos(id_catalogo)
);

CREATE TABLE respuestas (
    id_respuesta INT PRIMARY KEY AUTO_INCREMENT,
    fk_paciente INT NOT NULL,
    fk_pregunta INT NOT NULL,
    respuesta_boolean BOOLEAN,
    respuesta_numerica DECIMAL(10, 2),
    respuesta_texto TEXT,
    fk_opcion INT NULL,  -- ID de la respuesta predefinida
    tipo_respuesta ENUM('BOOLEAN', 'NUMERIC', 'TEXT', 'CATALOG') NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(id),
    FOREIGN KEY (pregunta_id) REFERENCES Preguntas(id),
    FOREIGN KEY (opcion_id) REFERENCES OpcionesCatalogo(id)
);


CREATE TABLE odontogramas (
    id_odontograma INT PRIMARY KEY AUTO_INCREMENT,
    fk_paciente INT NOT NULL,
    fk_seccion_formulario INT NOT NULL,
    FOREIGN KEY (fk_paciente) REFERENCES pacientes(fk_paciente),
    FOREIGN KEY (fk_seccion_formulario) REFERENCES secciones_formularios(fk_seccion_formulario)
);

CREATE TABLE tratamientos (
    id_tratamiento INT PRIMARY KEY AUTO_INCREMENT,
    fk_catalogo_historia_clinica INT,
    fk_paciente INT,
    fecha DATETIME,
    FOREIGN KEY (fk_catalogo_historia_clinica) REFERENCES catalogo_historias_clinicas(id_catalogo_historia_clinica),
    FOREIGN KEY (fk_paciente) REFERENCES Pacientes(id)
);

SELECT
    p.nombre AS paciente_nombre,
    q.pregunta_texto,
    r.respuesta_boolean,
    r.respuesta_numerica,
    r.respuesta_texto,
    o.valor AS opcion_valor
FROM
    Respuestas r
JOIN
    Pacientes p ON r.paciente_id = p.id
JOIN
    Preguntas q ON r.pregunta_id = q.id
LEFT JOIN
    OpcionesCatalogo o ON r.opcion_id = o.id
JOIN
    SeccionesHistoriasClinicas s ON q.seccion_id = s.id
WHERE
    p.nombre = 'María López' AND
    s.nombre_seccion = 'Historial Médico';

-- poblado
INSERT INTO Pacientes (nombre) VALUES
('Juan Pérez'),
('María López'),
('Carlos Fernández'),
('Ana Gómez');

-- Insertar datos en la tabla CatalogosHistoriasClinicas
INSERT INTO CatalogosHistoriasClinicas (nombre_catalogo) VALUES
('Historia Clínica General'),
('Historia Clínica Pediátrica');

-- Insertar datos en la tabla SeccionesHistoriasClinicas
INSERT INTO SeccionesHistoriasClinicas (nombre_seccion) VALUES
('Datos Personales'),
('Historial Médico'),
('Examen Físico'),
('Resultados de Laboratorio');

-- Insertar datos en la tabla CatalogosSecciones
INSERT INTO CatalogosSecciones (catalogo_id, seccion_id) VALUES
(1, 1),  -- Historia Clínica General - Datos Personales
(1, 2),  -- Historia Clínica General - Historial Médico
(1, 3),  -- Historia Clínica General - Examen Físico
(1, 4),  -- Historia Clínica General - Resultados de Laboratorio
(2, 1);  -- Historia Clínica Pediátrica - Datos Personales

-- Insertar datos en la tabla Preguntas
INSERT INTO Preguntas (pregunta_texto, seccion_id) VALUES
('¿Cuál es su nombre completo?', 1),
('¿Cuál es su edad?', 1),
('¿Tiene antecedentes familiares de enfermedades?', 2),
('¿Ha tenido alguna cirugía anteriormente?', 2),
('¿Cuál fue el resultado de su último examen de sangre?', 4);

-- Insertar datos en la tabla Catalogos
INSERT INTO Catalogos (nombre_catalogo) VALUES
('Tipo de Diagnóstico'),
('Medicación');

-- Insertar datos en la tabla OpcionesCatalogo
INSERT INTO OpcionesCatalogo (catalogo_id, valor) VALUES
(1, 'Diabetes'),
(1, 'Hipertensión'),
(2, 'Paracetamol'),
(2, 'Ibuprofeno');

-- Insertar datos en la tabla Respuestas
INSERT INTO Respuestas (paciente_id, pregunta_id, respuesta_boolean, respuesta_numerica, respuesta_texto, opcion_id, tipo_respuesta) VALUES
(1, 1, NULL, NULL, 'Juan Pérez', NULL, 'texto'),
(1, 2, NULL, 30, NULL, NULL, 'numerica'),
(2, 3, TRUE, NULL, NULL, 1, 'boolean'),
(3, 4, NULL, NULL, 'Apendicectomía', NULL, 'texto'),
(4, 5, NULL, NULL, 'Normal', 1, 'catalogo');


SELECT
    p.nombre AS paciente_nombre,
    q.pregunta_texto,
    r.respuesta_boolean,
    r.respuesta_numerica,
    r.respuesta_texto,
    o.valor AS opcion_valor
FROM
    Respuestas r
JOIN
    Pacientes p ON r.paciente_id = p.id
JOIN
    Preguntas q ON r.pregunta_id = q.id
LEFT JOIN
    OpcionesCatalogo o ON r.opcion_id = o.id
JOIN
    SeccionesHistoriasClinicas s ON q.seccion_id = s.id
WHERE
    p.nombre = 'María López' AND
    s.nombre_seccion = 'Historial Médico';