<?php

class IndexController extends Zend_Controller_Action{

	function init(){
		$this->initView();
		$this->view->baseUrl = $this->_request->getBaseUrl();
		$this->view->setScriptPath('./application/views/scripts/');
		$this->view->user = Zend_Auth::getInstance()->getIdentity();
	}

	function indexAction(){
		$info = Zend_Registry::get('personalizacion');
		$this->view->title = $info->sitio->index->index->titulo;
		//$this->render();
		$this->_redirect('/noticias/noticias');
		return;
	}

}
?>
