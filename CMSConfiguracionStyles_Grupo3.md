# Introducción #

Partiendo de los [Requerimientos](http://code.google.com/p/surforce-cms/wiki/CMSRequerimientos) y de lo que tenemos asignado, nuestro trabajo es implementar un sub-sistema para administrar el diseño del sitio, para lograrlo vamos a usar esta pagina para hacer el primer boceto de la solución y dividir el trabajo para los desarrolladores actuales y para todos los que quieran sumarse.

Paso a documentar una de las posibles soluciones.


# Posible Solución #

La idea es controlar todo el diseño con un archivo CSS, el sitio tendría un "default.css", estructura base para los diseños, luego se podrán hacer copias de este (se haria con cada nuevo sub-sitio), luego implementariamos un formulario capaz de leer el archivo y mostrar las opciones para editarlo. Si tenemos por ej.:
```
body {
background: url('img/bg.png') center repeat-y #69842e;
font: 75% verdana, lucida, sans-serif;
margin: 0;
padding: 0;
color: #333;
text-align: center;
}

#banner {
background: url('img/bg-head.png') center repeat-y #ffc600;
margin: 0;
padding: 0 0 40px 0;
position: relative;
overflow: hidden;
}

```

"body" y "banner" serian nuestros objetos (por ponerle algun nombre ya que podrian ser etiquetas clases o convinaciones de estas dos), "background", "padding", "font", "position"... serian las propiedades de los objetos y por ultimo estarinan los valores para cada propiedad, "center", "relative", "#ffc600". Toda esta información y sus relaciones deberian guardarse en la base de datos y seria lo primero que tendriamos que definir. Las vistas tendrian que diseñarse solo con <div> (sin tablas) para que tengamos todo el control con nuestro archivo.<br>
<br>
<h3>Nuestro Trabajo:</h3>
<ol><li>Diseño del "default.css" con la estructura base del diseño.<br>
</li><li>Diseño de las tablas con las pripiedades y los posibles valores de estas.<br>
</li><li>Capacidad de leer e interpretar la estructura de un archivo css.<br>
</li><li>Despliegue de un formulario relacionando el "css" (leido en el punto anterior) y nuestra db para poder editarlo.<br>
</li><li>Por ultimo haria falta un script que sobreescriba el "css" con la información del formulario.</li></ol>

<h3>Su tarea:</h3>

Ahora les toca a ustedes dar su opinion, nada esta definido todavia solo es la idea que yo tengo sobre como encarar la solución, si tienen algo mejor solo proponganlo de la misma fomra que yo lo hice y lo discutimos, todo lo que venga para hacer de esto un trabajo sencillo y productivo es bienvenido, lo necesitamos ! ;). Por otro lado si les gusta esta solición que propongo me gustaria saber principalmente ¿como diseñarian las tablas? y ¿que datos guardarian en cada una de ellas?.<br>
<br>
Tenemos una semana y media (15 de agosto) para terminarlo a si que solo nos tomamos dos dias para definir esto que planteo aca y para que cada uno sepamos que parte del problema nos toca (pueden ir seleccionando alguna porcion que mas les guste asi no lo tengo que hacer yo al azar).<br>
<br>
<br>
Un saludo, lisandro.<br>
<br>
<h3>Actualizado el 08/08/07</h3>

Bueno... sacando un poco en limpio lo que tenemos que hacer es un mini y sencillo editor css,<br>
en un segundo paso será un ABM completo pero por ahora solo nos vamos a concentrar en la "M", o sea<br>
que solo vamos a permitir editar y las otras dos opciones (A=Alta,B=Baja) seran implementadas<br>
en la segudna etapa cuando se puedan crear sub-sitios.<br>
<br>
1 - Diseño del "default.css" y del formulario para poder editarlo.<br>
<blockquote>lisandro<br>
2 - Diseño de las tablas para guardar las etiquetas, propiedades, valores y unidades de un CSS.<br>
Aarón<br>
3 - Programar el controlador que lea la db y carge los datos en el formulario.<br>
Antonio<br>
4 - Programar la accion para el UPDATE con los datos del formulario, imagino que este es un buen momento para generar el ".css".<br>
Marcos</blockquote>

Trate de hacerlo lo mas parejo posible, si alguno termina rapido seria bueno que colabore con otro ya que tenemos solo una semana para que funcione.<br>
<br>
Desde ahora en más dudas y comentarios preferiblemente en el grupo3.<br>
<br>
Saludos, lisandro.<br>
<br>
<br>
<br>
