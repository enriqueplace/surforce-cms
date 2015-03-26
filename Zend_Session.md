# INTRODUCCION #

Zend\_Session ayuda a manejar y preservar datos de sesión, un complemento lógico de los datos cookie a través de múltiples peticiones de páginas por el mismo usuario.

Los datos en sesión son individualmente manipulados por el accesor de objetos Zend\_Session\_Namespace.

Zend\_Session\_Namespace provee una interfase estandarizada orientada a objetos para trabajar con namespaces persistidos dentro del mecanismo de sesión estándar de PHP ($_SESSION)_

# NAMESPACES #

Cada instancia de Zend\_Session\_Namespace corresponde a una entrada en el array superglobal $_SESSION, donde el namespace es usado como una clave de $_SESSION.

```
<?php

require_once 'Zend/Session/Namespace.php';

// Instanciamos un namespace
$miNuevoNamespace = new Zend_Session_Namespace('miNuevoNamespace');

// Asignamos elementos dentro del namespace
$miNuevoNamespace->nombre = 'Pepe';
$miNuevoNamespace->edad = '45';

// Instanciamos otro namespace
$otroNamespace = new Zend_Session_Namespace('otroNamespace ');

// Asignamos un elemento dentro del namespace
$otroNamespace ->estilo = 'moderno';

print_r($_SESSION);

?>
```

Donde la salida de print\_r($_SESSION) es:_

```
Array
(

    [miNuevoNamespace] => Array

        (

            [nombre] => Pepe

            [edad] => 45

        )

    [otroNamespace ] => Array

        (

            [estilo] => moderno

        )

)
```

Una vez que empezamos a utilizar Zend\_Session no se deberían modificar los datos de $_SESSION de forma directa, el método recomendado para manipular la información de sesión es a través de las instancias de Zend\_Session\_Namespace (en el ejemplo anterior llamadas "$miNuevoNamespace" y $otroNamespace)._


# NAMESPACE POR DEFECTO #

Si no se especifica un nombre al instanciar Zend\_Session\_Namespace se creará un namespace llamado 'Default'. Se puede utilizar de esta forma si solo se necesita trabajar con un namespace.
```
<?php

require_once 'Zend/Session/Namespace.php';

$defaultNamespace = new Zend_Session_Namespace();

$defaultNamespace->nombre = 'pepe';

print_r($_SESSION);

?>
```
Donde la salida de print\_r($_SESSION) es:
```
Array

(

    [Default] => Array

        (

            [nombre] => pepe

        )

)
```
# BLOQUEO DE NAMESPACES #_

Los namespaces se pueden bloquear para prevenir alteraciones en los datos que alojan aunque el bloqueo no tiene efecto sobre los métodos "setters" de los objetos.

Se utilizan los métodos:

  * lock() para bloquear un namespace haciéndolo de solo lectura.
  * unLock() para desbloquear un namespace permitiendo lectura y escritura.
  * isLocked() para testear si un namespace se encuentra bloqueado o no.

El bloqueo es pasajero, tiene efecto durante la ejecución de la petición y no persiste de una solicitud a otra.
```
<?php

require_once 'Zend/Session/Namespace.php';

$miNamespace = new Zend_Session_Namespace('miNamespace');

$miNamespace->lock();

// $miNamespace->nombre = 'pepe'; (No funcionaría y retornaría
// una excepción 'Zend_Session_Exception':
// 'This session/namespace has been marked as read-only.') 

if ($miNamespace->isLocked()) {

    $miNamespace->unLock();

}

$miNamespace->nombre = 'pepe';

?>
```
