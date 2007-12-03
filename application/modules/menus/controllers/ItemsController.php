<?php
class Menus_ItemsController extends Zend_Controller_Action{

	function init(){
		$this->initView();
		$this->view->baseUrl = $this->_request->getBaseUrl();
		$this->view->setScriptPath('./application/views/scripts/menus/');
		Zend_Loader::loadClass('MenusItems');
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
		$this->view->subtitle = $this->info->sitio->menus->items->index->titulo;
		$items = new MenusItems();
		$this->view->items = $items->fetchAll(NULL, 'posicion');
		$this->render();
	}

	function editarAction(){
		$this->view->subtitle = $this->info->sitio->menus->items->index->titulo;
		$menuItems = new MenusItems();
		$idMenu = $this->_request->getParam('id');
		$where = 'id_menu=' . $idMenu;
		$this->view->items = $menuItems->fetchAll($where, 'posicion');
		$this->view->idMenu = $idMenu;
		$this->render();
	}

	function agregarAction(){
		if(!$this->view->usuarioLogueado){
			die($this->info->sitio->menus->items->agregar->msgRestringido);
		}

		$this->view->subtitle 	= $this->info->sitio->menus->items->agregar->titulo;
		$this->view->action 	= $this->info->sitio->menus->items->agregar->action;
		$this->view->buttonText = $this->info->sitio->menus->items->agregar->buttonText;

		$items = new MenusItems();

		if($this->_request->isPost()){

			$cleanData = $this->getCleanData();

			Zend_Loader::loadClass('Zend_Filter_StripTags');
			$filter = new Zend_Filter_StripTags();

			// ID
			$idMenu	= trim($filter->filter($this->_request->getPost('idMenu')));
			if($idMenu != '' && is_numeric($idMenu) && $idMenu > 0 && $idMenu <= 9999999999){
				$cleanData['clean']['idMenu'] = $idMenu;
			} else {
				$cleanData['unclean']['idMenu'] = $idMenu;
				$cleanData['secureData'] = false;
			}

			$this->view->messages = $cleanData['messages'];

			if(true === $cleanData['secureData']){

				$clean = $cleanData['clean'];

				$data = array(
					'id_menu'		=> $clean['idMenu'],
					'item'			=> $clean['item'],
					'destino'		=> $clean['destino'],
					'posicion'		=> $clean['posicion'],
					'privado'		=> $clean['privado'],
					'estado'		=> $clean['estado'],
				);

				$items->insert($data);

				$this->_redirect('/menus/items/editar/id/'.$clean['idMenu']);
				return;

			} else {
				$this->setAsBadData();
				$this->view->mensajeError = "Se encontraron errores en el formulario.";
				return;
			}

		}else{
			$this->setAsEmptyData();
			$this->view->idMenu = $this->_request->getParam('id');
		}

		$this->render();
	}


	function modificarAction(){
		if(!$this->view->usuarioLogueado){
			die( $this->info->sitio->menu->items->modificar->msgRestringido);
		}

		$this->view->subtitle 	= $this->info->sitio->menus->items->modificar->titulo;
		$this->view->action 	= $this->info->sitio->menus->items->modificar->action;
		$this->view->buttonText = $this->info->sitio->menus->items->modificar->buttonText;

		$items = new MenusItems();

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
					'item'		=> $clean['item'],
					'destino'	=> $clean['destino'],
					'posicion'	=> $clean['posicion'],
					'privado'	=> $clean['privado'],
					'estado'	=> $clean['estado'],
				);

				if($clean['id']){
					$where = ' id=' . $clean['id'];
					$items->update($data, $where);
				}

				$this->_redirect('/menus/items/');
				return;

			} else {
				$this->setAsBadData();
				$this->view->mensajeError = "Se encontraron errores en el formulario.";
				return;
			}

		} else {
			$id = (int)$this->_request->getParam('id', 0);
			$this->view->idMenu = $this->_request->getParam('id');
		}

		if(is_numeric($id) && $id > 0){
			#verificar que el menu exista para no mostrar error
			$this->view->item = $items->fetchRow('id='.$id);
			//print_r($this->view->item);
			//die();
		}else{
			$this->setAsEmptyData();
		}

		$this->render();
	}


	function eliminarAction(){
		if( !$this->view->usuarioLogueado){
			die( $this->info->sitio->menus->items->eliminar->msgRestringido);
		}

		$this->view->subtitle = $this->info->sitio->menus->items->eliminar->titulo;

		$item = new MenusItems();

		if ($this->_request->isPost()) {
			Zend_Loader::loadClass('Zend_Filter_Alpha');
			$filter = new Zend_Filter_Alpha();

			$id = (int)$this->_request->getPost('id');

			$del = $filter->filter($this->_request->getPost('del'));

			$where = 'id=' . $id;

			$idMenu = $item->fetchRow($where);
			$idMenu = $idMenu->id_menu;

			if ($del == 'Si' && $id > 0) {
				$rows_affected = $item->delete($where);
			}

			$this->_redirect('/menus/items/editar/id/' . $idMenu);

		} else {
			$id = (int)$this->_request->getParam('id');

			if ($id > 0) {
				$this->view->item = $item->fetchRow('id='.$id);
				if ($this->view->item->id > 0) {
					$this->render();
					return;
				}
			}
		}
	}

	function verAction(){
		$this->view->subtitle = $this->info->sitio->menus->items->ver->titulo;
		$menu = new MenusItems();
		$id = (int)$this->_request->getParam('id', 0);
		if ($id > 0) {
			$this->view->item = $menu->fetchRow('id='.$id);
		}
		$this->render();
	}


	function getCleanData(){
		$secureData = TRUE;
		$clean 		= array();
		$unclean	= array();
		$messages	= array();

		// Elementos admitidos
		// (el orden debe ser el mismo que el que se encuentra en el documento)
		$allowed 	= array();
		$allowed[]	= 'item';
		$allowed[]	= 'destino';
		$allowed[]	= 'posicion';
		$allowed[]	= 'privado';
		$allowed[]	= 'estado';
		$allowed[]	= 'id';
		$allowed[]	= 'idMenu';
		$allowed[]	= 'add';

		if($allowed != array_keys($_POST)){
			$secureData = FALSE;
		}

		Zend_Loader::loadClass('Zend_Filter_StripTags');
		$filter = new Zend_Filter_StripTags();

		$item 		= trim($filter->filter($this->_request->getPost('item')));
		$destino	= trim($filter->filter($this->_request->getPost('destino')));
		$posicion		= trim($filter->filter($this->_request->getPost('posicion')));
		$privado		= trim($filter->filter($this->_request->getPost('privado')));
		$estado			= trim($filter->filter($this->_request->getPost('estado')));


		// Elementos en común y validaciones sobre los datos

		$globalErrorMessage = "Datos icorrectos";

		// NOMBRE
		if(strlen($item ) <= 100  && $item != ''){
			$clean['item'] = $item;
		} else {
			$unclean['item'] = $item;
			$messages['item'] = $globalErrorMessage;
		}

		// DESTINO
		if(strlen($destino) <= 255 and trim($destino != '')){
			$clean['destino'] = $destino;
		} else {
			$unclean['destino'] = $destino;
			$messages['destino'] = $globalErrorMessage;
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
		$this->view->item = new stdClass();
		$this->view->item->id 			= $badData['id'];
		$this->view->item->idMenu		= $badData['idMenu'];
		$this->view->item->item 		= $badData['item'];
		$this->view->item->destino		= $badData['destino'];
		$this->view->item->posicion 	= $badData['posicion'];
		$this->view->item->privado 		= $badData['privado'];
		$this->view->item->estado 		= $badData['estado'];
	}

	function setAsEmptyData(){
		$this->view->item 			= new stdClass();
		$this->view->item->id 		= null;
		$this->view->item->idMenu	= '';
		$this->view->item->item 	= '';
		$this->view->item->destino 	= '';
		$this->view->item->posicion = '';
		$this->view->item->privado 	= '0';
		$this->view->item->estado 	= '0';
	}


}

?>