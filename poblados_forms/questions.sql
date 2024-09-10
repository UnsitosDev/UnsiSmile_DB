-- Signos vitales
INSERT INTO questions
(question_text,
fk_form_section,
fk_answer_type)
VALUES
("Peso", 1, 2),
("Estatura", 1, , 2),
("Temperatura", 1, , 2),
("Frecuencia cardiaca", 1, , 2),
("Frecuencia respiratoria", 1, , 2),
("Presión arterial", 1, , 2),
("Saturación de oxigeno", 1, , 2);

-- Examen facial
INSERT INTO questions
(question_text,
fk_form_section,
fk_answer_type)
VALUES
("Perfil",2,4),
("Frente",2,4),
("Señas particulares",2,4)
;

-- Antecedentes heredofamiliares
INSERT INTO questions
(question_text,
fk_form_section,
fk_answer_type)
VALUES
("Neoplasia (Cáncer)", 3, 5),
("Diabetes", 3, 5),
("Hipertensión Arterial", 3, 5),
("Padecimientos mentales/neurológicos", 3, 5),
("Obesidad", 3, 5),
("Padecimientos hematológicos", 3, 5),
("Malformaciones congénitas", 3, 5),
("Problemas cardiacos", 3, 5);

-- Antecedentes personales no patológicos
INSERT INTO questions
(question_text,
fk_form_section,
fk_answer_type)
VALUES
("Come frutas y verduras", 4, 1),
("Come carnes (Res, puerco o pollo)", 4, 1),
("Come cereales (Pan, Cereal, etc.)", 4, 1),
("Come alimentos chatarra (Dulces, botanas, etc.)", 4, 1),
("Toma o bebe 2 litros de agua al día", 4, 1),
("Toma o bebe uno o más refrescos al día", 4, 1),
("Horas que duerme al día", 4, 2),
("Cuántas veces a la semana se baña", 4, 2),
("Cuántas veces al día cepilla sus dientes", 4, 2),
("Su vivienda tiene piso", 4, 1),
("Su vivienda está hecha de: ", 4, 4)
;

-- Antecedentes personales patológicos
INSERT INTO questions
(question_text,
fk_form_section,
fk_answer_type)
VALUES
("Tabaquismo", 5, 1),
("Alcoholismo", 5, 1),
("Otras sustancias psicoactivas o recreativas", 5, 1),
("Perforaciones (Aretes, en mujeres además de los 2 aretes en cada oreja)", 5, 1),
("Tatuajes", 5, 1),
("Neoplasia (Cáncer)", 5, 1),
("Diabetes", 5, 1),
("Hipertensión Arterial", 5, 1),
("Padecimientos mentales/convulsiones/desmayos/migraña/neuralgia", 5, 1),
("Obesidad diagnosticada", 5, 1),
("Padecimientos hematológicos/hemorrágicos/anemia/leucemia", 5, 1),
("Malformaciones congénitas/ Síndromes", 5, 1),
("Problemas cardiacos/ angina de pecho/ infarto/ tromboembolia/
marcapasos/ bypass", 5, 1),
("Radioterapia/Quimioterapia", 5, 1),
("Padecimientos reumatológicos/ artritis/ osteoporosis", 5, 1),
("Enfermedades del riñón", 5, 1),
("Enfermedades hepáticas/Hepatitis", 5, 1),
("Enfermedades de transmisión sexual", 5, 1),
("Hipertiroidismo/Hipotiroidismo", 5, 1),
("Enfermedades de vías aéreas/asma", 5, 1),
("Enfermedades digestivas", 5, 1),
("Tuberculosis o vive con persona(s) con este padecimiento", 5, 1),
("Enfermedades de la piel", 5, 1),
("Trasplantes de órganos", 5, 1),
("¿Has sido hospitalizado?¿Cual fue el motivo?(en mujeres también anotar datos de parto)", 5, 5),
("¿Ha tomado algún medicamento recientemente?¿Cuál y por qué motivo?", 5, 5),
("¿Ha tenido algún problema con la anestesia dental o anestesia general?, ¿Cuál?", 5, 5),
("¿Es alérgico a algún medicamento o sustancia?, ¿Cuál?", 5, 5),
("(Solo para mujeres) ¿Está embarazada?, Meses de embarazo", 5, 1),
("Ampliar respuestas", 5, 3),
("Firma del paciente", 5, 6);

-- Examen clínico
INSERT INTO questions
(question_text,
fk_form_section,
fk_answer_type)
VALUES
("Paladar",9),
("Istmo de las fauces",9),
("Mucosa yugal",9),
("Nódulos linfáticos",9),
("Lengua",9),
("Piso de boca",9),
("Labios",9),
("Glándulas salivales",9),
("Encía",9),
("Frenillos",9),
("Saliva",9),
("Otras señas particulares",9);

-- Análisis funcional
INSERT INTO questions
(question_text,
fk_form_section,
fk_answer_type)
VALUES
("Deglución",10),
("Fonación masticación",10),
("Respiración",10),
("Observaciones",10);

-- Postura del paciente
INSERT INTO questions
(question_text,
fk_form_section,
fk_answer_type)
VALUES
("ATM – Palpación", 11);

-- examen bucal
INSERT INTO questions
(question_text,
fk_form_section,
fk_answer_type)
VALUES
("Relación molar: Derecha", 12),
("Relación canina: Derecha", 12)
;

-- Análisis radiográfico
INSERT INTO questions
(question_text,
fk_form_section,
fk_answer_type)
VALUES
("Periapical", 13),
("Cefálica lateral", 13),
("Panorámica", 13)
;

-- Mmodelo de estudio y fotografías
INSERT INTO questions
(question_text,
fk_form_section,
fk_answer_type)
VALUES
("Modelos de estudio", 14),
("Tipo de arcada", 14),
("Fotografías", 14)
;

-- Estudio de laboratotio biopsia
INSERT INTO questions
(question_text,
fk_form_section,
fk_answer_type)
VALUES
("Tipos de estudio de laboratorio", 15),
("Tipo de biopsia", 15),
("Región donde se realizó la biopsia", 15),
("Laboratorio donde se envía el estudio", 15)
;

-- interconsulta médica, como manejar la firma
INSERT INTO questions
(question_text,
fk_form_section,
fk_answer_type)
VALUES
("Nombre del médico", 16, 3),
("Razón de interconsulta", 16, 3),
("Motivo de diagnóstico presuntivo", 16, 3),
("Motivo de envío y servicio al que se envía", 16, 3)
("Diagnóstico", 16, 3),
("Pronóstico", 16, 3),
("Tratamiento y manejo integral", 16, 3),
("Estoy de total acuerdo con el diagnóstico y el tratamiento que se me va a realizar", 16, 1),
("Firma", 16, 6)
;