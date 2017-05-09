#!/bin/bash
# Overwrite these configurations:
REDIS_PATH=~/Documentos/PROYECTO_FINAL/Herramientas/redis-3.2.4/src
MELTED_PATH=~/melted/20160711


# Relative paths (no need to modify)
BASE_PATH="$(pwd)/magma-playout/"
CORE_API=$BASE_PATH"core/mp-core-api/"
CORE=$BASE_PATH"core/mp-core/dist/"
ADMIN_API=$BASE_PATH"store/mp-admin-api/"
PLAYOUT_API=$BASE_PATH"store/mp-playout-api/"
PLAYOUT_UI=$BASE_PATH"gui/mp-ui-playout/"

# Commands
MELTED_SERVER="/bin/bash -c './start-melted-server; exec /bin/bash -i'" # Keeps terminal open
REDIS_SERVER="redis-server"
REDIS_CLIENT="redis-cli"
NODE_SERVER="node server.js"
ANGULAR_SERVER="ng serve"
JAVA_CORE="java -jar mp-core.jar"

coredevel=$1
if [[ -n "$coredevel" ]]; then
	figlet "MP - Core Developer"
	
	# Runs only core related stuff. For developing.
	gnome-terminal --maximize \
			--tab --working-directory="$REDIS_PATH" -e "$REDIS_SERVER" --title="redis server" \
			--tab --working-directory="$REDIS_PATH" -e "$REDIS_CLIENT" --title="redis client1" \
			--tab --working-directory="$REDIS_PATH" -e "$REDIS_CLIENT" --title="redis client2" \
			--tab --working-directory="$MELTED_PATH" -e "$MELTED_SERVER" --title="melted" \
			&>/dev/null
else	
	figlet "Magma Playout"
	
	# Runs gnome-terminal with each app on a separate tab
	gnome-terminal --maximize \
			--tab --working-directory="$REDIS_PATH" -e "$REDIS_SERVER" --title="redis server" \
			--tab --working-directory="$MELTED_PATH" -e "$MELTED_SERVER" --title="melted" \
			--tab --working-directory="$CORE_API" -e "$NODE_SERVER" --title="core api" \
			--tab --working-directory="$ADMIN_API" -e "$NODE_SERVER" --title="admin api" \
			--tab --working-directory="$PLAYOUT_API" -e "$NODE_SERVER" --title="playout api" \
			--tab --working-directory="$CORE" -e "$JAVA_CORE" --title="core" \
			--tab --working-directory="$PLAYOUT_UI" -e "$ANGULAR_SERVER" --title="frontend" \
			&>/dev/null
fi			
			

