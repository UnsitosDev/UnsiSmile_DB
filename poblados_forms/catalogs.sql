INSERT INTO catalogs
(catalog_name)
VALUES
("Perfil facial"),
("Morfología facial")
;


INSERT INTO catalog_options
(fk_catalog,
option_name)
VALUES
( 1, "Recto"),
( 1, "Cóncavo"),
( 1, "Convexo"),
( 2, "Braquifacial"),
( 2, "Normofacial"),
( 2, "Dolicofacial")
;