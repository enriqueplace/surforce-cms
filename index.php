<?php
error_reporting(E_ALL|E_STRICT);
date_default_timezone_set('America/Montevideo');

set_include_path(	'.' .
    PATH_SEPARATOR . './library' .
    PATH_SEPARATOR . './application/models/' .
    PATH_SEPARATOR . get_include_path()
);

// Carga de clases que se usan constantemente
include "Zend/Loader.php";
Zend_Loader::loadClass('Zend_Controller_Front');
Zend_Loader::loadClass('Zend_Config_Ini');
Zend_Loader::loadClass('Zend_Registry');
Zend_Loader::loadClass('Zend_Db');
Zend_Loader::loadClass('Zend_Db_Table');
Zend_Loader::loadClass('Zend_Auth');

// load configuration
$config = new Zend_Config_Ini('./application/config.ini', 'general');
$registry = Zend_Registry::getInstance();
$registry->set('config', $config);

// load personalizacion
$personalizacion = new Zend_Config_Ini('./application/config.ini', 'personalizacion');
$registry = Zend_Registry::getInstance();
$registry->set('personalizacion', $personalizacion);

// setup database
$db = Zend_Db::factory($config->db->adapter, $config->db->config->toArray());
Zend_Db_Table::setDefaultAdapter($db);
Zend_Registry::set('dbAdapter', $db);

// Setup controller
$frontController = Zend_Controller_Front::getInstance();
$frontController->throwExceptions(true);
$frontController->addModuleDirectory('./application/modules/');

// run!
try {
    $frontController->dispatch();
} catch (Exception $e) {
    echo "Message: " . $e->getMessage() . "\n";
}
// Según la documentación, no se cierra el tag PHP en el index.php porque no se necesita y así
// se previenen errores difíciles de encontrar como con la funcion header() si se deja un
// espacio en blanco al final (habría que confirmar esto).
