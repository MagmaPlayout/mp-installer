#!/bin/bash
CONFIG_FILE=run.cfg
if [ ! -f ./$CONFIG_FILE ]; then
	echo "REDIS_PATH=" > $CONFIG_FILE
	echo "MELTED_PATH=" >> $CONFIG_FILE
 	
 	figlet "Configure first"
 	echo "Configure redis and melted path's on run.cfg file before running this script"
	exit 1 
fi

# Load configs
. ./$CONFIG_FILE
if [ -z $REDIS_PATH ] || [ -z $MELTED_PATH ]; then
 	figlet "Configure first"
 	echo "Configure redis and melted path's on run.cfg file before running this script"
	exit 1 
fi





# Relative paths (no need to modify)
BASE_PATH="$(pwd)/magma-playout/"
STREAM_M_PATH=$BASE_PATH"core/stream-m"
CORE_API=$BASE_PATH"core/mp-core-api/"
CORE=$BASE_PATH"core/mp-core/dist/"
ADMIN_API=$BASE_PATH"store/mp-admin-api/"
PLAYOUT_API=$BASE_PATH"store/mp-playout-api/"
PLAYOUT_UI=$BASE_PATH"gui/mp-ui-playout/"


# Commands
MELTED_SERVER="/bin/bash -c './start-melted-server; exec /bin/bash -i'" # Keeps terminal open
REDIS_SERVER="./redis-server"
REDIS_CLIENT="./redis-cli"
NODE_SERVER="node server.js"
ANGULAR_SERVER="ng serve"
JAVA_CORE="java -jar mp-core.jar"
JAVA_STREAM_M="java -jar stream-m.jar stream-m.properties"


if [[ $1 == "coreSmall" ]]; then
	figlet "MP - Core Developer"
	
	# Runs only core related stuff. For developing.
	gnome-terminal --maximize \
			--tab --working-directory="$REDIS_PATH" -e "$REDIS_SERVER" --title="redis server" \
			--tab --working-directory="$REDIS_PATH" -e "$REDIS_CLIENT" --title="redis client1" \
			--tab --working-directory="$REDIS_PATH" -e "$REDIS_CLIENT" --title="redis client2" \
			--tab --working-directory="$STREAM_M_PATH" -e "$JAVA_STREAM_M" --title="streamM" \
			--tab --working-directory="$MELTED_PATH" -e "$MELTED_SERVER" --title="melted" \
			&>/dev/null
elif [[ $1 == "core" ]]; then
	figlet "MP - Core Developer"
	
	# Runs everything but core java module. For developing.
	gnome-terminal --maximize \
			--tab --working-directory="$REDIS_PATH" -e "$REDIS_SERVER" --title="redis server" \
			--tab --working-directory="$REDIS_PATH" -e "$REDIS_CLIENT" --title="redis client1" \
			--tab --working-directory="$REDIS_PATH" -e "$REDIS_CLIENT" --title="redis client2" \
			--tab --working-directory="$MELTED_PATH" -e "$MELTED_SERVER" --title="melted" \
			--tab --working-directory="$STREAM_M_PATH" -e "$JAVA_STREAM_M" --title="streamM" \
			--tab --working-directory="$CORE_API" -e "$NODE_SERVER" --title="core api" \
			--tab --working-directory="$ADMIN_API" -e "$NODE_SERVER" --title="admin api" \
			--tab --working-directory="$PLAYOUT_API" -e "$NODE_SERVER" --title="playout api" \
			--tab --working-directory="$PLAYOUT_UI" -e "$ANGULAR_SERVER" --title="frontend" \
			&>/dev/null
elif [[ $1 == "gui" ]]; then
	figlet "MP - GUI Developer"

	# Runs only gui related stuff. For developing.
	gnome-terminal --maximize \
			--tab --working-directory="$REDIS_PATH" -e "$REDIS_SERVER" --title="redis server" \
			--tab --working-directory="$REDIS_PATH" -e "$REDIS_CLIENT" --title="redis client1" \
			--tab --working-directory="$ADMIN_API" -e "$NODE_SERVER" --title="admin api" \
			--tab --working-directory="$PLAYOUT_API" -e "$NODE_SERVER" --title="playout api" \
			--tab --working-directory="$CORE_API" -e "$NODE_SERVER" --title="core api" \
			&>/dev/null
else	
	figlet "Magma Playout"
	
	# Runs gnome-terminal with each app on a separate tab
	gnome-terminal --maximize \
			--tab --working-directory="$REDIS_PATH" -e "$REDIS_SERVER" --title="redis server" \
			--tab --working-directory="$STREAM_M_PATH" -e "$JAVA_STREAM_M" --title="streamM" \
			--tab --working-directory="$MELTED_PATH" -e "$MELTED_SERVER" --title="melted" \
			--tab --working-directory="$CORE_API" -e "$NODE_SERVER" --title="core api" \
			--tab --working-directory="$ADMIN_API" -e "$NODE_SERVER" --title="admin api" \
			--tab --working-directory="$PLAYOUT_API" -e "$NODE_SERVER" --title="playout api" \
			--tab --working-directory="$CORE" -e "$JAVA_CORE" --title="core" \
			--tab --working-directory="$PLAYOUT_UI" -e "$ANGULAR_SERVER" --title="frontend" \
			&>/dev/null
fi			
			





