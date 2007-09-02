<?php
class Configuraciones_ConfiguracionesController extends Zend_Controller_Action{

	function init(){
		$this->initView();
		$this->view->baseUrl = $this->_request->getBaseUrl();
		$this->view->setScriptPath('./application/views/scripts/');
		Zend_Loader::loadClass('Selectores');
		Zend_Loader::loadClass('Propiedades');
		Zend_Loader::loadClass('PropiedadesSelectores');
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
		$this->view->subtitle = $this->info->sitio->configuraciones->index->titulo;
		$selectores = new Selectores();
		$this->view->selectores = $selectores->fetchAll();
		$this->render();
	}

	function modificarAction(){
		//$info = Zend_Registry::get('personalizacion');
		if( !$this->view->usuarioLogueado){
			die( $this->info->sitio->configuraciones->modificar->msgRestringido );
		}
		$this->view->subtitle = $this->info->sitio->configuraciones->modificar->titulo;

		$eSelector = new Selectores();
		$ePropiedades = new Propiedades();
		$ePropiedadesSelectores = new PropiedadesSelectores;
		if ($this->_request->isPost()) {
			Zend_Loader::loadClass('Zend_Filter_StripTags');

			$filter = new Zend_Filter_StripTags();

			$id 			= 	(int)$this->_request->getPost('id');
			$selector	 	= trim($filter->filter($this->_request->getPost('selector')));
			$descripcion 	= trim($filter->filter($this->_request->getPost('descripcion')));

			if ($id !== false) {
				if ($selector != '') {
					$data = array(
						'selector' 	=> $selector,
						'descripcion' 	=> $descripcion
					);
					$where = 'id_selector = ' . $id;
					$eSelector->update($data, $where);

					//Recorremos todas las propiedades
					$propiedades = $ePropiedades->fetchAll();
					foreach ($propiedades as $propiedad):
						$valor 			= 	$this->_request->getPost($propiedad->id_propiedad);
						if($valor != ''):
							//Verificamos si hay que actualizar o agregar un nuevo registro
							$where = 'id_propiedad = ' . $propiedad->id_propiedad . ' and id_selector = '.$id;
							$ePropiedadSelector = $ePropiedadesSelectores->fetchRow($where);
							if($ePropiedadSelector != ''):
								$data = array(
									'valor' 	=> $valor
								);
								$ePropiedadesSelectores->update($data, $where);
							else:
								$data = array(
									'id_selector'	=> $id,
									'id_propiedad'	=> $propiedad->id_propiedad,
									'valor'			=> $valor
								);
								$ePropiedadesSelectores->insert($data);
							endif;
						endif;
					endforeach;
					$Selectores = $eSelector->fetchAll();
					$contenido = "";
					foreach($Selectores as $Selector):
						$contenido .= $Selector->selector;
						$contenido .= '{';
						$SelectoresPropiedades = $ePropiedadesSelectores->fetchAll('id_selector = ' . $Selector->id_selector);
						foreach($SelectoresPropiedades as $SelectorPropiedad):
							$propiedad =	$ePropiedades->fetchRow('id_propiedad=' . $SelectorPropiedad->id_propiedad);
							$contenido .= $propiedad->propiedad . ':' . $SelectorPropiedad->valor . ';';
						endforeach;

						$contenido .= '}';
					endforeach;
					$nombre_archivo = 'public/styles/site.css';
					if (!$gestor = fopen($nombre_archivo, 'w')) {
         				echo "No se puede abrir el archivo ($nombre_archivo)";
         				exit;
    				}

					if (fwrite($gestor, $contenido) === FALSE) {
       					echo "No se puede escribir al archivo ($nombre_archivo)";
        				exit;
    				}

					$this->_redirect('/configuraciones/configuraciones/');
					return;
				} else {
					$this->view->selector = $eSelector->fetchRow('id_selector='.$id);
				}
			}
		} else {
			$id = (int)$this->_request->getParam('id', 0);
			if ($id > 0) {

				$this->view->selector = $eSelector->fetchRow('id_selector='.$id);
				//Mostramos todas las propiedades
				$this->view->propiedades = $ePropiedades->fetchAll();
				//
				$this->view->pSelectores = $ePropiedadesSelectores->fetchAll('id_selector='.$id);
			}

			$this->view->action = $this->info->sitio->configuraciones->modificar->action;
			$this->view->buttonText = $this->info->sitio->configuraciones->modificar->buttonText;

			$this->render();

		}

	}
}
?>
