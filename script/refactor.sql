-- drop database ejemplo;
create database if not exists ejemplo;
use ejemplo;

CREATE TABLE Pacientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE CatalogosHistoriasClinicas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_catalogo VARCHAR(100) NOT NULL
);


CREATE TABLE SeccionesHistoriasClinicas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_seccion VARCHAR(100) NOT NULL
);

CREATE TABLE CatalogosSecciones (
    catalogo_id INT NOT NULL,
    seccion_id INT NOT NULL,
    PRIMARY KEY (catalogo_id, seccion_id),
    FOREIGN KEY (catalogo_id) REFERENCES CatalogosHistoriasClinicas(id),
    FOREIGN KEY (seccion_id) REFERENCES SeccionesHistoriasClinicas(id)
);

CREATE TABLE Preguntas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pregunta_texto TEXT NOT NULL,
    seccion_id INT NOT NULL,
    FOREIGN KEY (seccion_id) REFERENCES SeccionesHistoriasClinicas(id)
);

CREATE TABLE Catalogos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_catalogo VARCHAR(50) NOT NULL
);

CREATE TABLE OpcionesCatalogo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    catalogo_id INT NOT NULL,
    valor VARCHAR(50) NOT NULL,
    FOREIGN KEY (catalogo_id) REFERENCES Catalogos(id)
);

CREATE TABLE Respuestas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT NOT NULL,
    pregunta_id INT NOT NULL,
    respuesta_boolean BOOLEAN,
    respuesta_numerica DECIMAL(10, 2),
    respuesta_texto TEXT,
    opcion_id INT,  -- ID de la respuesta predefinida
    tipo_respuesta ENUM('boolean', 'numerica', 'texto', 'catalogo') NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(id),
    FOREIGN KEY (pregunta_id) REFERENCES Preguntas(id),
    FOREIGN KEY (opcion_id) REFERENCES OpcionesCatalogo(id)
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