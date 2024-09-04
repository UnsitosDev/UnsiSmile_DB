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