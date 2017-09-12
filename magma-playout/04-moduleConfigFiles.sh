#!/bin/bash -e

echo "Generating mp-core config file..."

echo "redis_server_hostname=localhost
redis_server_port=6379
redis_reconnection_timeout=1000
bash_timeout_ms=10000
redis_fscp_channel=FSCP
redis_pccp_channel=PCCP
melted_server_hostname=localhost
filter_server_hostname=localhost\:3001/filter-banner.html
melted_reconnection_timeout=1000
melt_path=
melted_reconnection_tries=0
melted_server_port=5250
melted_playlist_max_duration=120
mlt_spacers_path=
melted_appender_worker_freq=1
default_media_path=" >> ~/.magma-playout.conf


echo "Generating ingest server config file..."

echo "ffmpeg_path=
media_directory=
ffprobe_path=
redis_port=6379
redis_host=localhost
thumbnail_dir=" >> ~/.magma-playout/ingestserver.properties


echo "Generating mp-admin-api config file..."

echo "module.exports = {
	'secret': 'aguantemagmaplayout_\$123%4567Bd89AA654sdf-.,',
	'port' : 8080,
	'tokenExpires' : 86400, // In seconds - 86400 = 24 hours ,
	'db' : {
		'name' : 'mp_admin',
		'host' : '127.0.0.1',
		'user' : 'root',
		'password' : 'password'
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
		'password' : 'password'
	}
};" >> store/mp-playout-api/config.js


echo "

You need to configure the modules manually by writing on the following files:
	~/.magma-playout.conf
	~/.magma-playout/ingestserver.properties
	$(pwd)/store/mp-admin-api/config.js
	$(pwd)/store/mp-playout-api/config.js
	
"



