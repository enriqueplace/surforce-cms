<?php
class Menus_MenusController extends Zend_Controller_Action{

	function init(){
		$this->initView();
		$this->view->baseUrl = $this->_request->getBaseUrl();
		$this->view->setScriptPath('./application/views/scripts/');
		Zend_Loader::loadClass('Menus');
		$this->view->user = Zend_Auth::getInstance()->getIdentity();

		#factorizando la instancia de 'personalizacion'
		$this->info = Zend_Registry::get('personalizacion');

		#asignando el titulo de  todo el sitio
		$this->view->title = $this->info->sitio->index->index->titulo;
	}

	function preDispatch(){
		$auth = Zend_Auth::getInstance();
		if ($auth->hasIdentity()) {
			$this->view->usuarioLogueado = true;
		}
	}

	function indexAction(){
		$this->view->subtitle = $this->info->sitio->menus->index->titulo;
		$menus = new Menus();
		$this->view->menus = $menus->fetchAll(NULL, 'posicion');
		$this->render();
	}

	function agregarAction(){
		if(!$this->view->usuarioLogueado){
			die($this->info->sitio->menus->agregar->msgRestringido);
		}

		$this->view->subtitle 	= $this->info->sitio->menus->agregar->titulo;
		$this->view->action 	= $this->info->sitio->menus->agregar->action;
		$this->view->buttonText = $this->info->sitio->menus->agregar->buttonText;

		$eMenu = new Menus();

		if($this->_request->isPost()){

			$cleanData = $this->getCleanData();

			$this->view->messages = $cleanData['messages'];

			if(true === $cleanData['secureData']){

				$clean = &$cleanData['clean'];

				$data = array(
					'nombre'		=> $clean['nombre'],
					'titulo'		=> $clean['titulo'],
					'descripcion'	=> $clean['descripcion'],
					'posicion'		=> $clean['posicion'],
					'privado'		=> $clean['privado'],
					'estado'		=> $clean['estado'],
				);

				$eMenu->insert($data);

				$this->_redirect('/menus/menus/');
				return;

			} else {
				$this->setAsBadData();
				$this->view->mensajeError = "Se encontraron errores en el formulario.";
				return;
			}

		}else{
			$this->setAsEmptyData();
		}

		$this->render();
	}


	function modificarAction(){
		if(!$this->view->usuarioLogueado){
			die( $this->info->sitio->menu->modificar->msgRestringido);
		}

		$this->view->subtitle 	= $this->info->sitio->menus->modificar->titulo;
		$this->view->action 	= $this->info->sitio->menus->modificar->action;
		$this->view->buttonText = $this->info->sitio->menus->modificar->buttonText;

		$eMenu = new Menus();

		if($this->_request->isPost()){

			$cleanData = $this->getCleanData();

			Zend_Loader::loadClass('Zend_Filter_StripTags');
			$filter = new Zend_Filter_StripTags();

			// ID
			$id	= trim($filter->filter($this->_request->getPost('id')));
			if($this->_request->getPost('id') === $id && $id != '' && is_numeric($id) && $id > 0 && $id <= 9999999999){
				$cleanData['clean']['id'] = $id;
			} else {
				$cleanData['unclean']['id'] = $id;
				$cleanData['secureData'] = false;
			}

			$this->view->messages = $cleanData['messages'];

			if(true === $cleanData['secureData']){

				$clean = $cleanData['clean'];

				$data = array(
					'nombre'		=> $clean['nombre'],
					'titulo'		=> $clean['titulo'],
					'descripcion'	=> $clean['descripcion'],
					'posicion'		=> $clean['posicion'],
					'privado'		=> $clean['privado'],
					'estado'		=> $clean['estado'],
				);

				if($clean['id']){
					$where = ' id=' . $clean['id'];
					$eMenu->update($data, $where);
				}

				$this->_redirect('/menus/menus/');
				return;

			} else {
				$this->setAsBadData();
				$this->view->mensajeError = "Se encontraron errores en el formulario.";
				return;
			}

		} else {
			$id = (int)$this->_request->getParam('id', 0);
		}

		if(is_numeric($id) && $id > 0){
			#verificar que el menu exista para no mostrar error
			$this->view->menu = $eMenu->fetchRow('id='.$id);
		}else{
			$this->setAsEmptyData();
		}

		$this->render();
	}


	function eliminarAction(){
		if( !$this->view->usuarioLogueado){
			die( $this->info->sitio->menus->eliminar->msgRestringido);
		}

		$this->view->subtitle = $this->info->sitio->menus->eliminar->titulo;

		$menu = new Menus();

		if ($this->_request->isPost()) {
			Zend_Loader::loadClass('Zend_Filter_Alpha');
			$filter = new Zend_Filter_Alpha();

			$id = (int)$this->_request->getPost('id');

			$del = $filter->filter($this->_request->getPost('del'));

			if ($del == 'Si' && $id > 0) {
				// Eliminamos el menu
				$where = 'id = ' . $id;
				$rows_affected = $menu->delete($where);

				// Eliminamos items del menu
				Zend_Loader::loadClass('MenusItems');
				$items = new MenusItems();
				$where = 'id_menu = ' . $id;
				$items->delete($where);
			}
		} else {
			$id = $this->_request->getParam('id');

			if ($id > 0) {
				$this->view->menu = $menu->fetchRow('id='.$id);
				if ($this->view->menu->id > 0) {
					$this->render();
					return;
				}
			}
		}
		$this->_redirect('/menus/menus/');
	}

	function verAction(){
		$this->view->subtitle = $this->info->sitio->menu->ver->titulo;

		$menu = new Menus();

		$id = $this->_request->getParam('id', 0);

		if ($id > 0) {
			$this->view->menu = $menu->fetchRow('id='.$id);
		}

		$this->render();
	}


	function getCleanData(){
		$secureData = TRUE;
		$clean 		= array();
		$unclean	= array();

		// Elementos admitidos
		// (el orden debe ser el mismo que el que se encuentra en el documento)
		$allowed 	= array();
		$allowed[]	= 'nombre';
		$allowed[]	= 'titulo';
		$allowed[]	= 'descripcion';
		$allowed[]	= 'posicion';
		$allowed[]	= 'privado';
		$allowed[]	= 'estado';
		$allowed[]	= 'id';
		$allowed[]	= 'add';

		if($allowed != array_keys($_POST)){
			$secureData = FALSE;
		}

		Zend_Loader::loadClass('Zend_Filter_StripTags');
		$filter = new Zend_Filter_StripTags();

		$nombre 		= trim($filter->filter($this->_request->getPost('nombre')));
		$titulo 		= trim($filter->filter($this->_request->getPost('titulo')));
		$descripcion	= trim($filter->filter($this->_request->getPost('descripcion')));
		$posicion		= trim($filter->filter($this->_request->getPost('posicion')));
		$privado		= trim($filter->filter($this->_request->getPost('privado')));
		$estado			= trim($filter->filter($this->_request->getPost('estado')));


		// Elementos en común y validaciones sobre los datos

		$globalErrorMessage = "Datos icorrectos";

		// NOMBRE
		if(strlen($nombre) <= 100  && $nombre != ''){
			$clean['nombre'] = $nombre;
		} else {
			$unclean['nombre'] = $nombre;
			$messages['nombre'] = $globalErrorMessage;
		}

		// TITULO
		if($titulo != '' and strlen($titulo) <= 50){
			$clean['titulo'] = $titulo;
		} else {
			$unclean['titulo'] = $titulo;
			$messages['titulo'] = $globalErrorMessage;
		}

		// DESCRIPCION
		if($descripcion != '' and strlen($descripcion) <= 255){
			$clean['descripcion'] = $descripcion;
		} else {
			$unclean['descripcion'] = $descripcion;
			$messages['descripcion'] = $globalErrorMessage;
		}

		// POSICION
		if($posicion != '' && is_numeric($posicion) && $posicion > 0  && $posicion <= 99){
			$clean['posicion'] = $posicion;
		} else {
			$unclean['posicion'] = $posicion;
			$messages['posicion'] = $globalErrorMessage;
		}

		// PRIVADO
		if($privado != '' && is_numeric($privado) && $privado >= 0  && $privado <= 1){
			$clean['privado'] = $privado;
		} else {
			$unclean['privado'] = $privado;
			$messages['privado'] = $globalErrorMessage;
		}

		// ESTADO
		if($estado != '' && is_numeric($estado) && $estado >= 0 && $estado <= 1){
			$clean['estado'] = $estado;
		} else {
			$unclean['estado'] = $estado;
			$messages['estado'] = $globalErrorMessage;
		}

		if(count($unclean)){
			$secureData = FALSE;
		}

		return array('clean' => $clean, 'unclean' => $unclean, 'messages' => $messages, 'secureData' => $secureData);
	}

	function setAsBadData(){
		$badData = $this->_request->getPost();
		$this->view->menu = new stdClass();
		$this->view->menu->id 			= $badData['id'];
		$this->view->menu->nombre 		= $badData['nombre'];
		$this->view->menu->titulo 		= $badData['titulo'];
		$this->view->menu->descripcion	= $badData['descripcion'];
		$this->view->menu->posicion 	= $badData['posicion'];
		$this->view->menu->privado 		= $badData['privado'];
		$this->view->menu->estado 		= $badData['estado'];
	}

	function setAsEmptyData(){
		$this->view->menu = new stdClass();
		$this->view->menu->id = null;
		$this->view->menu->nombre = '';
		$this->view->menu->titulo = '';
		$this->view->menu->descripcion = '';
		$this->view->menu->posicion = '';
		$this->view->menu->privado = '0';
		$this->view->menu->estado = '0';
	}


}

?>