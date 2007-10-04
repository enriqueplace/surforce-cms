<?php
require_once "public/scripts/fckeditor/fckeditor.php";

class Zend_View_Helper_FormFCKeditor
{
   private $_instanceName;
   private $_sBasePath;
   private $_oFCKeditor;

	public function formFCKeditor($instanceName = null, $contentValue = null )
	{
   	$this->_instanceName = $instanceName ;
      $this->_contentValue = $contentValue;
      $sBasePath = $_SERVER['PHP_SELF'];
      $sBasePath = substr( $sBasePath, 0, strpos( $sBasePath, "index.php" ) );

      $this->_sBasePath = $sBasePath . "public/scripts/fckeditor/";
      $this->_oFCKeditor = new FCKeditor($this->_instanceName) ;
      $this->_oFCKeditor->BasePath    = $this->_sBasePath ;
      $this->_oFCKeditor->Value        =  $this->_contentValue;
      $this->_oFCKeditor->Config['CustomConfigurationsPath'] = '../myconfig.js' ;
		$this->_oFCKeditor->Width  = '100%' ;
		$this->_oFCKeditor->Height = '600' ;
		return $this->_oFCKeditor->Create();
     }
 }
?>
