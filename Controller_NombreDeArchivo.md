# Introduction #

Tuvimos problemas con un controller que fallaba inexplicablemente, y al final detectamos que era simplemente por el nombre del archivo.


# Details #

Se había creado un FAQsController.php y este fallaba solo en GNU/Linux. El desarrollo se había probado localmente en una Mac y luego en un Windows, sin problemas, pero al subir al servidor de producción en Linux esta parte fallaba.

Se solucionó cambiando el nombre a FaqsController.php

La regla sugerida es usar solo la primer letra en mayúsculas, el resto en minúsculas.