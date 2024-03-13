insert into viviendas values
    (01, 'Casa única en el terreno'),
    (02,'Casa que comparte terreno con otra(s)'),
    (03,'Casa dúplex'),
    (04, 'Departamento en edificio'),
    (05,'Vivienda en vecindad o cuartería'),
    (06, 'Vivienda en cuarto de azotea de un edificio'),
    (07, 'Local no construido para habitación'),
    (08, 'Vivienda móvil'),
    (09, 'Refugio'),
    (10, 'Viviendas colectivas'),
    (99, 'No especificado de vivienda particular')
    ;

    INSERT INTO tipo_sanguineo (id_tipo, tipo) VALUES
    (1, 'A+'),
    (2, 'A-'),
    (3, 'B+'),
    (4, 'B-'),
    (5, 'AB+'),
    (6, 'AB-'),
    (7, 'O+'),
    (8, 'O-');

    INSERT INTO compatibilidad_sanguinea (fk_tipo, fk_tipo_compatible) VALUES
    (1, 1), (1, 2), (1, 7), (1, 8),
    (2, 2), (2, 8),
    (3, 3), (3, 4), (3, 7), (3, 8),
    (4, 4), (4, 8),
    (5, 1), (5, 2), (5, 3), (5, 4), (5, 5), (5, 6), (5, 7), (5, 8),
    (6, 2), (6, 4), (6, 6), (6, 8),
    (7, 7), (7, 8),
    (8, 8);

    INSERT INTO grupos_etnicos (id_grupo, nombre) VALUES
    (1, 'Náhuatl'),
    (2, 'Maya'),
    (3, 'Zapoteco'),
    (4, 'Mixteco'),
    (5, 'Otomí'),
    (6, 'Totonaca'),
    (7, 'Tzotzil'),
    (8, 'Tzeltal'),
    (9, 'Mazahua'),
    (10, 'Mazateco'),
    (11, 'Huasteco'),
    (12, 'Chol'),
    (13, 'Purépecha'),
    (14, 'No especificada'),
    (15, 'Chinanteco'),
    (16, 'Mixe'),
    (17, 'Tlapaneco'),
    (18, 'Tarahumara'),
    (19, 'Mayo'),
    (20, 'Zoque'),
    (21, 'Chontal de Tabasco'),
    (22, 'Popoluca'),
    (23, 'Chatino'),
    (24, 'Amuzgo'),
    (25, 'Tojolabal'),
    (26, 'Huichol'),
    (27, 'Tepehuan'),
    (28, 'Triqui'),
    (29, 'Popoloca'),
    (30, 'Cora'),
    (31, 'Mame'),
    (32, 'Yaqui'),
    (33, 'Cuicateco'),
    (34, 'Huave'),
    (35, 'Tepehua'),
    (36, 'Chontal de Oaxaca'),
    (37, 'Kanjobal'),
    (38, 'Pame'),
    (39, 'Chichimeca Jonaz'),
    (40, 'Matlatzinca'),
    (41, 'Guarijío'),
    (42, 'Chuj'),
    (43, 'Chocho'),
    (44, 'Tacuate'),
    (45, 'Ocuilteco'),
    (46, 'Pima'),
    (47, 'Jacalteco'),
    (48, 'Kekchi'),
    (49, 'Otras lenguas indígenas de América'),
    (50, 'Lacandón'),
    (51, 'Ixcateco'),
    (52, 'Otras lenguas indígenas de México'),
    (53, 'Seri'),
    (54, 'Motocintleco'),
    (55, 'Cakchiquel'),
    (56, 'Quiche'),
    (57, 'Paipai'),
    (58, 'Papago'),
    (59, 'Cucapá'),
    (60, 'Kumiai'),
    (61, 'Kikapú'),
    (62, 'Cochimí'),
    (63, 'Ixil'),
    (64, 'Kiliwa'),
    (65, 'Aguacateco');

INSERT INTO religiones (id_religion, religion) VALUES
    ('110101', 'Católico Apostólico Romano'),
    ('110102', 'Católico Romano'),
    ('110103', 'Católico'),
    ('110104', 'Agustino'),
    ('110105', 'Amor Misericordioso'),
    ('110106', 'Asuncionista'),
    ('110107', 'Benedictino'),
    ('110108', 'Capuchino'),
    ('110109', 'Carmelita'),
    ('110110', 'Carmelita Descalza'),
    ('110111', 'Cisterciense'),
    ('110112', 'Claretiano'),
    ('110113', 'Clérigos San Viator'),
    ('110114', 'Comboniano'),
    ('110115', 'Comunidad Salesiana'),
    ('110116', 'Concepcionistas Franciscanos'),
    ('110117', 'Corazonista'),
    ('110118', 'Congregación de los Padres Bayonenses'),
    ('110119', 'Diócesis Maronita de México, Eparquía Nuestra Señora de los Mártires del Líbano'),
    ('110120', 'Dominico'),
    ('110121', 'Eparquía Greco-Melquita Católica'),
    ('110122', 'Ermitaño Eucarístico del Padre celestial'),
    ('110123', 'Esclavas de María Inmaculada'),
    ('110124', 'Escolapio'),
    ('110125', 'Eudista'),
    ('110126', 'Franciscano'),
    ('110127', 'Fraternidad Sacerdotal San Pío X (Lefebristas)'),
    ('110128', 'Guadalupano'),
    ('110129', 'Hermandad de Sacerdotes Operarios Diocesanos'),
    ('110130', 'Hermano de Nuestra Señora de Consolación en el Mundo'),
    ('110131', 'Hermano de San Juan de Dios'),
    ('110132', 'Hermanos Fossores de la Sagrada Misericordia'),
    ('110133', 'Hermano Obrero de María'),
    ('110134', 'Hijas de la Caridad de San Vicente de Paúl'),
    ('110135', 'Hijas de la Inmaculada Concepción'),
    ('110136', 'Hijas de María Auxiliadora'),
    ('110137', 'Hijas de San Pablo'),
    ('110138', 'Hijas del Divino Salvador'),
    ('110139', 'Hijas del Espíritu Santo'),
    ('110140', 'Hijos de la Sagrada Familia'),
    ('110141', 'Hijos de María Madre de la Iglesia'),
    ('110142', 'Hospitalario de San Juan de Dios'),
    ('110143', 'Iglesia Católica Apostólica Mexicana'),
    ('110144', 'Iglesia Católica de Rito Latino'),
    ('110145', 'Iglesia Madre'),
    ('110146', 'Instituto del Verbo Encarnado'),
    ('110147', 'Jerónimo'),
    ('110148', 'Jesuita'),
    ('110149', 'Lazarita'),
    ('110150', 'Legionarios de Cristo'),
    ('110151', 'Mantellata Sierva de María'),
    ('110152', 'Mercedaria del Santísimo Sacramento'),
    ('110153', 'Marista'),
    ('110154', 'Misionera de la Cruz'),
    ('110155', 'Misionera del Verbo Divino'),
    ('110156', 'Misionera Hija del Corazón de María'),
    ('110157', 'Misionero de Guadalupe'),
    ('110158', 'Misionero de la Inmaculada Concepción'),
    ('110159', 'Misionero del Espíritu Santo'),
    ('110160', 'Misionero Redentorista'),
    ('110161', 'Misionero Xaveriano en el Mundo'),
    ('110162', 'Monje de la Adoración'),
    ('110163', 'Nuestra Señora de la Consolación'),
    ('110164', 'Obra de Don Orione'),
    ('110165', 'Operario del Reino de Cristo'),
    ('110166', 'Orden de San Benito'),
    ('110167', 'Pasionista'),
    ('110168', 'Paulino'),
    ('110169', 'Pequeña Obra de la Divina Providencia'),
    ('110170', 'Religiosa de la Asunción'),
    ('110171', 'Religiosa de Nuestra Señora de Sión'),
    ('110172', 'Religiosa de San José de Gerona'),
    ('110173', 'Religiosa del Sagrado Corazón'),
    ('110174', 'Sagrado Corazón'),
    ('110175', 'Salesiano'),
    ('110176', 'San José de Tarbes'),
    ('110177', 'Servidor del Señor y la Virgen'),
    ('110178', 'Sierva de Jesús'),
    ('110179', 'Sierva de Jesús de la Caridad'),
    ('110180', 'Sierva de la Pasión'),
    ('110181', 'Siervo de María'),
    ('110182', 'Siervos de la Sagrada Familia'),
    ('110183', 'Sociedad de San Pablo'),
    ('110184', 'Sociedad de San Pío X'),
    ('110185', 'Terciaria Capuchina de la Sagrada Familia'),
    ('110186', 'Ursulina de la Unión Romana'),
    ('110187', 'Vicentino'),
    ('120101', 'Ortodoxo'),
    ('120102', 'Iglesia Católica Apostólica Ortodoxa'),
    ('120103', 'Iglesia Católica Apostólica Ortodoxa del Patriarca de Moscú'),
    ('120104', 'Iglesia Católica Griega'),
    ('120105', 'Iglesia Ortodoxa Católica'),
    ('120106', 'Cristianos Tradicionalistas'),
    ('120107', 'Iglesia Católica Apostólica Romana Reformada'),
    ('120108', 'Iglesia Católica de Cristo Internacional'),
    ('120109', 'Iglesia Católica de los Apóstoles de los Tiempos Posteriores'),
    ('120110', 'Iglesia Católica Nacional Mexicana'),
    ('120111', 'Iglesia Católica Tridentina Rito Latino'),
    ('120112', 'Sociedad Sacerdotal Trento'),
    ('120113', 'Unión Católica Trento Mexicana'),
    ('130100', 'Anabautista/Menonita'),
    ('130200', 'Anglicana/Episcopal'),
    ('130300', 'Bautista'),
    ('130400', 'Luterana'),
    ('130500', 'Metodista'),
    ('130600', 'Presbiteriana'),
    ('130701', 'Calvinista'),
    ('130702', 'Congregacional'),
    ('130703', 'Cuáquera'),
    ('130704', 'Otras protestantes'),
    ('131100', 'Amistad Cristiana'),
    ('131200', 'Asambleas de Dios'),
    ('131300', 'Iglesia Apostólica de la Fe en Cristo Jesús'),
    ('131400', 'Iglesia de Dios'),
    ('131500', 'Iglesia de Dios de la Profecía'),
    ('131600', 'Iglesia de Dios en México del Evangelio Completo'),
    ('131700', 'Príncipe de Paz'),
    ('131801', 'Casa de Oración'),
    ('131802', 'Centro de Fe, Esperanza y Amor de la Cruzada Misionera de Avivamiento'),
    ('131803', 'Centro de Fe, Esperanza y Amor Fuerza Ágape'),
    ('131804', 'Discípulos de Cristo'),
    ('131805', 'Ejército de Salvación'),
    ('131806', 'Fraternidad Pentecostés Independiente'),
    ('131807', 'Iglesia Agua Viva'),
    ('131808', 'Iglesia Aposento Alto'),
    ('131809', 'Iglesia Cristiana Espiritual'),
    ('131810', 'Iglesia Cristiana Evangélica Pentecostal'),
    ('131811', 'Iglesia Cristiana Independiente Pentecostés'),
    ('131812', 'Iglesia Cristiana Interdenominacional de la República Mexicana'),
    ('131813', 'Iglesia de Jesucristo sobre la Roca'),
    ('131814', 'Iglesia del Concilio Evangélico Pentecostal'),
    ('131815', 'Iglesia Evangélica Pentecostés Cristo Roca de mi Salvación'),
    ('131816', 'Iglesia Mexicana del Evangelio de Cristo Pentecostés'),
    ('131817', 'Iglesia Pentecostal Unida de México'),
    ('131818', 'Iglesia Universal del Reino de Dios'),
    ('131819', 'Iglesia Cristiana Solo Cristo Salva'),
    ('131820', 'Movimiento Iglesia Evangélica Pentecostés Independiente'),
    ('131821', 'Unión Nacional de Iglesias Cristianas Evangélicas (UNICE)'),
    ('131822', 'Unión de Iglesias Evangélicas Independientes'),
    ('131823', 'Unión Nacional de Iglesias Evangélicas Pentecostés Emmanuel'),
    ('131824', 'Otras asociaciones pentecostales'),
    ('132100', 'Iglesia Cristiana Interdenominacional'),
    ('132200', 'Iglesia del Dios Vivo, Columna y Apoyo de la Verdad, la Luz del Mundo'),
    ('132300', 'Iglesia de Cristo'),
    ('132400', 'Iglesia del Nazareno'),
    ('132500', 'Movimientos Sincréticos Judaicos Neoisraelitas'),
    ('132601', 'Iglesia Bíblica'),
    ('132602', 'Iglesia de Cristo Miel'),
    ('132603', 'Iglesia Evangélica Independiente de la República Mexicana'),
    ('132604', 'Iglesia Renovada de Jesucristo y los Apóstoles del Amor Divino'),
    ('132605', 'Otras cristianas evangélicas'),
    ('133100', 'Adventistas del Séptimo Día'),
    ('133200', 'Iglesia de Jesucristo de los Santos de los Últimos Días (Mormones)'),
    ('133300', 'Testigos de Jehová'),
    ('134100', 'Cristianas'),
    ('134200', 'Evangélicas'),
    ('134300', 'Pentecostales'),
    ('134400', 'Protestantes'),
    ('210101', 'Judaica'),
    ('220101', 'Islámicas'),
    ('220102', 'Chiíes'),
    ('220103', 'Jariyismo'),
    ('220104', 'Suníes'),
    ('220105', 'Sufismo'),
    ('230101', 'Budismo'),
    ('230201', 'Hinduismo'),
    ('230202', 'Hare Krishna'),
    ('230301', 'Bahaísmo'),
    ('230302', 'Centro Onkaranada'),
    ('230303', 'Confusionismo'),
    ('230304', 'Jainismo'),
    ('230305', 'Sijismo'),
    ('230306', 'Sintoísmo'),
    ('230307', 'Taoísmo'),
    ('230308', 'Zoroastrismo'),
    ('240101', 'New Age (Nueva era)'),
    ('240102', 'Ágora'),
    ('240103', 'Antroposofía'),
    ('240104', 'Centros de Tensegridad'),
    ('240105', 'Comunidad del Arco iris'),
    ('240106', 'Cuarto Camino'),
    ('240107', 'Esenios'),
    ('240108', 'Espiritualidad Nueva Era'),
    ('240109', 'Gran Fraternidad Blanca'),
    ('240110', 'Gran Fraternidad Universal'),
    ('240111', 'Instituto Arica'),
    ('240112', 'Metafísicos Cristianos'),
    ('240113', 'Nueva Acrópolis'),
    ('240114', 'Ciencia Esotérica'),
    ('240115', 'Gnosticismo'),
    ('240116', 'Masonería'),
    ('240117', 'Metafísica'),
    ('240118', 'Ocultismo'),
    ('240119', 'Rosacruces'),
    ('240120', 'Teosofía'),
    ('240121', 'Wicca'),
    ('250101', 'Chamanismo'),
    ('250102', 'El Costumbre'),
    ('250103', 'Huaxcam Dios Xastacná'),
    ('250104', 'In kantonal, Casa del Sol'),
    ('250105', 'Mexicáyotl'),
    ('250106', 'Movimiento Confederado Restaurador de la Cultura de Anáhuac'),
    ('250107', 'Regina'),
    ('250108', 'Toltecáyotl'),
    ('250109', 'Religiones indígenas'),
    ('260101', 'Origen afro'),
    ('260102', 'Rastafaris'),
    ('270101', 'Espiritualistas Eliasistas'),
    ('270102', 'Espiritualista'),
    ('270103', 'Espiritista'),
    ('270104', 'Espiritualistas Trinitarios Marianos'),
    ('270105', 'Espiritualista de la Tercera Era'),
    ('270106', 'Cristiana Espiritual'),
    ('270107', 'Sociedad Judictora Reinado de Leonardo Alcalá Leos'),
    ('270108', 'Espiritualista Fe, Esperanza y Caridad, Jesús de la Montaña'),
    ('270109', 'Espiritualista para el Divino Maestro y la Pureza de María'),
    ('270110', 'Las Tres Potencias Padre, Hijo y Espíritu Santo'),
    ('270111', 'La Luz y Esperanza'),
    ('270112', 'Iglesia Mexicana La Mujer Hermosa Vestida de Sol'),
    ('270113', 'Espíritu Santo, Pureza, Amor y Luz'),
    ('280101', 'Iglesia Fidencista Cristiana'),
    ('280102', 'Apostólica Tradicional México-USA (Santa Muerte)'),
    ('280103', 'Culto a Jesús Malverde'),
    ('280104', 'Nueva Jerusalén'),
    ('280105', 'San Pascualito'),
    ('290101', 'Ananda Marga'),
    ('290102', 'Ciencia Cristiana'),
    ('290103', 'Cienciología o Dianética'),
    ('290104', 'Contacto Angélico'),
    ('290105', 'Creciendo en Gracia'),
    ('290106', 'Eckankar'),
    ('290107', 'Iglesia de la Unificación'),
    ('290108', 'Loordista'),
    ('290109', 'Meditación Trascendental'),
    ('290110', 'Misión Rama'),
    ('290111', 'Movimiento del Sendero Interior del Alma (MSIA)'),
    ('290112', 'Movimiento Raeliano'),
    ('290113', 'Niños de Dios'),
    ('290114', 'Pacal Votán'),
    ('290115', 'Palmar de Troya'),
    ('290116', 'Santa Iglesia Tao Cristiana Espiritual'),
    ('290117', 'Sociedad de Ascensión(Ishayas)'),
    ('290118', 'Sri Sathya Sai Baba'),
    ('290119', 'Otros nuevos movimientos religiosos'),
    ('310101', 'Ninguna religión'),
    ('310201', 'Ateos'),
    ('310301', 'Agnósticos'),
    ('310401', 'Sin adscripción religiosa (creyentes)'),
    ('999999', 'Religión no especificada');
