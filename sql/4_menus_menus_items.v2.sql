CREATE TABLE `menus_items` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `id_menu` int(10) unsigned NOT NULL,
  `item` varchar(50) collate utf8_unicode_ci NOT NULL,
  `destino` varchar(255) collate utf8_unicode_ci NOT NULL,
  `posicion` tinyint(2) unsigned NOT NULL,
  `privado` char(1) collate utf8_unicode_ci NOT NULL,
  `estado` char(1) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

INSERT INTO `menus_items` (`id`, `id_menu`, `item`, `destino`, `posicion`, `privado`, `estado`) VALUES
(1, 1, 'Menus', '/menus/menus', 1, '0', '1'),
(2, 2, 'Google', 'http://www.google.com', 1, '0', '1'),
(3, 1, 'Usuarios', '/usuarios/usuarios', 2, '1', '1');
