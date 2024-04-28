-- Table patients
CREATE TABLE patients (
    curp VARCHAR(20) UNIQUE PRIMARY KEY,
    first_name TEXT,
    second_name Text,
    first_lastname Text,
    second_lastname TEXT,
    socioeconomic_level TEXT,
    phone_1 VARCHAR(15),
    phone_2 VARCHAR(15),
    fk_blood_type int,
    fk_disability int,
    fk_ethnic_group int,
    fk_religion int,
    fk_address int,
    FOREIGN KEY (fk_blood_type) REFERENCES blood_type (id_type) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_disability) REFERENCES disabilities (id_disability) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_ethnic_group) REFERENCES ethnic_group (id_ethnic_group) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_religion) REFERENCES religions (id_religion) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_address) REFERENCES addresses (id_address) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE addresses (
    id_address int auto_increment not null PRIMARY KEY,
    street_number TEXT,
    interior_number TEXT,
    fk_housing VARCHAR(2),
    fk_street int,
        FOREIGN KEY (fk_housing) REFERENCES housings (id_housing) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_street) REFERENCES streets (id_street) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Users Table
CREATE TABLE users(
    cedula VARCHAR(10) UNIQUE PRIMARY KEY,
    curp VARCHAR(20),
    first_name TEXT,
    last_name TEXT,
    fk_specialty INT,
    fk_sub_specialty INT,
    fk_address int,
    fk_clues INT,
    fk_role INT,
        FOREIGN KEY (fk_specialty) REFERENCES specialty (id_specialty) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_sub_specialty) REFERENCES sub_specialty (id_sub_specialty) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_address) REFERENCES address (id_address) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_clues) REFERENCES clues (id_clue) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_role) REFERENCES roles (id_role) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Prescriptions Table
CREATE TABLE prescriptions(
    id_prescription int PRIMARY KEY,
    doctor VARCHAR(50),--- pending to verify the relationship
    medication TEXT,
    unit_of_measure TEXT,
    dosage int,
    frequency TEXT,
    fk_route_of_administration int,
    start_date DATE,
    end_date DATE,
        FOREIGN KEY (fk_route_of_administration) REFERENCES route_of_administration (id_route_of_administration) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Orders Table
CREATE TABLE orders(
    id_order int auto_increment PRIMARY KEY,
    date date,
    id_type INT,
    supply_instructions TEXT,
    additional_instructions TEXT,
    doctor VARCHAR(50),--- pending to verify the relationship
    fk_patient VARCHAR(20),
    recipient VARCHAR(50),--- pending to verify the relationship
    fk_medication INT,
    consent BOOLEAN,
    diagnostic_impression TEXT,
    start_date date,
    delivery_date date,
    end_date date,
    fk_diagnosis INT,
    fk_cie9mc int,--verify refers to procedure type
    fk_status int,--order status
    fk_priority int,
        FOREIGN KEY (fk_patient) REFERENCES patients (curp) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_medication) REFERENCES medications (id_medication) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_diagnosis) REFERENCES diagnoses (id_diagnosis) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_cie9mc) REFERENCES procedures (id_procedure) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_status) REFERENCES status (id_status) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_priority) REFERENCES priority (id_priority) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Diagnostic Auxiliary Table
CREATE TABLE diagnostic_auxiliary(
    id_auxiliary INT PRIMARY KEY,
    fk_study_type int,
    fk_related_diagnosis INT,
    fk_emergency INT,
    indications TEXT,
    Foreign Key (fk_study_type) REFERENCES study_type(id_study_type) on delete CASCADE on update CASCADE,
    Foreign Key (fk_related_diagnosis) REFERENCES related_diagnosis(id_related_diagnosis) on delete CASCADE on update CASCADE,
    Foreign Key (fk_emergency) REFERENCES emergencies(id_emergency) on delete CASCADE on update CASCADE.BIGINT
);

CREATE TABLE blood_bank(
    fk_blood_type int,
    product_identifier int,
    quantity int,
    fk_units int,
    tracking TEXT,
    administration_time TEXT,
        Foreign Key (fk_blood_type) REFERENCES blood_type(id_blood_type) on delete CASCADE on update CASCADE,
        Foreign Key (fk_units) REFERENCES units(id_units) on delete CASCADE on update CASCADE
);

-- Allergies Table
CREATE TABLE allergies (
    fk_allergic_reactions int,
    description TEXT,
    fk_medication int,
    detection_date DATE,
        Foreign Key (fk_allergic_reactions) REFERENCES allergic_reactions(id_allergic_reactions) on delete CASCADE on update CASCADE,
        Foreign Key (fk_medication) REFERENCES medications(id_medication) on delete CASCADE on update CASCADE
);

-- External Document Table
CREATE TABLE external_document(
    document_key int not null PRIMARY key,
    document_name TEXT,
    source TEXT,
    creation_date date,
    fk_patient int,
        Foreign Key (fk_patient) REFERENCES patients(curp) on delete CASCADE on update CASCADE
);

-- Health Alert Table
CREATE TABLE health_alert(
    fk_type_of_risk int,
    fk_priority int,
    applicable_actions TEXT,
    risk_factors TEXT,
    min_age int,
    max_age int,
    fk_sex int,
    fk_state int,
    fk_municipality int,
    fk_location int,
    notification_time TEXT,
        Foreign Key (fk_type_of_risk) REFERENCES type_of_risk(id_type_of_risk) on delete CASCADE on update CASCADE,
        Foreign Key (fk_priority) REFERENCES priority(id_priority) on delete CASCADE on update CASCADE,
        Foreign Key (fk_sex) REFERENCES sex(id_sex) on delete CASCADE on update CASCADE,
        Foreign Key (fk_state) REFERENCES states(id_state) on delete CASCADE on update CASCADE,
        Foreign Key (fk_municipality) REFERENCES municipalities(id_municipality) on delete CASCADE on update CASCADE,
        Foreign Key (fk_location) REFERENCES locations(id_location) on delete CASCADE on update CASCADE
);

-- Notifiable Cases Table
CREATE TABLE notifiable_cases(
    fk_doctor int,
    fk_patient VARCHAR(20),
    clinical_summary TEXT,
    action_description TEXT,
    fk_identified_risks int,
        Foreign Key (fk_doctor) REFERENCES doctors(id_doctor) on delete CASCADE on update CASCADE,
        Foreign Key (fk_patient) REFERENCES patients(curp) on delete CASCADE on update CASCADE,
        Foreign Key (fk_identified_risks) REFERENCES identified_risks(id_risk) on delete CASCADE on update CASCADE
);

-- Clinical Guidelines Table
CREATE TABLE clinical_guidelines(
    guideline_key int not null PRIMARY key,
    application_date date,
    guideline

_name TEXT,
    fk_related_diagnosis int,
    fk_related_procedure int,
    description TEXT,
    min_age int,
    max_age int,
    fk_sex int,
        Foreign Key (fk_related_diagnosis) REFERENCES related_diagnosis(id_diagnosis) on delete CASCADE on update CASCADE,
        Foreign Key (fk_related_procedure) REFERENCES related_procedure(id_procedure) on delete CASCADE on update CASCADE,
        Foreign Key (fk_sex) REFERENCES sex(id_sex) on delete CASCADE on update CASCADE
);

-- Housing Catalog Table
CREATE TABLE housings(
    id_housing VARCHAR(2) PRIMARY key,
    category TEXT
);

-- Blood Type Catalog Table
CREATE TABLE blood_type(
    id_type INT PRIMARY KEY,
    type VARCHAR(3) NOT NULL
);

CREATE TABLE blood_compatibility (
    fk_type int,
    fk_compatible_type int,
    FOREIGN KEY (fk_type) REFERENCES blood_type(id_type),
    FOREIGN KEY (fk_compatible_type) REFERENCES blood_type(id_type),
    PRIMARY KEY (fk_type, fk_compatible_type)
);

CREATE TABLE disabilities(
    id_disability INT PRIMARY KEY,
    type TEXT
);

CREATE TABLE ethnic_groups (
    id_group INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE religions (
    id_religion varchar(6) PRIMARY KEY,
    religion VARCHAR(100) NOT NULL
);

CREATE TABLE states (
    id_state varchar(2) PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE municipalities (
    id_municipality varchar(4) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    fk_state varchar(2),
        FOREIGN KEY (fk_state) REFERENCES states (id_state) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE locations (
    id_location varchar(6) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    fk_municipality varchar(4),
    fk_postal_code int,
        FOREIGN KEY (fk_municipality) REFERENCES municipalities (id_municipality) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fk_postal_code) REFERENCES postal_code (id_postal_code) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE neighborhoods (
    id_neighborhood int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    fk_location varchar(6),
        FOREIGN KEY (fk_location) REFERENCES locations (id_location) ON DELETE CASCADE ON UPDATE CASCADE,


);

CREATE TABLE streets (
    id_street int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    fk_neighborhood int,
        FOREIGN KEY (fk_neighborhood) REFERENCES neighborhoods (id_neighborhood) ON DELETE CASCADE ON UPDATE CASCADE,
);

-- Create the Responsible Table
CREATE TABLE Responsibles (
    id_responsible BIGINT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), phone VARCHAR(20) UNIQUE, email VARCHAR(50)
);

-- Create the Gender Table
CREATE TABLE genders (
    id_gender BIGINT PRIMARY KEY, gender VARCHAR(100) UNIQUE
);

-- Create the Civil Status Table
CREATE TABLE Civil_Status (
    id_civil_status BIGINT PRIMARY KEY, civil_status VARCHAR(100) UNIQUE
);

-- Create the Occupation Table
CREATE TABLE occupations (
    id_occupation BIGINT PRIMARY KEY, occupation VARCHAR(100) UNIQUE
);

CREATE TABLE nationalities (
    id_nationality BIGINT PRIMARY KEY, nationality VARCHAR(100) UNIQUE
);

CREATE TABLE vital_signs (
    id_vital_signs INT NOT NULL AUTO_INCREMENT PRIMARY KEY, weight FLOAT, height FLOAT, temperature FLOAT, heart_rate FLOAT, respiratory_rate FLOAT, blood_pressure FLOAT, oxygen_saturation FLOAT, glucose FLOAT, pulse FLOAT
);


-- administrators, teachers, students