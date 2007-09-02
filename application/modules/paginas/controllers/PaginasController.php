<?php
class Paginas_PaginasController extends Zend_Controller_Action{

	function init(){
		$this->initView();
		$this->view->baseUrl = $this->_request->getBaseUrl();
		$this->view->setScriptPath('./application/views/scripts/');
		Zend_Loader::loadClass('Paginas');
		$this->view->user = Zend_Auth::getInstance()->getIdentity();

		#factorizando la instancia de 'personalizacion'
		$this->info = Zend_Registry::get('personalizacion');
		#asignando el titulo de todo el sitio
		$this->view->title = $this->info->sitio->index->index->titulo;
	}

	function preDispatch(){
		$auth = Zend_Auth::getInstance();
		if ($auth->hasIdentity()) {
			$this->view->usuarioLogueado = true;
		}
	}

	function indexAction(){
		//$info = Zend_Registry::get('personalizacion');
		$this->view->subtitle = $this->info->sitio->paginas->index->titulo;
		$paginas = new Paginas();
		$this->view->paginas = $paginas->fetchAll();
		$this->render();
	}

	function agregarAction(){
		//$info = Zend_Registry::get('personalizacion');
		if( !$this->view->usuarioLogueado){
			die( $this->info->sitio->paginas->agregar->msgRestringido);
		}

		$this->view->subtitle = $this->info->sitio->paginas->agregar->titulo;

		if ($this->_request->isPost()) {
			Zend_Loader::loadClass('Zend_Filter_StripTags');
			$filter 	= new Zend_Filter_StripTags();

			$titulo 	= trim($filter->filter($this->_request->getPost('titulo')));
			$contenido 	= $this->_request->getPost('contenido');

			if( $titulo != '' && $contenido ) {
				$data = array(
					'titulo' 	=> $titulo,
					'contenido' 	=> $contenido
				);
				$pagina = new Paginas();
				$pagina->insert( $data );
				$this->_redirect('/paginas/paginas/');
				return;
			}
		}

		$this->view->pagina = new stdClass();
		$this->view->pagina->id = null;
		$this->view->pagina->titulo = '';
		$this->view->pagina->contenido = '';

		$this->view->action = $this->info->sitio->paginas->agregar->action;
		$this->view->buttonText = $this->info->sitio->paginas->agregar->buttonText;
		$this->render();
	}

	function modificarAction(){
		//$info = Zend_Registry::get('personalizacion');
		if( !$this->view->usuarioLogueado){
			die( $this->info->sitio->paginas->modificar->msgRestringido);
		}

		$this->view->subtitle = $this->info->sitio->paginas->modificar->titulo;
		$eNoticia = new Paginas();
		if ($this->_request->isPost()) {
			Zend_Loader::loadClass('Zend_Filter_StripTags');

			$filter = new Zend_Filter_StripTags();

			$id 			= 	(int)$this->_request->getPost('id');
			$titulo	 	= trim($filter->filter($this->_request->getPost('titulo')));
			$contenido	= trim( $this->_request->getPost('contenido'));

			if ($id !== false) {
				if ($titulo != '' && $contenido != '' ) {
					$data = array(
						'titulo' 	=> $titulo,
						'contenido' 	=> $contenido
					);
					$where = 'id = ' . $id;
					$eNoticia->update($data, $where);
					$this->_redirect('/paginas/paginas/');
					return;
				} else {
					$this->view->paginas = $eNoticia->fetchRow('id='.$id);
				}
			}
		} else {
			$id = (int)$this->_request->getParam('id', 0);
			if ($id > 0) {
				$this->view->pagina = $eNoticia->fetchRow('id='.$id);
			}
		}
		$this->view->action = $this->info->sitio->paginas->modificar->action;
		$this->view->buttonText = $this->info->sitio->paginas->modificar->buttonText;

		$this->render();
	}

	function eliminarAction(){
		//$info = Zend_Registry::get('personalizacion');
		if( !$this->view->usuarioLogueado){
			die( $this->info->sitio->paginas->eliminar->msgRestringido);
		}

		$this->view->subtitle = $this->info->sitio->paginas->eliminar->titulo;
		$pagina = new Paginas();

		if ($this->_request->isPost()) {
			Zend_Loader::loadClass('Zend_Filter_Alpha');
			$filter = new Zend_Filter_Alpha();

			$id 	= (int)$this->_request->getPost('id');
			$del 	= $filter->filter($this->_request->getPost('del'));

			if ($del == 'Si' && $id > 0) {
				$where = 'id = ' . $id;
				$rows_affected = $pagina->delete($where);
			}
		} else {
			$id = (int)$this->_request->getParam('id');
			if ($id > 0) {
				$this->view->pagina = $pagina->fetchRow('id='.$id);
				if ($this->view->pagina->id > 0) {
					$this->render();
					return;
				}
			}
		}
		$this->_redirect('/paginas/paginas/');
	}

	function verAction(){
		//$info = Zend_Registry::get('personalizacion');
		$this->view->subtitle = $this->info->sitio->paginas->ver->titulo;
		$pagina = new Paginas();
		$id = (int)$this->_request->getParam('id', 0);
		if ($id > 0) {
			$this->view->pagina = $pagina->fetchRow('id='.$id);
		}
		$this->render();
	}
}
?>
