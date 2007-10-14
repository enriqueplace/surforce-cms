-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faqs`
--
CREATE DATABASE `cms` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;

-- phpMyAdmin SQL Dump
-- version 2.11.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-10-2007 a las 11:06:37
-- Versión del servidor: 5.0.45
-- Versión de PHP: 5.2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de datos: `cms`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faqs`
--

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs` (
  `id` int(50) NOT NULL auto_increment,
  `pregunta` varchar(250) character set utf8 collate utf8_unicode_ci NOT NULL,
  `respuesta` varchar(250) character set utf8 collate utf8_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `faqs`
--

INSERT INTO `faqs` (`id`, `pregunta`, `respuesta`, `fecha`) VALUES
(1, 'Â¿CÃ³mo se hace para conseguir el login del sistema?', 'DeberÃ¡ contactarse con el owner del proyecto a travÃ©s de un email', '2007-10-14 00:21:14');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=12 ;

--
-- Volcar la base de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `item`, `destino`, `posicion`, `privado`, `estado`) VALUES
(1, 'ABM Noticias', '/noticias/noticias/', 1, '1', '1'),
(2, 'FAQ', '/faqs/faqs/', 10, '0', '1'),
(5, 'home', '/', 0, '0', '1'),
(6, 'IntroducciÃ³n', '/paginas/paginas/ver/id/7', 4, '0', '1'),
(7, 'InvestigaciÃ³n', '/paginas/paginas/ver/id/8', 5, '0', '1'),
(8, 'ABM Menu', '/menu/menu/', 9, '1', '1'),
(9, 'prueba item deshabilitado', '/noticias/noticias/', 8, '1', '0'),
(10, 'ABM PÃ¡ginas', '/paginas/paginas/', 7, '1', '1'),
(11, 'ABM Usuarios', '/usuarios/usuarios/', 12, '1', '1');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=9 ;

--
-- Volcar la base de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `contenido`, `fecha`, `id_usuario`) VALUES
(1, 'Ejecutivo califica de terroristas a los piqueteros de GualeguaychÃº', '<p>El canciller Reinaldo Gargano dijo que para el gobierno las amenazas de los ambientalistas argentinos son de car&aacute;cter terrorista.</p>', '2007-08-01 01:15:13', 1),
(3, 'Leyenda infinita', '<p>Decenas de miles de aficionados de la m&uacute;sica de Elvis Presley se han dado cita esta semana en Memphis, Tennessee para rendir tributo a El Rey</p>', '2007-08-01 01:25:40', 0),
(5, 'Accidentes se cobran casi 100 vÃ­ctimas en solo 12 dÃ­as', '<p>Las cifras de accidente del mes de agosto tienen particularmente preocupadas a las autoridades de tr&aacute;nsito.</p>', '2007-08-14 01:09:37', 0),
(6, 'En los Andes', '<p><img width="173" height="115" align="left" alt="" src="../../../../../userfiles/andes.JPG" /><span class="hom_not_detallegrande">El arriero chileno Sergio Catal&aacute;n, quien encontrara a Parrado y Canessa. Hoy habr&aacute; una cena especial en el restaurante La Casa Violeta. Ma&ntilde;ana se jugar&aacute; el partido de rugby que no se pudo cumplir por el accidente ocurrido en octubre de 1972.</span></p>\r\n<p>&nbsp;Hoy se cumplen 35 a&ntilde;os de la tragedia, y posterior milagro, de Los Andres. Desde ayer est&aacute; en Uruguay Sergio Catal&aacute;n, el arriero chileno que auxili&oacute; a Fernando Parrado y Roberto Canessa cuando &eacute;stos llevaban 10 d&iacute;as caminando por la cordillera en busca de ayuda. Catal&aacute;n est&aacute; participando en una serie de actividades por la fecha aniversario.</p>\r\n<p><strong>Ma&ntilde;ana tendr&aacute; lugar el partido simb&oacute;lico entre Old Boys de Chile y Old Christian de Uruguay, el que no pudo jugarse en octubre de 1972 por el accidente.</strong></p>\r\n<p>Sergio Catal&aacute;n lleg&oacute; al mediod&iacute;a al Aeropuerto de Carrasco y sobre las 16 horas mantuvo un encuentro con el vicepresidente de la Rep&uacute;blica, Rodolfo Nin Novoa, quien le obsequi&oacute; una plaqueta en agradecimiento por haber salvado la vida de los rugbistas compatriotas.</p>\r\n<p>Dos horas m&aacute;s tarde, Catal&aacute;n estuvo en una conferencia de prensa en el Hotel Cotagge, y hoy cenar&aacute; junto a los uruguayos y los chilenos en un agasajo en el restaurante La Casa Violeta.</p>\r\n<p>Catal&aacute;n, de 80 a&ntilde;os, fue sometido este a&ntilde;o a una operaci&oacute;n de implante de cadera que fue posible gracias a las gestiones encabezadas, en nombre de sus compa&ntilde;eros, por el m&eacute;dico Roberto Canessa.</p>\r\n<p>EL ACCIDENTE. El viernes 13 de octubre de 1972 un avi&oacute;n uruguayo, que llevaba 45 pasajeros a Chile, de los cuales muchos no sobrepasaban los 20 a&ntilde;os, se estrell&oacute; en la Cordillera de los Andes.</p>\r\n<p>Los sobrevivientes tuvieron que soportar, entre otras cosas, hambre y temperaturas de treinta grados bajo cero.</p>\r\n<p>Desesperados ante la ausencia de alimentos y agotada su resistencia f&iacute;sica, se vieron obligados a alimentarse de sus compa&ntilde;eros muertos. Finalmente, hartos de las baj&iacute;simas temperaturas, los amenazadores aludes y la lenta espera del rescate, Parrado y Canessa deciden cruzar las monta&ntilde;as para as&iacute; llegar a Chile.</p>\r\n<p>De esta manera el 22 de diciembre de 1972, despu&eacute;s de estar durante 72 d&iacute;as aislados, el mundo se entera que hubo 16 sobrevivientes.</p>\r\n<p>El Pa&iacute;s</p>\r\n<p>&nbsp;</p>', '2007-10-13 19:58:03', 0),
(7, '"Â¿Los escritorios llegarÃ¡n a ser tan reales?"', '<p>&nbsp;</p>\r\n<object width="425" height="350"><param name="movie" value="http://www.youtube.com/v/M0ODskdEPnQ"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/M0ODskdEPnQ" type="application/x-shockwave-flash" wmode="transparent" width="425" height="350"></embed></object>\r\n\r\n<p>Este es un video de una nueva interfaz de escritorio que emula la un &quot;escritorio real&quot;.</p>', '2007-10-14 00:05:26', 0),
(8, 'UbicaciÃ³n del Monumento al Gaucho', '<p><iframe width="425" scrolling="no" height="350" frameborder="0" marginheight="0" marginwidth="0" src="http://maps.google.com/?ie=UTF8&amp;ll=-34.905669,-56.182902&amp;spn=0.00483,0.008669&amp;t=h&amp;z=17&amp;om=1&amp;output=embed&amp;s=AARTsJqzARj-Z8VnW5pkPMLMmZbqrJcYpw"></iframe><br />\r\n<small><a href="http://maps.google.com/?ie=UTF8&amp;ll=-34.905669,-56.182902&amp;spn=0.00483,0.008669&amp;t=h&amp;z=17&amp;om=1&amp;source=embed" style="color: rgb(0, 0, 255); text-align: left;">Ver mapa m&aacute;s grande</a></small></p>\r\n<p>Aqu&iacute; queda la Dinara</p>', '2007-10-14 00:08:36', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=10 ;

--
-- Volcar la base de datos para la tabla `paginas`
--

INSERT INTO `paginas` (`id`, `titulo`, `contenido`, `fecha`, `id_usuario`) VALUES
(1, 'Declaran esencialidad de servicios quirÃºrgicos', 'Tras el Consejo de Ministros', '2007-08-01 01:15:13', 1),
(3, 'pagina2', 'contenido de la segunda pagina', '2007-08-01 01:25:40', 0),
(5, 'Primer pÃ¡gina con TinyMCE', 'Mmm... c&oacute;mo se ve esto?', '2007-08-13 20:32:18', 0),
(6, 'Sin festejos, Fidel cumple aÃ±os', '<img src="http://www.elpais.com.uy/07/08/13/33742_298.JPG" alt="Fidel" title="Fidel Castro" width="298" height="255" align="right" />La Habana', '2007-08-14 01:23:57', 0),
(7, 'IntroducciÃ³n', 'Uruguay explota recursos naturales pesqueros del Oc&eacute;ano Atl&aacute;ntico Sud Occidental', '2007-08-16 02:22:55', 0),
(8, 'InvestigaciÃ³n', 'La Investigaci&oacute;n Cient&iacute;fica de los Recursos Pesqueros', '2007-08-16 02:28:01', 0),
(9, 'PÃ¡gina de 14/10/2007', '<p><em>Nueva p&aacute;gina del d&iacute;a de hoy<img alt="" src="/surforce-cms/public/scripts/fckeditor/editor/images/smiley/msn/cry_smile.gif" /></em></p>', '2007-10-14 00:29:37', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `styles_propiedades`
--

DROP TABLE IF EXISTS `styles_propiedades`;
CREATE TABLE `styles_propiedades` (
  `id_propiedad` int(11) NOT NULL auto_increment,
  `propiedad` varchar(32) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id_propiedad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=122 ;

--
-- Volcar la base de datos para la tabla `styles_propiedades`
--

INSERT INTO `styles_propiedades` (`id_propiedad`, `propiedad`) VALUES
(1, 'azimuth'),
(2, 'background'),
(3, 'background-attachment'),
(4, 'background-color'),
(5, 'background-image'),
(6, 'background-position'),
(7, 'background-repeat'),
(8, 'border'),
(9, 'border-collapse'),
(10, 'border-color'),
(11, 'border-spacing'),
(12, 'border-style'),
(13, 'border-top'),
(14, 'border-right'),
(15, 'border-bottom'),
(16, 'border-left'),
(17, 'border-right-color'),
(18, 'border-top-color'),
(19, 'border-bottom-color'),
(20, 'border-left-color'),
(21, 'border-top-style'),
(22, 'border-right-style'),
(23, 'border-bottom-style'),
(24, 'border-left-style'),
(25, 'border-top-width'),
(26, 'border-right-width'),
(27, 'border-bottom-width'),
(28, 'border-left-width'),
(29, 'border-width'),
(30, 'bottom'),
(31, 'caption-side'),
(32, 'clear'),
(33, 'clip'),
(34, 'color'),
(35, 'content'),
(36, 'counter-increment'),
(37, 'counter-reset'),
(38, 'cue'),
(39, 'cue-after'),
(40, 'cue-before'),
(41, 'cursor'),
(42, 'direction'),
(43, 'display'),
(44, 'elevation'),
(45, 'empty-cells'),
(46, 'float'),
(47, 'font'),
(48, 'font-family'),
(49, 'font-size'),
(50, 'font-size-adjust'),
(51, 'font-stretch'),
(52, 'font-style'),
(53, 'font-variant'),
(54, 'heightfont-weight'),
(55, 'left'),
(56, 'letter-spacing'),
(57, 'line-height'),
(58, 'list-style'),
(59, 'list-style-image'),
(60, 'list-style-position'),
(61, 'list-style-type'),
(62, 'margin'),
(63, 'margin-top'),
(64, 'margin-right'),
(65, 'margin-bottom'),
(66, 'margin-left'),
(67, 'marker-offset'),
(68, 'marks'),
(69, 'max-height'),
(70, 'max-width'),
(71, 'min-height'),
(72, 'min-width'),
(73, 'orphans'),
(74, 'outline'),
(75, 'outline-color'),
(76, 'outline-style'),
(77, 'outline-width'),
(78, 'overflow'),
(79, 'padding'),
(80, 'padding-top'),
(81, 'padding-right'),
(82, 'padding-bottom'),
(83, 'padding-left'),
(84, 'page'),
(85, 'page-break-after'),
(86, 'page-break-before'),
(87, 'age-break-inside'),
(88, 'pause'),
(89, 'pause-after'),
(90, 'pause-before'),
(91, 'pitch'),
(92, 'pitch-range'),
(93, 'play-during'),
(94, 'position'),
(95, 'quotes'),
(96, 'richness'),
(97, 'right'),
(98, 'size'),
(99, 'speak'),
(100, 'speak-header'),
(101, 'speak-numeral'),
(102, 'speak-punctuation'),
(103, 'speech-rate'),
(104, 'tress'),
(105, 'table-layout'),
(106, 'text-align'),
(107, 'text-decoration'),
(108, 'text-indent'),
(109, 'text-shadow'),
(110, 'text-transform'),
(111, 'top'),
(112, 'unicode-bidi'),
(113, 'vertical-align'),
(114, 'visibility'),
(115, 'voice-family'),
(116, 'volume'),
(117, 'white-space'),
(118, 'widows'),
(119, 'width'),
(120, 'word-spacing'),
(121, 'z-index');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `styles_propiedades_x_selectores`
--

INSERT INTO `styles_propiedades_x_selectores` (`id_selector`, `id_propiedad`, `valor`) VALUES
(1, 62, '5px'),
(1, 48, 'Verdana, Arial, Helvetica, sans-serif'),
(1, 49, '11px'),
(2, 49, '22px'),
(3, 62, '0 auto'),
(4, 66, '10px'),
(4, 79, '0'),
(5, 46, 'left'),
(5, 78, 'hidden'),
(5, 119, '150px'),
(6, 16, '1px solid #CCCCCC'),
(6, 46, 'left'),
(6, 79, '15px'),
(6, 119, '550px'),
(7, 13, '1px solid #CCCCCC'),
(7, 32, 'both'),
(7, 106, 'center'),
(7, 119, '100%'),
(8, 4, '#CCCC00'),
(8, 79, '0 3px 0 3px'),
(9, 14, '1px solid #f0f0f0'),
(9, 15, '1px solid #f0f0f0'),
(9, 79, '2px'),
(10, 43, 'block'),
(10, 46, 'left'),
(10, 106, 'right'),
(10, 119, '150px'),
(11, 66, '100px'),
(12, 34, '#FF0000'),
(12, 62, '10px'),
(13, 119, '205px'),
(14, 46, 'right');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=16 ;

--
-- Volcar la base de datos para la tabla `styles_selectores`
--

INSERT INTO `styles_selectores` (`id_selector`, `selector`, `descripcion`) VALUES
(1, 'BODY', 'Cuerpo principal de la pagina.'),
(2, 'H1', 'Titulos'),
(3, 'DIV#contenedor', ''),
(4, 'DIV#menu ul, DIV#menu li', ''),
(5, 'DIV#menu', ''),
(6, 'DIV#contenido', ''),
(7, 'DIV#pie', ''),
(8, 'TH', ''),
(9, 'TD', ''),
(10, 'label', ''),
(11, 'DIV#formbutton', ''),
(12, 'DIV#mensaje', ''),
(13, 'DIV#boton_formulario', ''),
(14, 'DIV#boton_formulario INPUT', 'Botones de formularios'),
(15, 'DIV#logueado', NULL);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`, `nombre`, `apellido`, `mail`, `estado`, `creado`, `modificado`) VALUES
(1, 'homero', 'clave', 'Homero''s', 'Simpson', 'homero@springfield.com', 1, '2007-07-03 21:11:50', '2007-07-26 01:17:25'),
(2, 'apu', 'clave', 'Apu', 'Nahasapeemapetilon', 'apu@springfield.com', 1, '2007-07-03 23:22:09', '2007-07-03 23:32:19'),
(4, 'montgomery', 'clave', 'Montgomery', 'Burns', 'montgomery@springfield.com', 0, '2007-07-03 23:25:26', '2007-07-03 23:25:26'),
(5, 'kent', 'clave', 'Kent', 'Brockman', 'kent@springfield.com', 1, '2007-07-03 23:25:26', '2007-07-03 23:25:26'),
(6, 'eplace', 'pepe', 'Enrique', 'Place', 'enriqueplace@gmail.com', 1, '2007-07-25 23:45:28', '2007-07-25 23:45:28');
