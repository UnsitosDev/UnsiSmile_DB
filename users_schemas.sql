-- Drop database unsis_smile;
DROP DATABASE IF EXISTS usuarios_unsis_smile;

-- Create database usuarios_unsis_smile;
CREATE DATABASE usuarios_unsis_smile;

-- Use usuarios_unsis_smile;
USE usuarios_unsis_smile;

-- ******************************************** SCHEMAS FOR USERS (LOGGING) *******************************
-- Table for role types
CREATE TABLE
    roles_user_types (
        id_role INT AUTO_INCREMENT PRIMARY KEY,
        role_name VARCHAR(50) NOT NULL
    );

-- User table
CREATE TABLE
    users (
        id_user INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(20) NOT NULL,
        password VARCHAR(15) NOT NULL,
        fk_role INT NOT NULL,
        status BOOLEAN DEFAULT TRUE,
        FOREIGN KEY (fk_role) REFERENCES roles_user_types (id_role)
    );

-- ************************************ SCHEMAS FOR GROUPS **************************************************
CREATE TABLE
    careers (
        id_career VARCHAR(2) PRIMARY KEY,
        career VARCHAR(100)
    );

CREATE TABLE
    groups (
        id_group INT AUTO_INCREMENT PRIMARY KEY,
        group_name VARCHAR(100),
        fk_career INT,
        FOREIGN KEY (fk_career) REFERENCES careers (id_career)
    );

CREATE TABLE
    cycles (
        id_cycle INT AUTO_INCREMENT PRIMARY KEY,
        cycle_name VARCHAR(100),
        status BOOLEAN DEFAULT TRUE
    );

-- ******************************************** APPLICATION USER SCHEMAS (End-users) *******************************
-- Clinic administrators tables
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
        fk_gender INT,
        FOREIGN KEY (fk_gender) REFERENCES gender(id_gender) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    administrators (
        employee_number VARCHAR(15) PRIMARY KEY,
        fk_person INT,
        fk_user INT,
        FOREIGN KEY (fk_person) REFERENCES people (id_person),
        FOREIGN KEY (fk_user) REFERENCES users (id_user)
    );

-- ************************Health personnel data***********************************
CREATE TABLE
    lecturers (
        employee_number VARCHAR(15) PRIMARY KEY,
        fk_user INT,
        fk_person INT,
        FOREIGN KEY (fk_person) REFERENCES people (id_person),
        fk_user INT NOT NULL,
        FOREIGN KEY (fk_user) REFERENCES users (id_user)
    );

CREATE TABLE
    semesters (
        id_semester INT AUTO_INCREMENT PRIMARY KEY,
        fk_group INT,
        fk_cycle INT,
        FOREIGN KEY (fk_group) REFERENCES groups (id_group),
        FOREIGN KEY (fk_cycle) REFERENCES cycles (id_cycle)
    );

CREATE TABLE
    lecturer_group (
        id_lecturer_semester_group INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        fk_lecturer INT,
        fk_semester INT,
        FOREIGN KEY (fk_lecturer) REFERENCES lecturers (id_lecturer),
        FOREIGN KEY (fk_semester) REFERENCES semesters (id_semester)
    );

CREATE TABLE
    students (
        enrollment VARCHAR(10) PRIMARY KEY,
        fk_user INT,
        fk_person INT,
        FOREIGN KEY (fk_person) REFERENCES people (id_person),
        FOREIGN KEY (fk_user) REFERENCES users (id_user)
    );

CREATE TABLE
    students_semesters (
        fk_student INT,
        fk_semester INT,
        FOREIGN KEY (fk_student) REFERENCES students (id_student),
        FOREIGN KEY (fk_semester) REFERENCES semesters (id_semester),
            PRIMARY KEY (fk_student, fk_semester)
    );
