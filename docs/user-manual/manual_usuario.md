<h1 align="center"><p>Magma Playout</p>
<p>Manual de usuario</p></h1>

El sistema _"Magma Playout"_ permite administrar la programación de medios audiovisuales que serán transmitidos por algún medio de difusión soportado por la herramiente _"Melted"_.  

Para acceder al sistema se necesita el navegador web _"Google Chrome"_ y la URL de la instalación.


## Inicio de sesión

​Al acceder a la URL del sistema se pide un usuario y contraseña.
Si el sistema está recién instalado se puede entrar con el usuario ​_admin_ y contraseñ​a _admin_​ . ​Referirse a la sección _Administración de usuarios_ para cambiar la contraseña inicial.​

Una vez autenticado en el sistema se puede ver la pantalla principal:  
**TODO: IMG**

### Panel de menú

Desde el panel de menú se puede navegar a las distintas pantallas del sistema.  
**TODO: IMG**

### Sección principal

La sección principal muestra las operaciones que se pueden realizar en la pantalla actual.

**TODO: IMG**

### Barra superior

La barra superior permite cerrar la sesión autenticada para el usuario actual.

**TODO: IMG**

## Administración de usuarios

## Administración de medias

Para cargar medias en el sistema se debe utilizar la herramienta **mp-devourer** desde una terminal conectada al servidor donde se ejecuta _Melted_.  
1. Copiar los medias a utilizar al directorio _"inputDir_" definido en el archivo de configuración _"~/.magma-playout.conf"_ del usuario con el que se ejecuta el sistema.
1. Ejecutar el comando _./mp-devourer.sh_ ubicado en el directorio raíz de la instalación del sistema.


### Creación de filtros


### Edición de datos

## Modo _"En Vivo"_

## Modo _"Programador"_

## Previsualización de medias

Para previsualizar medias se debe estar en la pantalla de _Modo en vivo_ o _Modo programador_ y posicionar el puntero del mouse sobre el media que se desea previsualizar.  
La imagen que identifica al media empezará a cambiar mostrando distintas imágenes correspondientes al media.  
Estas imágenes se generan al importar los medias en el sistema utilizando el _mp-devourer_.

## Reportes

### Exportación a CSV

Para exportar un reporte a _csv_ se debe hacer click sobre el botón _"Export"_