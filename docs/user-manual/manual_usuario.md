<h1 align="center"><p>Magma Playout</p>
<p>Manual de usuario</p></h1>

El sistema _"Magma Playout"_ permite administrar la programación de medios audiovisuales que serán transmitidos por algún medio de difusión soportado por la herramiente _"Melted"_.  

Para acceder al sistema se necesita el navegador web _"Google Chrome"_ y la URL de la instalación.

## Ejecución del sistema

Acceder al directorio de instalación del sistema y ejecutar desde una terminal el script ```run.sh```.  
Al finalizar su ejecución se mostrará el siguiente mensaje:  
<p align="left">
	<img src="imgs/run.png"/>
</p>  

Para acceder a las terminales específicas de cada proceso, se debe ejecutar el comando ```tmux attach-session -t magma```.  


## Inicio de sesión

​Al acceder a la URL del sistema (por defecto _http://localhost:4200_) se pide un usuario y contraseña.  
<p align="left">
	<img src="imgs/login.png"/>
</p>  
Si el sistema está recién instalado se puede acceder con el usuario ​_admin_ y contraseñ​a _admin_​ .  
​Referirse a la sección _Administración de usuarios_ para cambiar la contraseña inicial.​

Una vez autenticado en el sistema se puede ver la pantalla principal:  
<p align="left">
	<img src="imgs/main.png"/>
</p> 

### Panel de menú

Desde el panel de menú se puede navegar a las distintas pantallas del sistema.  
<p align="left">
	<img src="imgs/menu_panel.png"/>
</p> 

### Sección principal

La sección principal muestra las operaciones que se pueden realizar en la pantalla actual.

<p align="left">
	<img src="imgs/main_section.png"/>
</p> 

### Barra superior

La barra superior permite cerrar la sesión autenticada para el usuario actual.

<p align="left">
	<img src="imgs/logout.png"/>
</p> 

## Administración de usuarios

La administración de usuarios está ubicada en la pantalla _"Admin"_ accesible mediante el _"Panel de menú"_

<p align="left">
	<img src="imgs/admin_user.png"/>
</p> 

### Creación de usuario

Para crear un usuario se deben seguir los siguientes pasos, desde la pantalla _"Admin"_:

1. Hacer click en el botón de agregar.
1. Completar los campos _Name_, _Surname_.
1. Seleccionar el rol del usuario:
    - Super: Rol de tipo administrador, tiene acceso a todas las pantallas del sistema.
    - Programmer: Operador del playout. Tiene acceso a las pantallas _"Scheduler"_ y _"Live mode"_.
    - Reports: Este rol permite acceder únicamente a la pantalla _"Reports"_ para exportar reportes de reproducción.
    - Media: Este rol permite acceder únicamente a la pantalla _"Medias"_ donde se pueden administrar los medias con filtros y los metadatos de los medias cargados en el sistema.
1. Completar los campos _Username_ y _Password_ que determinan las credenciales de acceso al sistema.

### Baja de usuario

Para dar de baja un usuario se deben seguir los siguientes pasos, desde la pantalla _"Admin"_:

1. Identificar el usuario que se desea dar de baja en la grilla de usuarios.
1. Hacer click en el botón de eliminar ubicado a la derecha de la fila del usuario.

<p align="left">
	<img src="imgs/remove_user.png"/>
</p> 

### Modificación de rol

Para cambiar el rol de un usuario se deben seguir los siguientes pasos, desde la pantalla _"Admin"_:

1. Identificar el usuario que se desea modificar en la grilla de usuarios.
1. Hacer click en el selector de la columna _Role_ correspondiente al usuario a modificar.
1. Seleccionar el nuevo rol para el usuario.

<p align="left">
	<img src="imgs/user_role.png"/>
</p> 

## Administración de medias

Para cargar medias en el sistema se debe utilizar la herramienta **mp-devourer** desde una terminal conectada al servidor donde se ejecuta _Melted_.

1. Copiar los medias a utilizar al directorio _"inputDir_" definido en el archivo de configuración _"~/.magma-playout.conf"_ del usuario con el que se ejecuta el sistema.
1. Ejecutar el comando _./mp-devourer.sh_ ubicado en el directorio raíz de la instalación del sistema y esperar a que termine.
1. Los medias cargados estarán visibles en las pantallas _"Medias"_, _"Scheduller"_ y _"Live mode"_.

### Creación de filtros

Para aplicar un filtro a un media se deben seguir los siguientes pasos desde la pantalla _"Medias"_:

1. Seleccionar desde la grilla el media al aplicar el filtro.
1. Hacer click sobre el botón de _"New"_ identificado por el signo _"+"_.
1. Seleccionar el filtro deseado en el combo _"Filter"_.
1. Completar el campo _"Name"_ con el nombre que va a identificar al nuevo _media_ con filtro.
1. Hacer click sobre el botón _"Save"_.

<p align="left">
	<img src="imgs/new_filter.png"/>
</p> 

### Edición de datos

Para editar los datos de un media se deben seguir los siguientes pasos deste la pantalla _"Medias"_:

1. Seleccionar desde la grilla el media a modificar.
1. Hacer click sobre el botón de _"Edit"_.
1. Realizar las modificaciones sobre _"Name"_, _"Filter"_ o _"Tags"_ según sea necesario.
1. Hacer click sobre el botón _"Save"_.

## Modo _"En Vivo"_

El modo "en vivo" permite reemplazar la lista de reproducción programada en el modo _"Scheduler"_ por una nueva lista.  

La pantalla está dividida en dos columnas: "Medias" y "Playout list".  
Al arrastrar medias desde la columna "Medias" a la columna "Playout list" se agregan a la lista de reproducción del modo en vivo.

Para aplicar la lista de reproducción configurada se debe hacer click en el botón de cambio de modo a _"Live Mode"_.

<p align="left">
	<img src="imgs/livemode.png"/>
</p> 

## Modo _"Programador"_

El modo "Programador" permite especificar una fecha y hora en la cual reproducir un media determinado.

La pantalla se divide en dos columnas "Medias" y la vista de calendario.  
La forma de programar un media en una determinada fecha hora es mediante "click" y arrastrar medias desde la columna "Medias" al calendario, en la fecha y hora deseados.

Los cambios realizados sobre el calendario solo se harán efectivos al hacer click sobre el botón _"Save"_.

Para cambiar de modo "Live" a modo "Scheduler" se debe utilizar el botón "Switch to programmer mode".

<p align="left">
	<img src="imgs/schedulermode.png"/>
</p> 

## Previsualización de medias

Para previsualizar medias se debe estar en la pantalla de _Modo en vivo_ o _Modo programador_ y posicionar el puntero del mouse sobre el media que se desea previsualizar.

La imagen que identifica al media empezará a cambiar mostrando distintas imágenes correspondientes al media.

Estas imágenes se generan al importar los medias en el sistema utilizando el _mp-devourer_.

## Reportes

La pantalla _"Reports"_ permite buscar en el registro de reproducción por un media en particular en un rango de fechas determinado.

<p align="left">
	<img src="imgs/reports.png"/>
</p> 

### Exportación a CSV

Para exportar un reporte a _csv_ se debe hacer click sobre el botón _"Export"_.  
El navegador comenzará a bajar un archivo de tipo _.csv_ con los contenidos del reporte generado desde el sistema.