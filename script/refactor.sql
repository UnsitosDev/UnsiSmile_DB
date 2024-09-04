-- drop database ejemplo;
create database if not exists ejemplo;
use ejemplo;

-- Patients Table
CREATE TABLE patients (
    id_patient INT PRIMARY KEY AUTO_INCREMENT,
    record_number BIGINT,
    name VARCHAR(100) NOT NULL
);

-- ClinicalHistoryCatalog Table
CREATE TABLE clinical_history_catalogs (
    id_clinical_history_catalog INT PRIMARY KEY AUTO_INCREMENT,
    clinical_history_name VARCHAR(100) NOT NULL
);

-- FormSections Table
CREATE TABLE form_sections (
    id_form_section INT PRIMARY KEY AUTO_INCREMENT,
    form_name VARCHAR(100) NOT NULL
);

-- ClinicalHistorySections Table
CREATE TABLE clinical_history_sections (
    fk_clinical_history_catalog INT NOT NULL,
    fk_form_section INT NOT NULL,
    PRIMARY KEY (fk_clinical_history_catalog, fk_form_section),
    FOREIGN KEY (fk_clinical_history_catalog) REFERENCES clinical_history_catalogs(id_clinical_history_catalog),
    FOREIGN KEY (fk_form_section) REFERENCES form_sections(id_form_section)
);

-- Questions Table
CREATE TABLE questions (
    id_question INT PRIMARY KEY AUTO_INCREMENT,
    question_text TEXT NOT NULL,
    fk_form_section INT NOT NULL,
    FOREIGN KEY (fk_form_section) REFERENCES form_sections(id_form_section)
);

-- Catalogs Table (for predefined answer catalogs)
CREATE TABLE catalogs (
    id_catalog INT PRIMARY KEY AUTO_INCREMENT,
    catalog_name VARCHAR(50) NOT NULL
);

-- CatalogOptions Table (options within a predefined catalog)
CREATE TABLE catalog_options (
    id_catalog_option INT PRIMARY KEY AUTO_INCREMENT,
    fk_catalog INT NOT NULL,
    option_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (fk_catalog) REFERENCES catalogs(id_catalog)
);

-- Odontograms Table
CREATE TABLE odontograms (
    id_odontogram INT PRIMARY KEY AUTO_INCREMENT,
    fk_patient INT NOT NULL,
    fk_form_section INT NOT NULL,
    FOREIGN KEY (fk_patient) REFERENCES patients(id_patient),
    FOREIGN KEY (fk_form_section) REFERENCES form_sections(id_form_section)
);

-- Treatments Table
CREATE TABLE patient_clinical_histories (
    id_patient_clinical_history INT PRIMARY KEY AUTO_INCREMENT,
    fk_clinical_history_catalog INT,
    fk_patient INT,
    date DATETIME,
    FOREIGN KEY (fk_clinical_history_catalog) REFERENCES clinical_history_catalogs(id_clinical_history_catalog),
    FOREIGN KEY (fk_patient) REFERENCES patients(id_patient)
);

-- Answers Table
CREATE TABLE answers (
    id_answer INT PRIMARY KEY AUTO_INCREMENT,
    fk_patient_clinical_history INT NOT NULL,
    fk_question INT NOT NULL,
    answer_boolean BOOLEAN,
    answer_numeric DECIMAL(10, 2),
    answer_text TEXT,
    answer_date DATETIME,
    fk_option INT NULL,  -- ID of predefined answer
    answer_type ENUM('BOOLEAN', 'NUMERIC', 'TEXT', 'CATALOG') NOT NULL,
    FOREIGN KEY (fk_patient_clinical_history) REFERENCES patient_clinical_histories(id_patient_clinical_history),
    FOREIGN KEY (fk_question) REFERENCES questions(id_question),
    FOREIGN KEY (fk_option) REFERENCES catalog_options(id_catalog_option)
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