-- secciones padre
INSERT INTO form_sections
(form_name)
VALUES
("Signos vitales"),
("Exámen facial"),
("Antecedentes Heredofamiliares"),
("Antecedentes personales no patológicos"),
("Antecedentes personales patológicos"),
("Odontograma inicial"),
("Odontograma final"),
("Medición de bolsas inicial"),
("Exámen clínico"),
("Análisis funcional"),
("Postura del paciente"),
("Exámen bucal"),
("Análisis radiográfico"),
("Modelos de estudio de fotografías"),
("Estudio de laboratorio/biopsia"),
("Interconsulta médica"),
("Consentimiento informado"),
("Nota de evolución")
;

-- secciones hijas
INSERT INTO form_sections
(form_name, fk_parent_section)
VALUES
("Clasificación de Angle", 12)
;