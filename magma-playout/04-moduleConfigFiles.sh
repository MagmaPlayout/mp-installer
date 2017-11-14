#!/bin/bash -e

echo "Generating mp-core config file..."

CURDIR=$(pwd)
echo "#Magma Playout Configuration File
redis_reconnection_timeout=1000
bash_timeout_ms=10000
melted_reconnection_tries=0

# In milliseconds
melted_reconnection_timeout=1000

# In minutes
melted_playlist_max_duration=120

# In minutes
melted_appender_worker_freq=10

mlt_framework_dir=$CURDIR/core/melted/installation/bin/
melt_path=$CURDIR/core/melted/installation/bin/melt
default_media_path=$CURDIR/../dependencies/default.png
mlt_spacers_path=$CURDIR/media/spacers/
devourer_input_dir=$CURDIR/media/input
devourer_output_dir=$CURDIR/media/output
devourer_thumb_dir=$CURDIR/gui/mp-ui-playout/src/assets/img/media-thumbnails/
medias_fps=60
devourer_ffmpeg_args= -f avi -c:v libx264 -qp 0
" >> ~/.magma-playout.conf

echo "Creating default directories..."
mkdir -p $CURDIR/media/input
mkdir -p $CURDIR/media/output
mkdir -p $CURDIR/media/spacers/

echo "Generating mp-admin-api config file..."
read -p "Enter MariaDB Password: " dbpass

echo "module.exports = {
	'secret': 'aguantemagmaplayout_\$123%4567Bd89AA654sdf-.,',
	'port' : 8080,
	'tokenExpires' : 86400, // In seconds - 86400 = 24 hours ,
	'db' : {
		'name' : 'mp_admin',
		'host' : '127.0.0.1',
		'user' : 'root',
		'password' : '$dbpass'
	}
};" >> store/mp-admin-api/config.js


echo "Generating mp-playout-api config file..."

echo "module.exports = {
	'rest' : {
		'secret': 'aguantemagmaplayout_\$123%4567Bd89AA654sdf-.,',
		'port' : 8001,
		'tokenExpires' : 86400, // In seconds - 86400 = 24 hours 
	},
	'ws' : {
		'port' : 8002
	},
	
	'logger': {
        'api': 'logs/api.log',
        'exception': 'logs/exceptions.log'
    },
	'db' : {
		'name' : 'mp_playout',
		'host' : '127.0.0.1',
		'user' : 'root',
		'password' : '$dbpass'
	}
};" >> store/mp-playout-api/config.js


echo "

The following files have default configuration, you should check them out to see if everything is OK:
	~/.magma-playout.conf
	$(pwd)/store/mp-admin-api/config.js
	$(pwd)/store/mp-playout-api/config.js
	
"



