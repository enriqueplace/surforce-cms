CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `id_sitio` int(10) unsigned NOT NULL,
  `nombre` varchar(150) collate utf8_unicode_ci NOT NULL,
  `titulo` varchar(50) collate utf8_unicode_ci default NULL,
  `descripcion` varchar(255) collate utf8_unicode_ci default NULL,
  `posicion` tinyint(2) NOT NULL default '1',
  `privado` char(1) collate utf8_unicode_ci NOT NULL,
  `estado` char(1) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

INSERT INTO `menus` (`id`, `id_sitio`, `nombre`, `titulo`, `descripcion`, `posicion`, `privado`, `estado`) VALUES
(1, 0, 'Administrador', 'Menú Administrador', 'menu admin', 2, '1', '1'),
(2, 0, 'Sitios amigos', 'Nuestros sitios amigos', 'Enlaces a sitios amigos', 1, '0', '1');
