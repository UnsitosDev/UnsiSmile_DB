/**
Las contraseñas para los usuarios son:
ABCD901215HDFRRN08
*/

INSERT INTO
    `user_app` (
        `id`,
        `password`,
        `status`,
        `username`,
        `first_login`,
        `role_id`
    )
VALUES
    -- Usuario administrador (role_id = 1)
    (
        '8d3213f2-362c-4c1a-be17-10e774ba362d',
        '$2a$10$Ubqh3CQEMOuar//DzeDkleZw7dBuojtg485aUdYOdCD1/e68ZcOLi',
        1,
        'E12345',
        1,
        1
    ),
    -- Usuario estudiante (role_id = 2)
    (
        'a1b2c3d4-e5f6-7g8h-9i10-j11k12l13m14',
        '$2a$10$Ubqh3CQEMOuar//DzeDkleZw7dBuojtg485aUdYOdCD1/e68ZcOLi',
        1,
        '2023070425',
        1,
        2
    );


-- 2. Inserción de personas en la tabla people
INSERT INTO
    `people` (
        `curp`,
        `first_name`,
        `second_name`,
        `first_lastname`,
        `second_lastname`,
        `birth_date`,
        `fk_gender`,
        `email`,
        `phone`,
        `created_at`,
        `created_by`,
        `status_key`,
        `updated_at`,
        `updated_by`
    )
VALUES
    -- Administrador
    (
        'ABCD901215HDFRRN08',
        'Juan',
        'Carlos',
        'García',
        'Hernández',
        '1990-12-15',
        1,
        'juancarlos.garcia@example.com',
        '5551234567',
        '2025-02-25 17:47:03.618100',
        '123e4567-e89b-12d3-a456-426614174000',
        'A',
        NULL,
        NULL
    ),
    -- Estudiante 1
    (
        'AOPS011028HOCNRLA9',
        'JUAN',
        'LUIS',
        'ANTONIO',
        'Martíez',
        '2003-06-04',
        1,
        'example@gmail.com',
        '5645123541',
        '2025-02-25 17:47:03.618100',
        '123e4567-e89b-12d3-a456-426614174000',
        'A',
        NULL,
        NULL
    );

-- 3. Inserción en la tabla administrators
INSERT INTO
    `administrators` (
        `employee_number`,
        `fk_person`,
        `fk_user`,
        `created_at`,
        `created_by`,
        `status_key`,
        `updated_at`,
        `updated_by`
    )
VALUES
    (
        'E12345',
        'ABCD901215HDFRRN08',
        '8d3213f2-362c-4c1a-be17-10e774ba362d',
        '2025-02-25 17:47:03.642645',
        '123e4567-e89b-12d3-a456-426614174000',
        'A',
        NULL,
        NULL
    );

-- Estudiante - Juan Antonio
INSERT INTO
    `students` (
        `enrollment`,
        `fk_person`,
        `fk_user`,
        `created_at`,
        `created_by`,
        `status_key`,
        `updated_at`,
        `updated_by`
    )
VALUES
    (
        '2023070425',
        'AOPS011028HOCNRLA9',
        'a1b2c3d4-e5f6-7g8h-9i10-j11k12l13m14',
        '2025-02-25 17:47:03.618100',
        '123e4567-e89b-12d3-a456-426614174000',
        'A',
        NULL,
        NULL
    );

-- insertar un semestre 
insert into semesters (semester_name, fecha_inicio, fecha_fin, fk_cycle, status_key) values("2025-2025-string", "2025-04-17 00:00:00.000000", "2025-04-17 00:00:00.000000", 1, "A");


-- insertar un grupo

insert into groups (semester_number, group_name, fk_career, fk_semester, status_key) values ("1", "A", "13", 1, "A");


-- asignar un alumno a un grupo
insert into student_groups(fk_student, fk_group, status_key) values("2023070425", 1, "A");
