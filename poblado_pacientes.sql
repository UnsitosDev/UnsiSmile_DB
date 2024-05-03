INSERT INTO occupations (id_occupation, occupation) VALUES
(11, 'Contador'),
(12, 'Psicólogo'),
(13, 'Periodista'),
(14, 'Electricista'),
(15, 'Mecánico'),
(16, 'Economista'),
(17, 'Administrador'),
(18, 'Científico'),
(19, 'Farmacéutico'),
(20, 'Veterinario');

INSERT INTO nationalities (id_nationality, nationality) VALUES
(1, 'Mexicana'),
(2, 'Estadounidense'),
(3, 'Canadiense'),
(4, 'Española'),
(5, 'Francesa');


INSERT INTO facial_profile (facial_profile) VALUES
('Recto'),
('Cóncavo'),
('Convexo');

INSERT INTO facial_front(facial_front) VALUES
('Branquifacial'),
('Normofacial'),
('Dolicofacial');



INSERT into
    hereditary_family_history_questions(question)
VALUES
    ('Neoplasia (Cáncer)'),
    ('Diabetes'),
    ('Hipertensión Arterial'),
    ('Padecimientos mentales/neurológicos'),
    ('Obesidad'),
    ('Padecimientos hematológicos'),
    ('Malformaciones congénitas'),
    ('Problemas cardiacos');


INSERT INTO
    closed_questions_pathological_antecedents (question)
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


INSERT INTO
    open_questions_pathological_antecedents (question)
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




