# Manual de Instalación

## Requerimientos 

Antes de comenzar la instalación de _Magma Playout_ se debe contar con 
una computadora con las siguientes características mínimas:  
  * Procesador de 2 núcleos de 2.6 GHz
  * 8 Gb de memoria RAM
  * 500 Gb de almacenamiento
  * Sistema operativo Debian 8  
  * Conexión a internet activa


## Instalación

El proceso de instalación de _Magma Playout_ se realiza en su totalidad desde
una terminal y tarda aproximadamente 45 minutos en completar.  
A continuación se describen los pasos para instalar el sistema bajando todo lo 
necesario de internet o desde el archivo **MagmaPlayout.zip**.


1. El primer paso es instalar el comando _sudo_, configurarlo y reiniciar la computadora.  
Desde una terminal ejecutar los siguientes comandos:
>  ```bash
>  su  
>  apt-get -y install sudo  
>  # En el siguiente comando reemplazar <username> con el
>  # nombre del usuario de Debian que se está utilizando
>  usermod -aG sudo <username>  
>  # La computadora se va a reiniciar
>  reboot
>  ``` 

### Instalación desde internet

Abrir una terminal y ejecutar los siguientes comandos:  

1. ```cd```
1. ```sudo apt-get -y install git```
1. ```git clone https://github.com/MagmaPlayout/mp-installer.git```
1. ```cd mp-installer``` 
1. ```./install.sh```

### Instalación desde MagmaPlayout.zip

Copiar el archivo _MagmaPlayout.zip_ al directorio _~/_, abrir una terminal 
y ejecutar los siguientes comandos:  

1. ```cd ~/mp-installer/```
1. ```./install.sh```

## Configuración

El sistema cuenta con los siguientes archivos de configuración:
1. ```~/.magma-playout.conf```
1. ```~/mp-installer/magma-playout/core/mp-core-api/config.js```
1. ```~/mp-installer/magma-playout/store/mp-admin-api/config.js```
1. ```~/mp-installer/magma-playout/store/mp-playout-api/config.js```

De los cuatro archivos enumerados solo el primero debe ser modificado, los restantes
cuentan con una configuración válida que no es necesario cambiar.  
A continuación se describen las claves de cada archivo de configuración.

### ~/.magma-playout.conf
```bash
# ------------------------------- #
# Core config ------------------- #
# ------------------------------- #

# Duración en minutos a mantener en la lista de melted
melted_playlist_max_duration: 120 
# Frecuencia de trabajo del thread que vigila el tiempo restante 
# de la lista de melted
melted_appender_worker_freq: 5
# Directorio a la instalación de melt
melt_path: /usr/bin/melt/melt
# Directorio al media por defecto. Debe ser un directorio válido a una imágen.
default_media_path: /usr/local/magma-playout/default.mlt
# Directorio temporal donde se van a poner los archivos .mlt 
# "espaciadores" con el media por defecto
mlt_spacers_path: /usr/local/magma-playout/spacers/

# ------------------------------- #
# mp-devourer config ------------ #
# ------------------------------- #

# FPS al cual se van a transcodear todos los medias cargados
medias_fps: 60
# Directorio de entrada del cual cargar los medias al sistema
devourer_input_dir: EDIT ME!
# Directorio de salida donde se guardan los medias transcodeados
devourer_output_dir: EDIT ME!
# Directorio de thumbnails del frontend
devourer_thumb_dir: EDIT ME!
# Directorio de la instalación del MLT Framework
mlt_framework_dir: EDIT ME!
# Argumentos de transcodificación
devourer_ffmpeg_args: -f avi -c:v libx264 -qp 0

# ------------------------------- #
# Common config ----------------- #
# ------------------------------- #

# Urls de las APIs para las BD 
playout_api_url: http://localhost:8001/api/
admin_api_url: http://localhost:8080/api/
```

