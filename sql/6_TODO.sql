-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faqs`
--

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs` (
  `id` int(50) NOT NULL auto_increment,
  `pregunta` varchar(250) collate utf8_unicode_ci NOT NULL,
  `respuesta` varchar(250) collate utf8_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `item` varchar(45) collate utf8_unicode_ci NOT NULL,
  `destino` varchar(255) collate utf8_unicode_ci NOT NULL,
  `posicion` smallint(4) NOT NULL default '0',
  `privado` char(1) collate utf8_unicode_ci NOT NULL default '1',
  `estado` char(1) character set latin1 collate latin1_bin NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcar la base de datos para la tabla `menu`
--

INSERT INTO `menu` VALUES (1, 'noticias', '/noticias/noticias/', 1, '1', 0x31);
INSERT INTO `menu` VALUES (2, 'FAQ', '/faqs/faqs/', 2, '1', 0x31);
INSERT INTO `menu` VALUES (5, 'home', '/', 0, '1', 0x31);
INSERT INTO `menu` VALUES (6, 'Introducción', '/paginas/paginas/ver/id/7', 4, '1', 0x31);
INSERT INTO `menu` VALUES (7, 'Investigación', '/paginas/paginas/ver/id/8', 5, '1', 0x31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

DROP TABLE IF EXISTS `noticias`;
CREATE TABLE `noticias` (
  `id` int(10) NOT NULL auto_increment,
  `titulo` varchar(150) collate utf8_unicode_ci NOT NULL,
  `contenido` text collate utf8_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcar la base de datos para la tabla `noticias`
--

INSERT INTO `noticias` VALUES (1, 'Ejecutivo califica de terroristas a los piqueteros de GualeguaychÃº', '<p>El canciller Reinaldo Gargano dijo que para el gobierno las amenazas de los ambientalistas argentinos son de car&aacute;cter terrorista. Eso obedece a que el fin de semana los ambientalistas piqueteros mostraron ante c&aacute;maras de prensa un misil que advirtieron pod&iacute;a ser usado contra la planta de Botnia  </p><ol><li>Mi primera impresi&oacute;n</li><li>Mi segunda impresi&oacute;n nada  </li><li>No creo que termine mal.			</li></ol>', '2007-08-01 01:15:13', 1);
INSERT INTO `noticias` VALUES (3, 'Leyenda infinita', 'Decenas de miles de aficionados de la m&uacute;sica de Elvis Presley se han dado cita esta semana en Memphis, Tennessee para rendir tributo a &quot;El Rey&quot;, a 30 a&ntilde;os de su muerte', '2007-08-01 01:25:40', 0);
INSERT INTO `noticias` VALUES (5, 'Accidentes se cobran casi 100 vÃ­ctimas en solo 12 dÃ­as', '&nbsp;Las cifras de accidente del mes de agosto tienen particularmente preocupadas a las autoridades de tr&aacute;nsito. En<img src="http://www.observa.com.uy/Observa/contenidos/0000000166/0000083327_2606E729-571F-4C7B-8B51-179450017F31/filename.jpg" alt="Accidente" title="Accidente Cami&oacute;n / &Oacute;mnibus" width="160" height="120" align="right" /> solo 12 d&iacute;as los siniestros viales han causado 14 muertes y 80 lesionados, dentro de los que se incluyen los cinco fallecidos y 18 heridos del accidente del domingo en San Jacinto, cuando un &oacute;mnibus colision&oacute; de frente con un cami&oacute;n.<p>Estas cifras -suministradas por Polic&iacute;a Caminera y que incluyen a los accidentes producidos en caminos y rutas nacionales- muestran que en los primeros 12 d&iacute;as de agosto se produce un promedio superior a un muerto por d&iacute;a.</p><p>Las cifras divulgadas por la Direcci&oacute;n Nacional de Polic&iacute;a Caminera indican que en lo que en agosto se registraron un total de 75 accidentes. De esta variable se desprende que nueve de ellos fueron fatales, 30 fueron no fatales, y hubo 36 en lo que s&oacute;lo se produjeron da&ntilde;os. En lo que va del a&ntilde;o se produjeron 1449 accidentes. De ese total, 503 fueron con da&ntilde;os, 860 fueron no fatales y 86 fueron fatales,</p><p>Con respecto a las v&iacute;ctimas, hasta el 12 de agosto se contabilizaron un total de 1540, con 1439 lesionados y 101 fallecidos. En el 2006 se registraron un total de 2187 accidentes con 2147 lesionados y 181 fallecidos.</p><br />', '2007-08-14 01:09:37', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paginas`
--

DROP TABLE IF EXISTS `paginas`;
CREATE TABLE `paginas` (
  `id` int(10) NOT NULL auto_increment,
  `titulo` varchar(150) collate utf8_unicode_ci NOT NULL,
  `contenido` text collate utf8_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcar la base de datos para la tabla `paginas`
--

INSERT INTO `paginas` VALUES (1, 'Declaran esencialidad de servicios quirÃºrgicos', 'Tras el Consejo de Ministros, la ministra de Salud P&uacute;blica Mar&iacute;a Julia Mu&ntilde;oz inform&oacute; que se declar&oacute; de esencialidad los servicios de cirujanos y anestesistas.<p>A su vez agreg&oacute; que, en caso de que no se acate la medida, el Ministerio de Salud P&uacute;blica (MSP) realizar&aacute; un llamado p&uacute;blico nacional para cubrir los cupos.</p><p>&quot;Hemos constatado que durante el paro de los anestesistas se ha dejado de operar a pacientes oncol&oacute;gicos tanto en el Pereira Rossell como en el Hospital Maciel&quot; se&ntilde;al&oacute; la ministra.</p><p>As&iacute; Mu&ntilde;oz puso fin a un paro por tiempo indeterminado que comenzaron las Sociedades Anest&eacute;sico Quir&uacute;rgicas (SAQ) la semana pasada.</p><p>Se esperaba que en la jornada de hoy diputados del Frente Amplio tuvieran contactos informales hoy con las autoridades del MSP y las SAQ en un intento de poner fin al conflicto entre ambas entidades.</p><p>Los anestesistas denunciaron que existe &quot;falta de cobertura de guardias anest&eacute;sicas en el Hospital Pereira Rossell; alarmantes listas de espera para operarse en varias especialidades; inexistencia de equipamiento anest&eacute;sico y quir&uacute;rgico actualizado en Salud P&uacute;blica&quot;.</p><p>Comenzaron un paro por tiempo indeterminado el mi&eacute;rcoles 8 y anunciaron que s&oacute;lo actuar&aacute;n en las urgencias, emergencias y en operaciones oncol&oacute;gicas coordinadas.</p><p>Pero desde este jueves 16, se plegaban a la medida los integrantes de las restantes doce especialidades quir&uacute;rgicas, que re&uacute;nen a unos 1.000 cirujanos de Salud P&uacute;blica.</p><p>Ese mismo d&iacute;a habr&aacute; un paro m&eacute;dico de 24 horas, que ser&aacute; de alcance nacional, pues se pliegan la Federaci&oacute;n M&eacute;dica del Interior (FEMI) y el Sindicato M&eacute;dico del Uruguay (SMU).</p><p>EL PA&Iacute;S</p>', '2007-08-01 01:15:13', 1);
INSERT INTO `paginas` VALUES (3, 'pagina2', 'contenido de la segunda pagina', '2007-08-01 01:25:40', 0);
INSERT INTO `paginas` VALUES (5, 'Primer pÃ¡gina con TinyMCE', '<p>				Mmm... c&oacute;mo se ver&aacute; esta p&aacute;gina? Funciona, no funciona? ;-)     uno dos tres cuatro Creo que bien, andar anduvo  Y la lista tambi&eacute;n			</p><p>&nbsp;</p><ol><li>uno</li><li>dos</li><li>tres</li></ol><p>&nbsp;</p><p><strong>Pero este es mi nombre</strong>&nbsp;</p><p>&nbsp;</p><p><u><em>Y este tampoco</em></u>&nbsp;</p>', '2007-08-13 20:32:18', 0);
INSERT INTO `paginas` VALUES (6, 'Sin festejos, Fidel cumple aÃ±os', '<img src="http://www.elpais.com.uy/07/08/13/33742_298.JPG" alt="Fidel" title="Fidel Castro" width="298" height="255" align="right" />La Habana - El l&iacute;der cubano Fidel Castro cumple hoy 81 a&ntilde;os en medio de discretas celebraciones, batallando por su salud, confinado desde hace m&aacute;s de 12 meses en un retiro de enfermo desde donde vigila, celosamente, la continuidad de su revoluci&oacute;n.<p>Alejado del poder por primera vez en 48 a&ntilde;os desde que el 31 de julio de 2006 lo cedi&oacute; a Ra&uacute;l Castro, Fidel ocupa sosegado su silla de patriarca, sin que se sepa si volver&aacute; a funciones, mientras avanza el gobierno de su hermano, de provisionalidad duradera.</p><p>Las autoridades no convocaron a ning&uacute;n festejo, pero en v&iacute;spera de su cumplea&ntilde;os Castro recibi&oacute; ayer elogios y dedicatorias de triunfos y actividades de j&oacute;venes, escolares, ex combatientes y deportistas.</p><p>Decano de los gobernantes del mundo, sobreviviente a unos 640 complots contra su vida, a 13 gobiernos estadounidenses y a la desaparici&oacute;n del bloque socialista, Castro fue doblegado por la salud y los a&ntilde;os, tras un ritmo de vida alucinante.</p><p>Sin ser visto en el &uacute;ltimo a&ntilde;o m&aacute;s que en fotos y videos, permanece bajo estricto cuidado m&eacute;dico por una enfermedad no revelada, que lo llev&oacute; -seg&uacute;n dijo- a &quot;varias operaciones&quot; y lo tuvo &quot;entre la vida y la muerte&quot;.</p><p>Otrora due&ntilde;o de las tribunas, este maestro de la oratoria est&aacute; ahora dedicado a escribir sus &quot;Reflexiones de Comandante en Jefe&quot; -37 publicadas en la prensa a partir del 29 de marzo-, desde donde no da tregua a su enemigo Estados Unidos.</p><p>A&uacute;n quienes creen que se recuperar&aacute;, fidelistas y opositores dentro y fuera de Cuba, analistas y diplom&aacute;ticos, dudan hoy que el l&iacute;der cubano vuelva a gobernar, al menos como antes, y piensan que quiz&aacute;s asuma una funci&oacute;n honor&iacute;fica.</p><p>&quot;Una cosa es que se le consulten determinadas situaciones a Fidel, cuestiones importantes, como &eacute;l dice, y otra es que &eacute;l gobierne. Soy de los que piensa que en Cuba gobierna Ra&uacute;l&quot;, dijo a la agencia de noticias AFP Fernando Garz&oacute;n, economista de 53 a&ntilde;os.</p><p>Para el disidente Vladimiro Roca &quot;todo parece indicar que no vuelve m&aacute;s, la salud no lo acompa&ntilde;a a los 81&quot;. La opositora Martha Beatriz Roque sentenci&oacute;: &quot;Est&aacute; totalmente terminado&quot;.</p><p>AFP</p><br />							', '2007-08-14 01:23:57', 0);
INSERT INTO `paginas` VALUES (7, 'IntroducciÃ³n', 'Uruguay explota recursos naturales pesqueros del Oc&eacute;ano Atl&aacute;ntico Sud Occidental, principalmente en la Zona Com&uacute;n de Pesca, creada con la Rep&uacute;blica Argentina en el marco del Tratado del R&iacute;o de la Plata y su Frente Mar&iacute;timo, y en la cual se realiza la pesca responsable de no menos de treinta especies demersales y pel&aacute;gicas, algunas de alto valor comercial.<div style="text-align: center"><img src="http://www.dinara.gub.uy/Im%E1genes/Puerto%20y%20Productos%20del%20mar.gif" alt="puerto" title="puerto" width="323" height="185" /></div><p>Los recursos pesqueros a los cuales tiene acceso el Uruguay provienen de aguas fr&iacute;as y se estiman rendimientos de captura sostenible de m&aacute;s de 150.000 toneladas m&eacute;tricas por a&ntilde;o; ello agregado a las caracter&iacute;sticas t&eacute;cnicas de la flota pesquera, las condiciones de manipulaci&oacute;n y transporte del pescado fresco refrigerado a bordo, y la cercan&iacute;a de los caladeros a los puertos de descarga, aseguran la disponibilidad de una materia prima de absoluta frescura y alta calidad para su industrializaci&oacute;n en plantas instaladas en la zona costera del pa&iacute;s.</p><p>La ejecuci&oacute;n de la pol&iacute;tica pesquera realizada por la Direcci&oacute;n Nacional de Recursos Acu&aacute;ticos (DINARA) se orienta al ordenamiento y a la administraci&oacute;n de los recursos sobre la base del criterio de pesca responsable.</p><p>Dicha administraci&oacute;n pretende una extracci&oacute;n sustentable de peces, moluscos y crust&aacute;ceos por barcos pesqueros y artes de pesca id&oacute;neos.</p><p>La actividad industrial pesquera se ha realizado con incorporaci&oacute;n de procesamientos de punta, incluso con innovaci&oacute;n tecnol&oacute;gica en la transformaci&oacute;n de crust&aacute;ceos, y en productos pesqueros empanados integrados con productos alimenticios de origen animal o vegetal, destinados al consumo humano.</p><p>Ello ha llevado a la conquista de m&aacute;s de 35 mercados diferentes para los productos pesqueros de exportaci&oacute;n, sobriamente empacados y rotulados, y en funci&oacute;n de una adecuada relaci&oacute;n calidad-precio.</p><p>La garant&iacute;a de inocuidad de los productos pesqueros de exportaci&oacute;n originarios de Uruguay es brindada por la Direcci&oacute;n Nacional de Recursos Acu&aacute;ticos a trav&eacute;s de la implementaci&oacute;n de las buenas pr&aacute;cticas de manufactura de alimentos en flota e industria y de la aplicaci&oacute;n de las directrices del Codex Alimentarius de la FAO/OMS (Sistema HACCP) en toda la cadena productiva que se inicia con la captura y finaliza en muchos casos con productos pesqueros preparados directamente para la mesa del consumidor.</p><p>Por la regularidad de entrega y seriedad comercial, la mayor&iacute;a de las empresas del sector poseen un excelente acceso a los mercados y una diversidad de productos pesqueros frescos y congelados que satisfacen la demanda de los consumidores, acrecentado &uacute;ltimamente por el beneficio complementario cient&iacute;ficamente comprobado de la dieta de pescado sobre diversos aspectos de la salud humana.</p><p>El consumo de pescado en el pa&iacute;s se ha incrementado con la importaci&oacute;n de diversos alimentos de origen pesquero y de la acuicultura, congelados o envasados, y el valioso aporte de pescado fresco, principalmente a partir de la pesca artesanal distribuida en todo el territorio de la Rep&uacute;blica.</p><p>Adem&aacute;s del desarrollo incipiente de la acuicultura como sector productivo de las zonas costeras y de las aguas interiores, los peces ornamentales est&aacute;n tomando cada vez m&aacute;s importancia como animales de compa&ntilde;&iacute;a.</p><br />							', '2007-08-16 02:22:55', 0);
INSERT INTO `paginas` VALUES (8, 'InvestigaciÃ³n', 'La Investigaci&oacute;n Cient&iacute;fica de los Recursos Pesqueros<p>La Direcci&oacute;n Nacional de Recursos Acu&aacute;ticos lleva a cabo anualmente diversas investigaciones sobre el estado de los recursos, que proporcionan informaci&oacute;n sobre aquellos factores que directamente tienen que ver con la explotaci&oacute;n pesquera, el esfuerzo a aplicar y la necesidad de tomar medidas de ordenamiento.</p><div style="text-align: center"><img src="http://www.dinara.gub.uy/Im%E1genes/Maniobra.gif" alt="maniobra" title="maniobra" width="334" height="220" /></div> <p>Estas investigaciones son llevadas a cabo fundamentalmente por el Departamento de Biolog&iacute;a Pesquera, y se basan en la aplicaci&oacute;n de modelos de din&aacute;mica de poblaciones, que se alimentan con informaci&oacute;n procedente de campa&ntilde;as de investigaci&oacute;n realizadas con el B/I ''Aldebar&aacute;n'', datos recolectados durante el muestreo biol&oacute;gico de los desembarques, informaci&oacute;n proporcionada por la flota pesquera; estudios oceanogr&aacute;ficos para determinar la influencia de las distintas masas de agua sobre la distribuci&oacute;n y la abundancia de los recursos pesqueros.</p><p>El manejo de los resultados de estas investigaciones permite proporcionar la informaci&oacute;n necesaria para la toma de decisiones de ordenamiento tales como; determinaci&oacute;n del cierre de pesquer&iacute;as, cuando los recursos se encuentran plenamente explotados; determinaci&oacute;n de &aacute;reas de protecci&oacute;n de juveniles o de reproductores mediante el establecimiento de vedas espacio-temporales; determinaci&oacute;n de tama&ntilde;os m&iacute;nimos de desembarque como una forma de protecci&oacute;n de la pesca de ejemplares inmaduros sexualmente, y otra serie de medidas complementarias.</p><br />Biolog&iacute;a Pesquera 	<br />Mam&iacute;feros Marinos 	<br />Industria Pesquera 	<br />''Mareas Rojas'' 	<br />Acuicultura 	<br />Estaci&oacute;n ''La Paloma'' 	<br />Estaci&oacute;n de Piscicultura ''Laguna del Sauce'' 	<p>&nbsp;</p><p>Centro de Investigaciones Pesqueras y Piscicultura 	<br />Ranicultura 	<br />El Buque de Investigaci&oacute;n 	</p>', '2007-08-16 02:28:01', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `styles_propiedades`
--

DROP TABLE IF EXISTS `styles_propiedades`;
CREATE TABLE `styles_propiedades` (
  `id_propiedad` int(11) NOT NULL auto_increment,
  `propiedad` varchar(32) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id_propiedad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `valor` varchar(64) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id_selector`,`id_propiedad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `selector` varchar(64) collate utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id_selector`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `usuario` varchar(32) collate utf8_unicode_ci NOT NULL,
  `password` varchar(32) collate utf8_unicode_ci NOT NULL,
  `nombre` varchar(40) collate utf8_unicode_ci NOT NULL,
  `apellido` varchar(40) collate utf8_unicode_ci NOT NULL,
  `mail` varchar(64) collate utf8_unicode_ci default NULL,
  `estado` int(2) NOT NULL,
  `creado` datetime NOT NULL,
  `modificado` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcar la base de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` VALUES (1, 'homero', 'clave', 'Homero''s', 'Simpson', 'homero@springfield.com', 1, '2007-07-03 21:11:50', '2007-07-26 01:17:25');
INSERT INTO `usuarios` VALUES (2, 'apu', 'clave', 'Apu', 'Nahasapeemapetilon', 'apu@springfield.com', 1, '2007-07-03 23:22:09', '2007-07-03 23:32:19');
INSERT INTO `usuarios` VALUES (4, 'montgomery', 'clave', 'Montgomery', 'Burns', 'montgomery@springfield.com', 0, '2007-07-03 23:25:26', '2007-07-03 23:25:26');
INSERT INTO `usuarios` VALUES (5, 'kent', 'clave', 'Kent', 'Brockman', 'kent@springfield.com', 1, '2007-07-03 23:25:26', '2007-07-03 23:25:26');
INSERT INTO `usuarios` VALUES (6, 'eplace', 'pepe', 'Enrique', 'Place', 'enriqueplace@gmail.com', 1, '2007-07-25 23:45:28', '2007-07-25 23:45:28');
