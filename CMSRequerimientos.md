# Introduction #

_"Crear un CMS base para el sitio de cualquier organización y sus proyectos"_

  * La idea es contar con un sitio con contenido dinámico que un usuario “no técnico” pueda mantener fácilmente todo su contenido, que incluye textos, enlaces, menús, imágenes y archivos de documentos.

# Arquitectura General de la Solución #

  1. **"Contenidos":** permitir crear dinámicamente todas las páginas de los sitios y sus proyectos. Posteriormente a la creación de las mismas el usuario deberá contar con la posibilidad de seleccionar libremente cómo será el acceso a la página desde el menú (menú dinámico creado por el usuario).
  1. **"Secciones":** Cada opción del menú principal (izquierda) permite ingresar a las "secciones" del sitio, donde cada una de estas tendrá su propio menú interno (a continuación de la izquierda, o un menú superior horizontal, a definir).
    * Cada opción del menú interno enlaza con los contenidos (creados en el punto 1).
    * Sección "Proyectos" tiene una introducción a la sección general y un menú interno contendrá opciones como "Proyecto A", "Sub Proyecto B", "Página de Documentos",  etc.
    * Se puede asociar un enlace a un contenido o a un sub-sitio (un concepto distinto, más independiente, recursivo al sitio original).
  1. **"Sub-sitios":** en vez de crear un "contenido" o una "sección" con enlaces a contenidos, se podrá armar un sitio con dirección ”http://www.sitio.com/subsitio” en el cual responderá con su propia estética (si así se desea), pero con la misma funcionalidad, independientemente del sitio "padre" (se creará siempre un enlace por ej. en el cabezal) que permita ir al sitio base, o que diga "Sitio del Proyecto XXX de la organización", etc.).
    * Por ejemplo: "Proyecto Cultural" que contendrá un cabezal nuevo, colores diferenes, sus propias opciones, etc.

# Funcionalidades a Implementar #

En base a la lista de requerimientos que se extrae todas las funcionalidades que se necesitarán implementar para cubrirla completamente.

## Administración de Usuarios ##

  * Manejo de "usuario simple" (admin) que pueda administrador todo el sitio. Prever el caso de tener que manejar más de un usuario y diferenciar zonas.
  * Por ej. crear usuarios para ingresar solo noticias.

## Administración de menús ##

  * Principal: menús con enlaces / menús centrales con imágenes (opcional)
  * Secciones: menús con enlaces / menús con imágenes, posición opcional (centro, arriba, izquierda)

## Administración de Contenidos ##

  * Crear páginas con contenidos que luego serán linkeadas desde los menús.
  * Permitir subir archivos
  * Ingresar Decretos / Documentos / Leyes / etc que tienen un formato pre-establecido (perfectamente puede ser un contenido estándar que es generado por el usuario).
  * Permitir que en el pié de cada contenido agregar lista de "documentos relacionados" (opcional: manejo de “tags”)

## Administración de subsitios ##

  * Permitir crear uno o varios subsitios a partir del original, deben ser independientes, el CMS deberá poder administrar a todos los existentes con transparencia.

## Administración de configuraciones ##

  * Fundamentalmente que el usuario pueda controlar la estética, teniendo en cuenta que existen varios sitios, el principal y los subsitios.

## Administración de Noticias ##

  * Página principal de cada sitio / subsitio
  * Una imagen por noticia (opcional: manejo de “tags” por tema)
  * Que el sitio principal pueda incluir las noticias de todos los subsitios (opcional, configurable).

# Planificación: entregables #

**Inicio del proyecto 1ro de Agosto** - Las fechas y funcionalidades de los productos son estimaciones, podrán sufrir cambios durante el proceso de desarrollo.

Se divide en 3 entregables,

## 1ra entrega 15 de Agosto - "Implementación de la Funcionalidad Base" ##

Contemplar la primera versión con las funcionalidades base del sistema CMS. En las posteriores entregas se irán completando los pendientes de cada ítem.

  * Inicio implementación sistema base
  * Inicio implementación manejo de usuarios
  * Inicio implementación manejo de contenidos 1er nivel (no subsitios)
    * menús
    * Noticias
    * Páginas estáticas.
    * FAQ

## 2da entrega 31 de agosto - "Implementación de los Subsitios" ##

  * Inicio implementación subsitios
  * Se continúa con implementación y cierre del manejo de contenidos
  * Se continúa con implementación y cierre del manejo de usuarios

## 3ra entrega - 30 de setiembre - "Cierre del producto" ##

  * Inicio implementación sistema de administración para el usuario webmaster
    * manejo de estilos / estética
  * Instalación / configuración funcionalidades adicionales
  * Re-work (correcciones o mejoras menores)