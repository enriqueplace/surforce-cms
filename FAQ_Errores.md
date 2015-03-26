**Error:** Si al tratar de reconstruir el CMS localmente obtenemos la siguiente respuesta del servidor web Apache (puede variar el mensaje de acuerdo al producto): "El servidor encontro un error interno y fue imposible completar su solicitud (Error 500)"

**Solución:** si es la primera vez que se instala, uno de los primeros olvidos es que Zend necesita para trabajar que el servidor Apache tenga habilitado el módulo de mod\_rewrite.

Editar el archivo de configuración httpd.conf y descomentar la siguiente línea:

```
LoadModule rewrite_module modules/mod_rewrite.so
```

Luego, reiniciar el servidor.