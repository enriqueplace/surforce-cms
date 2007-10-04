<?php
class Store_ProductController extends Zend_Controller_Action

{

    public function init()
    {
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

    public function indexAction()
    {
        print $this->view->render('store/product/productList.phtml');
    }



    public function showListAction()
    {
        echo "Store_ProductController::showAction";
    }



    public function __call($methodName, $args)
    {
        echo "Store_ProductController::" . $methodName;
    }

}

?>