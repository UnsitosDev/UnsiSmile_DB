-- Insertar datos en la tabla states
INSERT INTO states (id_state, name) VALUES 
('01', 'Aguascalientes'),
('02', 'Baja California'),
('03', 'Baja California Sur');

-- Insertar datos en la tabla municipalities
INSERT INTO municipalities (id_municipality, name, fk_state) VALUES 
('0101', 'Aguascalientes', '01'),
('0201', 'Ensenada', '02'),
('0301', 'La Paz', '03');

-- Insertar datos en la tabla localities
INSERT INTO localities (id_locality, name, postal_code, fk_municipality) VALUES 
('01010', 'Aguascalientes', '20000', '0101'),
('02010', 'Mexicali Centro', '21000', '0201'),
('03010', 'La Paz Centro', '23000', '0301');

-- Insertar datos en la tabla neighborhoods
INSERT INTO neighborhoods (id_neighborhood, name, fk_locality) VALUES 
(1, 'Barrio de Guadalupe', '01010'),
(2, 'Zona Centro', '02010'),
(3, 'Centro Histórico', '03010');

-- Insertar datos en la tabla streets
INSERT INTO streets (id_street, name, fk_neighborhood) VALUES 
(1, 'Calle Juárez', 1),
(2, 'Avenida Reforma', 2),
(3, 'Calle Madero', 3);

-- Insertar datos en la tabla housings
INSERT INTO housings (id_housing, category) VALUES 
('01', 'Casa'),
('02', 'Apartamento'),
('03', 'Piso');

-- Insertar datos en la tabla addresses
INSERT INTO addresses (street_number, interior_number, fk_housing, fk_street) VALUES 
('123', 'A', '01', 1),
('456', 'B', '02', 2),
('789', 'C', '03', 3);

-- Insertar datos en la tabla guardians
INSERT INTO guardians (first_name, last_name, phone, email) VALUES 
('Juan', 'Pérez', '555-1234', 'juan.perez@example.com'),
('María', 'García', '555-5678', 'maria.garcia@example.com');

-- Insertar datos en la tabla genders
INSERT INTO genders (id_gender, gender) VALUES 
(1, 'Masculino'),
(2, 'Femenino');

-- Insertar datos en la tabla marital_statuses
INSERT INTO marital_statuses (id_marital_status, marital_status) VALUES 
(1, 'Soltero'),
(2, 'Casado'),
(3, 'Divorciado');

-- Insertar datos en la tabla occupations
INSERT INTO occupations (id_occupation, occupation) VALUES 
(1, 'Médico'),
(2, 'Maestro'),
(3, 'Ingeniero');

-- Insertar datos en la tabla ethnic_groups
INSERT INTO ethnic_groups (id_ethnic_group, ethnic_group) VALUES 
(1, 'Hispano'),
(2, 'Asiático'),
(3, 'Afroamericano');

-- Insertar datos en la tabla religions
INSERT INTO religions (id_religion, religion) VALUES 
(1, 'Cristianismo'),
(2, 'Islam'),
(3, 'Budismo');

-- Insertar datos en la tabla nationalities
INSERT INTO nationalities (id_nationality, nationality) VALUES 
(1, 'Estadounidense'),
(2, 'Británico'),
(3, 'Francés');

-- Insertar datos en la tabla patients
INSERT INTO patients (
    first_name, middle_name, last_name, second_last_name, date_of_birth, email, FK_address, FK_gender, FK_marital_status, FK_occupation, fk_ethnic_group, FK_religion, FK_nationality, admission_date, phone, is_minor, FK_guardian, has_disability
) VALUES 
('Ana', 'María', 'González', 'López', '1990-05-15', 'ana.gonzalez@example.com', 1, 1, 2, 3, 1, 1, 1, '2024-03-15', '555-1111', false, 1, false),
('Carlos', 'Antonio', 'Rodríguez', 'Díaz', '1985-08-20', 'carlos.rodriguez@example.com', 2, 2, 1, 2, 2, 2, 2, '2024-03-16', '555-2222', false, 2, true);
