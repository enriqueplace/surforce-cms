<?php
class Faqs_FaqsController extends Zend_Controller_Action{

	function init(){
		$this->initView();
		$this->view->baseUrl = $this->_request->getBaseUrl();
		$this->view->setScriptPath('./application/views/scripts/');
		Zend_Loader::loadClass('Faqs');
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
		$this->view->subtitle = $this->info->sitio->faqs->index->titulo;

		$faqs = new Faqs();
		$this->view->faqs = $faqs->fetchAll();
		$this->render();
	}

	function agregarAction(){
		//$info = Zend_Registry::get('personalizacion');
		if( !$this->view->usuarioLogueado){
			die( $this->info->sitio->faqs->agregar->msgRestringido );
		}
		$this->view->subtitle = $this->info->sitio->faqs->agregar->titulo;

		if ($this->_request->isPost()) {
			Zend_Loader::loadClass('Zend_Filter_StripTags');
			$filter 	= new Zend_Filter_StripTags();

			$pregunta 	= trim($filter->filter($this->_request->getPost('pregunta')));
			$respuesta 	= trim($filter->filter($this->_request->getPost('respuesta')));

			if( $pregunta != '' && $respuesta != '' ) {
				$data = array(
					'pregunta' 	=> $pregunta,
					'respuesta' => $respuesta
				);
				$faq = new Faqs();
				$faq->insert( $data );
				$this->_redirect('/faqs/faqs/');
				return;
			}
		}
		$this->view->faq = new stdClass();
		$this->view->faq->id = null;
		$this->view->faq->pregunta = '';
		$this->view->faq->respuesta = '';

		$this->view->action = $this->info->sitio->faqs->agregar->action;
		$this->view->buttonText = $this->info->sitio->faqs->agregar->buttonText;
		$this->render();
	}

	function modificarAction(){
		//$info = Zend_Registry::get('personalizacion');
		if( !$this->view->usuarioLogueado){
			die( $this->info->sitio->faqs->modificar->msgRestringido );
		}
		$this->view->subtitle = $this->info->sitio->faqs->modificar->titulo;

		$eFAQ = new Faqs();
		if ($this->_request->isPost()) {
			Zend_Loader::loadClass('Zend_Filter_StripTags');

			$filter = new Zend_Filter_StripTags();

			$id 		= (int)$this->_request->getPost('id');
			$pregunta	= trim($filter->filter($this->_request->getPost('pregunta')));
			$respuesta 	= trim($filter->filter($this->_request->getPost('respuesta')));

			if ($id !== false) {
				if ($pregunta != '' && $respuesta != '' ) {
					$data = array(
						'pregunta' 	=> $pregunta,
						'respuesta' => $respuesta
					);
					$where = 'id = ' . $id;
					$eFAQ->update($data, $where);
					$this->_redirect('/faqs/faqs/');
					return;
				} else {
					$this->view->faq = $eFAQ->fetchRow('id='.$id);
				}
			}
		} else {
			$id = (int)$this->_request->getParam('id', 0);
			if ($id > 0) {
				$this->view->faq = $eFAQ->fetchRow('id='.$id);
			}
		}
		$this->view->action = $this->info->sitio->faqs->modificar->action;
		$this->view->buttonText = $this->info->sitio->faqs->modificar->buttonText;

		$this->render();
	}

	function eliminarAction(){
		//$info = Zend_Registry::get('personalizacion');
		if( !$this->view->usuarioLogueado){
			die( $this->info->sitio->faqs->eliminar->msgRestringido);
		}

		$this->view->subtitle = $this->info->sitio->faqs->eliminar->titulo;
		$faq = new Faqs();

		if ($this->_request->isPost()) {
			Zend_Loader::loadClass('Zend_Filter_Alpha');
			$filter = new Zend_Filter_Alpha();

			$id 	= (int)$this->_request->getPost('id');
			$del 	= $filter->filter($this->_request->getPost('del'));

			if ($del == 'Si' && $id > 0) {
				$where = 'id = ' . $id;
				$rows_affected = $faq->delete($where);
			}
		} else {
			$id = (int)$this->_request->getParam('id');
			if ($id > 0) {
				$this->view->faq = $faq->fetchRow('id='.$id);
				if ($this->view->faq->id > 0) {
					$this->render();
					return;
				}
			}
		}
		$this->_redirect('/faqs/faqs/');
	}

	function verAction(){
		//$info = Zend_Registry::get('personalizacion');
		$this->view->subtitle = $this->info->sitio->faqs->ver->titulo;
		$faq = new Faqs();
		$id = (int)$this->_request->getParam('id', 0);
		if ($id > 0) {
			$this->view->faq = $faq->fetchRow('id='.$id);
		}
		$this->render();
	}
}
?>