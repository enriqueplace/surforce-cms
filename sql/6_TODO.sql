-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faqs`
--
CREATE DATABASE `cms` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs` (
  `id` int(50) NOT NULL auto_increment,
  `pregunta` varchar(250) collate utf8_unicode_ci NOT NULL,
  `respuesta` varchar(250) collate utf8_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `faqs`
--

INSERT INTO `faqs` VALUES (1, '¿Cómo se hace para conseguir el login del sistema?', 'Deberá contactarse con el owner del proyecto a través de un email', '2007-08-09 01:07:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `item` varchar(45) collate utf8_spanish_ci NOT NULL,
  `destino` varchar(255) collate utf8_spanish_ci NOT NULL,
  `posicion` smallint(4) NOT NULL default '0',
  `privado` char(1) collate utf8_spanish_ci NOT NULL default '1',
  `estado` char(1) character set latin1 collate latin1_bin NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `menu`
--

INSERT INTO `menu` VALUES (1, 'ABM Noticias', '/noticias/noticias/', 1, '1', 0x31);
INSERT INTO `menu` VALUES (2, 'FAQ', '/faqs/faqs/', 10, '0', 0x31);
INSERT INTO `menu` VALUES (5, 'home', '/', 0, '0', 0x31);
INSERT INTO `menu` VALUES (6, 'Introducción', '/paginas/paginas/ver/id/7', 4, '0', 0x31);
INSERT INTO `menu` VALUES (7, 'Investigación', '/paginas/paginas/ver/id/8', 5, '0', 0x31);
INSERT INTO `menu` VALUES (8, 'ABM Menu', '/menu/menu/', 9, '1', 0x31);
INSERT INTO `menu` VALUES (9, 'prueba item deshabilitado', '/noticias/noticias/', 8, '1', 0x30);
INSERT INTO `menu` VALUES (10, 'ABM Páginas', '/paginas/paginas/', 7, '1', 0x31);
INSERT INTO `menu` VALUES (11, 'ABM Usuarios', '/usuarios/usuarios/', 12, '1', 0x31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

DROP TABLE IF EXISTS `noticias`;
CREATE TABLE `noticias` (
  `id` int(10) NOT NULL auto_increment,
  `titulo` varchar(150) collate utf8_spanish_ci NOT NULL,
  `contenido` text collate utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `noticias`
--

INSERT INTO `noticias` VALUES (1, 'Ejecutivo califica de terroristas a los piqueteros de Gualeguaychú', '<p>El canciller Reinaldo Gargano dijo que para el gobierno las amenazas de los ambientalistas argentinos son de car&aacute;cter terrorista. ', '2007-08-01 01:15:13', 1);
INSERT INTO `noticias` VALUES (3, 'Leyenda infinita', 'Decenas de miles de aficionados de la música de Elvis Presley se han dado cita esta semana en Memphis, Tennessee para rendir tributo a El Rey', '2007-08-01 01:25:40', 0);
INSERT INTO `noticias` VALUES (5, 'Accidentes se cobran casi 100 víctimas en solo 12 días', 'Las cifras de accidente del mes de agosto tienen particularmente preocupadas a las autoridades de tránsito. ', '2007-08-14 01:09:37', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paginas`
--

DROP TABLE IF EXISTS `paginas`;
CREATE TABLE `paginas` (
  `id` int(10) NOT NULL auto_increment,
  `titulo` varchar(150) collate utf8_spanish_ci NOT NULL,
  `contenido` text collate utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `paginas`
--

INSERT INTO `paginas` VALUES (1, 'Declaran esencialidad de servicios quirúrgicos', 'Tras el Consejo de Ministros', '2007-08-01 01:15:13', 1);
INSERT INTO `paginas` VALUES (3, 'pagina2', 'contenido de la segunda pagina', '2007-08-01 01:25:40', 0);
INSERT INTO `paginas` VALUES (5, 'Primer página con TinyMCE', 'Mmm... cómo se verá esto?', '2007-08-13 20:32:18', 0);
INSERT INTO `paginas` VALUES (6, 'Sin festejos, Fidel cumple añs', '<img src="http://www.elpais.com.uy/07/08/13/33742_298.JPG" alt="Fidel" title="Fidel Castro" width="298" height="255" align="right" />La Habana', '2007-08-14 01:23:57', 0);
INSERT INTO `paginas` VALUES (7, 'Introducción', 'Uruguay explota recursos naturales pesqueros del Océano Atlántico Sud Occidental', '2007-08-16 02:22:55', 0);
INSERT INTO `paginas` VALUES (8, 'Investigación', 'La Investigación Científica de los Recursos Pesqueros', '2007-08-16 02:28:01', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `styles_propiedades`
--

DROP TABLE IF EXISTS `styles_propiedades`;
CREATE TABLE `styles_propiedades` (
  `id_propiedad` int(11) NOT NULL auto_increment,
  `propiedad` varchar(32) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id_propiedad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `styles_propiedades`
--

INSERT INTO `styles_propiedades` VALUES (1, 'azimuth');
INSERT INTO `styles_propiedades` VALUES (2, 'background');
INSERT INTO `styles_propiedades` VALUES (3, 'background-attachment');
INSERT INTO `styles_propiedades` VALUES (4, 'background-color');
INSERT INTO `styles_propiedades` VALUES (5, 'background-image');
INSERT INTO `styles_propiedades` VALUES (6, 'background-position');
INSERT INTO `styles_propiedades` VALUES (7, 'background-repeat');
INSERT INTO `styles_propiedades` VALUES (8, 'border');
INSERT INTO `styles_propiedades` VALUES (9, 'border-collapse');
INSERT INTO `styles_propiedades` VALUES (10, 'border-color');
INSERT INTO `styles_propiedades` VALUES (11, 'border-spacing');
INSERT INTO `styles_propiedades` VALUES (12, 'border-style');
INSERT INTO `styles_propiedades` VALUES (13, 'border-top');
INSERT INTO `styles_propiedades` VALUES (14, 'border-right');
INSERT INTO `styles_propiedades` VALUES (15, 'border-bottom');
INSERT INTO `styles_propiedades` VALUES (16, 'border-left');
INSERT INTO `styles_propiedades` VALUES (17, 'border-right-color');
INSERT INTO `styles_propiedades` VALUES (18, 'border-top-color');
INSERT INTO `styles_propiedades` VALUES (19, 'border-bottom-color');
INSERT INTO `styles_propiedades` VALUES (20, 'border-left-color');
INSERT INTO `styles_propiedades` VALUES (21, 'border-top-style');
INSERT INTO `styles_propiedades` VALUES (22, 'border-right-style');
INSERT INTO `styles_propiedades` VALUES (23, 'border-bottom-style');
INSERT INTO `styles_propiedades` VALUES (24, 'border-left-style');
INSERT INTO `styles_propiedades` VALUES (25, 'border-top-width');
INSERT INTO `styles_propiedades` VALUES (26, 'border-right-width');
INSERT INTO `styles_propiedades` VALUES (27, 'border-bottom-width');
INSERT INTO `styles_propiedades` VALUES (28, 'border-left-width');
INSERT INTO `styles_propiedades` VALUES (29, 'border-width');
INSERT INTO `styles_propiedades` VALUES (30, 'bottom');
INSERT INTO `styles_propiedades` VALUES (31, 'caption-side');
INSERT INTO `styles_propiedades` VALUES (32, 'clear');
INSERT INTO `styles_propiedades` VALUES (33, 'clip');
INSERT INTO `styles_propiedades` VALUES (34, 'color');
INSERT INTO `styles_propiedades` VALUES (35, 'content');
INSERT INTO `styles_propiedades` VALUES (36, 'counter-increment');
INSERT INTO `styles_propiedades` VALUES (37, 'counter-reset');
INSERT INTO `styles_propiedades` VALUES (38, 'cue');
INSERT INTO `styles_propiedades` VALUES (39, 'cue-after');
INSERT INTO `styles_propiedades` VALUES (40, 'cue-before');
INSERT INTO `styles_propiedades` VALUES (41, 'cursor');
INSERT INTO `styles_propiedades` VALUES (42, 'direction');
INSERT INTO `styles_propiedades` VALUES (43, 'display');
INSERT INTO `styles_propiedades` VALUES (44, 'elevation');
INSERT INTO `styles_propiedades` VALUES (45, 'empty-cells');
INSERT INTO `styles_propiedades` VALUES (46, 'float');
INSERT INTO `styles_propiedades` VALUES (47, 'font');
INSERT INTO `styles_propiedades` VALUES (48, 'font-family');
INSERT INTO `styles_propiedades` VALUES (49, 'font-size');
INSERT INTO `styles_propiedades` VALUES (50, 'font-size-adjust');
INSERT INTO `styles_propiedades` VALUES (51, 'font-stretch');
INSERT INTO `styles_propiedades` VALUES (52, 'font-style');
INSERT INTO `styles_propiedades` VALUES (53, 'font-variant');
INSERT INTO `styles_propiedades` VALUES (54, 'heightfont-weight');
INSERT INTO `styles_propiedades` VALUES (55, 'left');
INSERT INTO `styles_propiedades` VALUES (56, 'letter-spacing');
INSERT INTO `styles_propiedades` VALUES (57, 'line-height');
INSERT INTO `styles_propiedades` VALUES (58, 'list-style');
INSERT INTO `styles_propiedades` VALUES (59, 'list-style-image');
INSERT INTO `styles_propiedades` VALUES (60, 'list-style-position');
INSERT INTO `styles_propiedades` VALUES (61, 'list-style-type');
INSERT INTO `styles_propiedades` VALUES (62, 'margin');
INSERT INTO `styles_propiedades` VALUES (63, 'margin-top');
INSERT INTO `styles_propiedades` VALUES (64, 'margin-right');
INSERT INTO `styles_propiedades` VALUES (65, 'margin-bottom');
INSERT INTO `styles_propiedades` VALUES (66, 'margin-left');
INSERT INTO `styles_propiedades` VALUES (67, 'marker-offset');
INSERT INTO `styles_propiedades` VALUES (68, 'marks');
INSERT INTO `styles_propiedades` VALUES (69, 'max-height');
INSERT INTO `styles_propiedades` VALUES (70, 'max-width');
INSERT INTO `styles_propiedades` VALUES (71, 'min-height');
INSERT INTO `styles_propiedades` VALUES (72, 'min-width');
INSERT INTO `styles_propiedades` VALUES (73, 'orphans');
INSERT INTO `styles_propiedades` VALUES (74, 'outline');
INSERT INTO `styles_propiedades` VALUES (75, 'outline-color');
INSERT INTO `styles_propiedades` VALUES (76, 'outline-style');
INSERT INTO `styles_propiedades` VALUES (77, 'outline-width');
INSERT INTO `styles_propiedades` VALUES (78, 'overflow');
INSERT INTO `styles_propiedades` VALUES (79, 'padding');
INSERT INTO `styles_propiedades` VALUES (80, 'padding-top');
INSERT INTO `styles_propiedades` VALUES (81, 'padding-right');
INSERT INTO `styles_propiedades` VALUES (82, 'padding-bottom');
INSERT INTO `styles_propiedades` VALUES (83, 'padding-left');
INSERT INTO `styles_propiedades` VALUES (84, 'page');
INSERT INTO `styles_propiedades` VALUES (85, 'page-break-after');
INSERT INTO `styles_propiedades` VALUES (86, 'page-break-before');
INSERT INTO `styles_propiedades` VALUES (87, 'age-break-inside');
INSERT INTO `styles_propiedades` VALUES (88, 'pause');
INSERT INTO `styles_propiedades` VALUES (89, 'pause-after');
INSERT INTO `styles_propiedades` VALUES (90, 'pause-before');
INSERT INTO `styles_propiedades` VALUES (91, 'pitch');
INSERT INTO `styles_propiedades` VALUES (92, 'pitch-range');
INSERT INTO `styles_propiedades` VALUES (93, 'play-during');
INSERT INTO `styles_propiedades` VALUES (94, 'position');
INSERT INTO `styles_propiedades` VALUES (95, 'quotes');
INSERT INTO `styles_propiedades` VALUES (96, 'richness');
INSERT INTO `styles_propiedades` VALUES (97, 'right');
INSERT INTO `styles_propiedades` VALUES (98, 'size');
INSERT INTO `styles_propiedades` VALUES (99, 'speak');
INSERT INTO `styles_propiedades` VALUES (100, 'speak-header');
INSERT INTO `styles_propiedades` VALUES (101, 'speak-numeral');
INSERT INTO `styles_propiedades` VALUES (102, 'speak-punctuation');
INSERT INTO `styles_propiedades` VALUES (103, 'speech-rate');
INSERT INTO `styles_propiedades` VALUES (104, 'tress');
INSERT INTO `styles_propiedades` VALUES (105, 'table-layout');
INSERT INTO `styles_propiedades` VALUES (106, 'text-align');
INSERT INTO `styles_propiedades` VALUES (107, 'text-decoration');
INSERT INTO `styles_propiedades` VALUES (108, 'text-indent');
INSERT INTO `styles_propiedades` VALUES (109, 'text-shadow');
INSERT INTO `styles_propiedades` VALUES (110, 'text-transform');
INSERT INTO `styles_propiedades` VALUES (111, 'top');
INSERT INTO `styles_propiedades` VALUES (112, 'unicode-bidi');
INSERT INTO `styles_propiedades` VALUES (113, 'vertical-align');
INSERT INTO `styles_propiedades` VALUES (114, 'visibility');
INSERT INTO `styles_propiedades` VALUES (115, 'voice-family');
INSERT INTO `styles_propiedades` VALUES (116, 'volume');
INSERT INTO `styles_propiedades` VALUES (117, 'white-space');
INSERT INTO `styles_propiedades` VALUES (118, 'widows');
INSERT INTO `styles_propiedades` VALUES (119, 'width');
INSERT INTO `styles_propiedades` VALUES (120, 'word-spacing');
INSERT INTO `styles_propiedades` VALUES (121, 'z-index');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `styles_propiedades_x_selectores`
--

DROP TABLE IF EXISTS `styles_propiedades_x_selectores`;
CREATE TABLE `styles_propiedades_x_selectores` (
  `id_selector` int(11) NOT NULL,
  `id_propiedad` int(11) NOT NULL,
  `valor` varchar(64) collate utf8_spanish_ci default NULL,
  PRIMARY KEY  (`id_selector`,`id_propiedad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `styles_propiedades_x_selectores`
--

INSERT INTO `styles_propiedades_x_selectores` VALUES (1, 62, '5px');
INSERT INTO `styles_propiedades_x_selectores` VALUES (1, 48, 'Verdana, Arial, Helvetica, sans-serif');
INSERT INTO `styles_propiedades_x_selectores` VALUES (1, 49, '11px');
INSERT INTO `styles_propiedades_x_selectores` VALUES (2, 49, '22px');
INSERT INTO `styles_propiedades_x_selectores` VALUES (3, 62, '0 auto');
INSERT INTO `styles_propiedades_x_selectores` VALUES (4, 66, '10px');
INSERT INTO `styles_propiedades_x_selectores` VALUES (4, 79, '0');
INSERT INTO `styles_propiedades_x_selectores` VALUES (5, 46, 'left');
INSERT INTO `styles_propiedades_x_selectores` VALUES (5, 78, 'hidden');
INSERT INTO `styles_propiedades_x_selectores` VALUES (5, 119, '150px');
INSERT INTO `styles_propiedades_x_selectores` VALUES (6, 16, '1px solid #CCCCCC');
INSERT INTO `styles_propiedades_x_selectores` VALUES (6, 46, 'left');
INSERT INTO `styles_propiedades_x_selectores` VALUES (6, 79, '15px');
INSERT INTO `styles_propiedades_x_selectores` VALUES (6, 119, '550px');
INSERT INTO `styles_propiedades_x_selectores` VALUES (7, 13, '1px solid #CCCCCC');
INSERT INTO `styles_propiedades_x_selectores` VALUES (7, 32, 'both');
INSERT INTO `styles_propiedades_x_selectores` VALUES (7, 106, 'center');
INSERT INTO `styles_propiedades_x_selectores` VALUES (7, 119, '100%');
INSERT INTO `styles_propiedades_x_selectores` VALUES (8, 4, '#CCCC00');
INSERT INTO `styles_propiedades_x_selectores` VALUES (8, 79, '0 3px 0 3px');
INSERT INTO `styles_propiedades_x_selectores` VALUES (9, 14, '1px solid #f0f0f0');
INSERT INTO `styles_propiedades_x_selectores` VALUES (9, 15, '1px solid #f0f0f0');
INSERT INTO `styles_propiedades_x_selectores` VALUES (9, 79, '2px');
INSERT INTO `styles_propiedades_x_selectores` VALUES (10, 43, 'block');
INSERT INTO `styles_propiedades_x_selectores` VALUES (10, 46, 'left');
INSERT INTO `styles_propiedades_x_selectores` VALUES (10, 106, 'right');
INSERT INTO `styles_propiedades_x_selectores` VALUES (10, 119, '150px');
INSERT INTO `styles_propiedades_x_selectores` VALUES (11, 66, '100px');
INSERT INTO `styles_propiedades_x_selectores` VALUES (12, 34, '#FF0000');
INSERT INTO `styles_propiedades_x_selectores` VALUES (12, 62, '10px');
INSERT INTO `styles_propiedades_x_selectores` VALUES (13, 119, '205px');
INSERT INTO `styles_propiedades_x_selectores` VALUES (14, 46, 'right');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `styles_selectores`
--

DROP TABLE IF EXISTS `styles_selectores`;
CREATE TABLE `styles_selectores` (
  `id_selector` int(11) NOT NULL auto_increment,
  `selector` varchar(64) collate utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) collate utf8_spanish_ci default NULL,
  PRIMARY KEY  (`id_selector`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `styles_selectores`
--

INSERT INTO `styles_selectores` VALUES (1, 'BODY', 'Cuerpo principal de la pagina.');
INSERT INTO `styles_selectores` VALUES (2, 'H1', 'Titulos');
INSERT INTO `styles_selectores` VALUES (3, 'DIV#contenedor', '');
INSERT INTO `styles_selectores` VALUES (4, 'DIV#menu ul, DIV#menu li', '');
INSERT INTO `styles_selectores` VALUES (5, 'DIV#menu', '');
INSERT INTO `styles_selectores` VALUES (6, 'DIV#contenido', '');
INSERT INTO `styles_selectores` VALUES (7, 'DIV#pie', '');
INSERT INTO `styles_selectores` VALUES (8, 'TH', '');
INSERT INTO `styles_selectores` VALUES (9, 'TD', '');
INSERT INTO `styles_selectores` VALUES (10, 'label', '');
INSERT INTO `styles_selectores` VALUES (11, 'DIV#formbutton', '');
INSERT INTO `styles_selectores` VALUES (12, 'DIV#mensaje', '');
INSERT INTO `styles_selectores` VALUES (13, 'DIV#boton_formulario', '');
INSERT INTO `styles_selectores` VALUES (14, 'DIV#boton_formulario INPUT', 'Botones de formularios');
INSERT INTO `styles_selectores` VALUES (15, 'DIV#logueado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `usuario` varchar(32) collate utf8_spanish_ci NOT NULL,
  `password` varchar(32) collate utf8_spanish_ci NOT NULL,
  `nombre` varchar(40) collate utf8_spanish_ci NOT NULL,
  `apellido` varchar(40) collate utf8_spanish_ci NOT NULL,
  `mail` varchar(64) collate utf8_spanish_ci default NULL,
  `estado` int(2) NOT NULL,
  `creado` datetime NOT NULL,
  `modificado` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` VALUES (1, 'homero', 'clave', 'Homero''s', 'Simpson', 'homero@springfield.com', 1, '2007-07-03 21:11:50', '2007-07-26 01:17:25');
INSERT INTO `usuarios` VALUES (2, 'apu', 'clave', 'Apu', 'Nahasapeemapetilon', 'apu@springfield.com', 1, '2007-07-03 23:22:09', '2007-07-03 23:32:19');
INSERT INTO `usuarios` VALUES (4, 'montgomery', 'clave', 'Montgomery', 'Burns', 'montgomery@springfield.com', 0, '2007-07-03 23:25:26', '2007-07-03 23:25:26');
INSERT INTO `usuarios` VALUES (5, 'kent', 'clave', 'Kent', 'Brockman', 'kent@springfield.com', 1, '2007-07-03 23:25:26', '2007-07-03 23:25:26');
INSERT INTO `usuarios` VALUES (6, 'eplace', 'pepe', 'Enrique', 'Place', 'enriqueplace@gmail.com', 1, '2007-07-25 23:45:28', '2007-07-25 23:45:28');
