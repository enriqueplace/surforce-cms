<?php

class Blog_IndexController extends Zend_Controller_Action{

	function init(){
		
		 // Local to this controller only; affects all actions, as loaded in init:
        $this->_helper->viewRenderer->setNoRender(true);

        // Globally:
        $this->_helper->removeHelper('viewRenderer');

        // Also globally, but would need to be in conjunction with the local
        // version in order to propagate for this controller:
        Zend_Controller_Front::getInstance()->setParam('noViewRenderer', true);
		$this->initView();
		$this->view->baseUrl = $this->_request->getBaseUrl();
        $this->view->setScriptPath('./application/views/scripts/');
	}

	function indexAction(){
		
		print $this->view->render('blog/index.phtml');
		
	}

}

?>