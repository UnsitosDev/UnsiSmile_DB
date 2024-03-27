-- Drop the database if it exists
DROP DATABASE IF EXISTS unsis_smile;

-- Create the database
CREATE DATABASE IF NOT EXISTS unsis_smile;

-- Use the database
USE unsis_smile;


CREATE TABLE
    states (
        id_state varchar(2) PRIMARY KEY,
        name VARCHAR(50) NOT NULL
    );

CREATE TABLE
    municipalities (
        id_municipality varchar(4) PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        fk_state varchar(2),
        FOREIGN KEY (fk_state) REFERENCES states (id_state) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    localities ( -- comunidad
        id_locality varchar(5) PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        postal_code varchar(5),
        fk_municipality varchar(4),
        FOREIGN KEY (fk_municipality) REFERENCES municipalities (id_municipality) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    neighborhoods ( -- colonias 
        id_neighborhood BIGINT PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        fk_locality varchar(6),
        FOREIGN KEY (fk_locality) REFERENCES localities (id_locality) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    streets (
        id_street BIGINT PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        fk_neighborhood BIGINT,
        FOREIGN KEY (fk_neighborhood) REFERENCES neighborhoods (id_neighborhood) ON DELETE CASCADE ON UPDATE CASCADE
    );

-- Housing Catalog Table
CREATE TABLE
    housings (id_housing VARCHAR(2) PRIMARY key, category TEXT);

CREATE TABLE
    addresses (
        id_address BIGINT auto_increment not null PRIMARY KEY,
        street_number VARCHAR(3),
        interior_number VARCHAR(3),
        fk_housing VARCHAR(2),
        fk_street BIGINT,
        FOREIGN KEY (fk_housing) REFERENCES housings (id_housing) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_street) REFERENCES streets (id_street) ON DELETE CASCADE ON UPDATE CASCADE
    );

-- Create the Guardians table
CREATE TABLE
    guardians (
        id_guardian BIGINT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        phone VARCHAR(20) UNIQUE,
        email VARCHAR(50)
    );

-- Create the Gender table
CREATE TABLE
    genders (
        id_gender BIGINT PRIMARY KEY,
        gender VARCHAR(100) UNIQUE
    );

-- Create the Marital Status table
CREATE TABLE
    marital_statuses (
        id_marital_status BIGINT PRIMARY KEY,
        marital_status VARCHAR(100) UNIQUE
    );

-- Create the Occupation table
CREATE TABLE
    occupations (
        id_occupation BIGINT PRIMARY KEY,
        occupation VARCHAR(100) UNIQUE
    );

CREATE TABLE
    ethnic_groups (
        id_ethnic_group BIGINT PRIMARY KEY,
        ethnic_group VARCHAR(100) UNIQUE
    );

CREATE TABLE
    religions (
        id_religion BIGINT PRIMARY KEY,
        religion VARCHAR(100) UNIQUE
    );

CREATE TABLE
    nationalities (
        id_nationality BIGINT PRIMARY KEY,
        nationality VARCHAR(100) UNIQUE
    );

CREATE TABLE
    vital_signs (
        id_vital_signs BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        weight FLOAT,
        height FLOAT,
        temperature FLOAT,
        heart_rate FLOAT,
        respiratory_rate FLOAT,
        blood_pressure FLOAT,
        oxygen_saturation FLOAT,
        glucose FLOAT,
        pulse FLOAT
    );

-- create the People table
CREATE TABLE
    people (
        curp VARCHAR(20) PRIMARY KEY,
        first_name VARCHAR(50),
        second_name VARCHAR(50),
        first_lastname VARCHAR(50),
        second_lastname VARCHAR(50),
        phone VARCHAR(10),
        birth_date DATE,
        email VARCHAR(200),
        fk_gender BIGINT,
        FOREIGN KEY (fk_gender) REFERENCES genders(id_gender) ON DELETE CASCADE ON UPDATE CASCADE
    );

-- Create the Patients table
CREATE TABLE
    patients (
        id_patient BIGINT AUTO_INCREMENT PRIMARY KEY,
        fk_nationality BIGINT,
        fk_person VARCHAR(20) not null,
        fk_address BIGINT,
        fk_marital_status BIGINT,
        fk_occupation BIGINT,
        fk_ethnic_group BIGINT,
        fk_religion BIGINT,
        admission_date DATE,
        is_minor BOOLEAN,
        fk_guardian BIGINT,
        has_disability BOOLEAN,
        FOREIGN KEY (fk_person) REFERENCES people (curp) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_address) REFERENCES addresses (id_address) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_marital_status) REFERENCES marital_statuses (id_marital_status),
        FOREIGN KEY (fk_occupation) REFERENCES occupations (id_occupation),
        FOREIGN KEY (fk_ethnic_group) REFERENCES ethnic_groups (id_ethnic_group),
        FOREIGN KEY (fk_religion) REFERENCES religions (id_religion),
        FOREIGN KEY (fk_nationality) REFERENCES nationalities (id_nationality),
        FOREIGN KEY (fk_guardian) REFERENCES guardians (id_guardian) ON DELETE CASCADE ON UPDATE CASCADE
    );

-- START OF GENERAL MEDICAL HISTORY SCHEMAS
CREATE TABLE
    facial_profile (
        id_facial_profile BIGINT AUTO_INCREMENT PRIMARY KEY,
        facial_profile VARCHAR(50)
    );

CREATE TABLE
    facial_front (
        id_facial_front BIGINT AUTO_INCREMENT PRIMARY KEY,
        facial_front VARCHAR(50)
    );

-- Create the Facial Exam table
CREATE TABLE
    facial_exam (
        id_facial_exam BIGINT PRIMARY KEY AUTO_INCREMENT,
        fk_profile BIGINT,
        fk_front BIGINT,
        distinguishing_features TEXT,
        FOREIGN KEY (fk_profile) REFERENCES facial_profile (id_facial_profile),
        FOREIGN KEY (fk_front) REFERENCES facial_front (id_facial_front)
    );

CREATE TABLE
    FamilyHistoryQuestions (
        id_question BIGINT AUTO_INCREMENT PRIMARY KEY,
        question
    );

INSERT into
    FamilyHistoryQuestions (question)
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
    FamilyHistory (
        id_family_history BIGINT PRIMARY KEY AUTO_INCREMENT,
        fk_question BIGINT,
        main_response ENUM ('si', 'no') NOT NULL,
        response_detail TEXT,
        FOREIGN KEY (fk_question) REFERENCES FamilyHistoryQuestions (id_question) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    housing_material (
        housing_material_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
        material VARCHAR(100) UNIQUE
    );

CREATE TABLE
    NonPathologicalPersonalAntecedents (
        id_non_pathological_personal_antecedents BIGINT PRIMARY KEY AUTO_INCREMENT,
        eats_fruits_vegetables BOOLEAN,
        eats_meat BOOLEAN,
        eats_cereals BOOLEAN,
        eats_junk_food BOOLEAN,
        drinks_water_daily BOOLEAN,
        drinks_sodas BOOLEAN,
        daily_sleep_hours BIGINT,
        times_bathes_per_week BIGINT,
        times_brushes_teeth_per_day BIGINT,
        house_with_floor BOOLEAN,
        fk_housing_material BIGINT,
        FOREIGN KEY (fk_housing_material) REFERENCES housing_material (housing_material_ID) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    ClosedQuestionsPathologicalAntecedents (
        id_closed_question BIGINT AUTO_INCREMENT PRIMARY KEY,
        question ENUM (
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
    ClosedQuestionsPathologicalAntecedents (question)
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
    OpenQuestionsPathologicalAntecedents (
        id_open_question BIGINT AUTO_INCREMENT PRIMARY KEY,
        question ENUM (
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
    OpenQuestionsPathologicalAntecedents (question)
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

-- Odontogram schemas
CREATE TABLE
    odontogram (
        id_odontogram BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        description TEXT,
        date DATE
    );

CREATE TABLE
    dental_code (
        id_dental_code BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        code VARCHAR(3),
        adult BOOLEAN
    );

CREATE TABLE
    tooth_condition (
        id_tooth_condition BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        description VARCHAR(50)
    );

CREATE TABLE
    tooth_region (
        id_tooth_region BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        description VARCHAR(50)
    );

CREATE TABLE
    tooth_detail (
        id_tooth_detail BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        fk_id_dental_code BIGINT,
        fk_tooth_condition BIGINT,
        fk_tooth_region BIGINT,
        fk_odontogram BIGINT,
        FOREIGN KEY (fk_id_dental_code) REFERENCES dental_code (id_dental_code),
        FOREIGN KEY (fk_tooth_condition) REFERENCES tooth_condition (id_tooth_condition),
        FOREIGN KEY (fk_odontogram) REFERENCES odontogram (id_odontogram),
        FOREIGN KEY (fk_tooth_region) REFERENCES tooth_region (id_tooth_region)
    );

-- ** start tables for periodontogram (initial pocket measurement)
-- periodontogram table
CREATE TABLE
    periodontogram (
        id_periodontogram BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        description TEXT,
        date DATE
    );

-- table containing the region (distal, mesial, etc)
CREATE TABLE
    tooth_regions_periodontogram ( -- catalog entity
        id_tooth_regions_periodontogram BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        region VARCHAR(2)
    );

-- schema that will contain the regions: upper vestibular, palatine, lower vestibular and lingual
CREATE TABLE
    regions_measurement_pockets ( -- catalog entity
        id_regions_measurement_pockets BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        region ENUM (
            'VESTIBULARES SUPERIORES',
            'PALATINAS',
            'VESTIBULARES INFERIORES',
            'LINGUALES'
        )
    );

INSERT INTO
    regions_measurement_pockets (region)
VALUES
    ('VESTIBULARES SUPERIORES'),
    ('PALATINAS'),
    ('VESTIBULARES INFERIORES'),
    ('LINGUALES');

CREATE TABLE
    pocket_measurement_detail ( -- table that will contain the pocket measurement of a particular tooth
        id_pocket_measurement_detail BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        fk_tooth_regions_periodontogram BIGINT,
        fk_dental_code BIGINT,
        fk_regions_measurement_pockets BIGINT,
        fk_periodontogram BIGINT,
        measurement FLOAT,
        FOREIGN KEY (fk_tooth_regions_periodontogram) REFERENCES tooth_regions_periodontogram (id_tooth_regions_periodontogram),
        FOREIGN KEY (fk_dental_code) REFERENCES dental_code (id_dental_code),
        FOREIGN KEY (fk_regions_measurement_pockets) REFERENCES regions_measurement_pockets (id_regions_measurement_pockets),
        FOREIGN KEY (fk_periodontogram) REFERENCES periodontogram (id_periodontogram)
    );

-- end initial pockets measurement table
-- Create the Medical Histories table
CREATE TABLE
    medical_histories (
        id_medical_history BIGINT PRIMARY KEY AUTO_INCREMENT,
        fk_patient BIGINT,
        fk_facial_exam BIGINT,
        fk_family_history BIGINT,
        fk_non_pathological_personal_antecedents BIGINT,
        fk_initial_odontogram BIGINT,
        fk_final_odontogram BIGINT,
        FOREIGN KEY (fk_facial_exam) REFERENCES facial_exam (id_facial_exam) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_family_history) REFERENCES FamilyHistory (id_family_history) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_patient) REFERENCES patients (id_patient) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_non_pathological_personal_antecedents) REFERENCES NonPathologicalPersonalAntecedents (id_non_pathological_personal_antecedents) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_initial_odontogram) REFERENCES odontogram (id_odontogram),
        FOREIGN KEY (fk_final_odontogram) REFERENCES odontogram (id_odontogram)
    );

-- Section for non-pathological personal antecedents questions
CREATE TABLE
    ClosedAnswersNonPathological (
        id_closed_answer_non_pathological BIGINT AUTO_INCREMENT PRIMARY KEY,
        fk_closed_questions_id BIGINT,
        fk_medical_histories BIGINT,
        answer TEXT,
        FOREIGN KEY (fk_closed_questions_id) REFERENCES ClosedQuestionsPathologicalAntecedents (id_closed_question) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_medical_histories) REFERENCES medical_histories (id_medical_history) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    OpenAnswersNonPathological (
        id_open_answer_non_pathological BIGINT AUTO_INCREMENT PRIMARY KEY,
        fk_open_questions_id BIGINT,
        fk_medical_histories BIGINT,
        answer TEXT,
        FOREIGN KEY (fk_open_questions_id) REFERENCES OpenQuestionsPathologicalAntecedents (id_open_question) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_medical_histories) REFERENCES medical_histories (id_medical_history) ON DELETE CASCADE ON UPDATE CASCADE
    );