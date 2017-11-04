#!/bin/bash -e

# Relative paths (no need to modify)
BASE_PATH="$(pwd)/magma-playout/"
MELTED_PATH=$BASE_PATH"core/melted/installation/"
MELTED_STATUS_PATH=$BASE_PATH"core/mp-melted-status/dist/"
CORE_API=$BASE_PATH"core/mp-core-api/"
CORE=$BASE_PATH"core/mp-core/dist/"
ADMIN_API=$BASE_PATH"store/mp-admin-api/"
PLAYOUT_API=$BASE_PATH"store/mp-playout-api/"
PLAYOUT_UI=$BASE_PATH"gui/mp-ui-playout/"
REDIS_PATH=$BASE_PATH"core/redis/src/"

# Commands
MELTED_SERVER="./start-melted-server"
MELTED_STATUS="java -jar mp-melted-status.jar"
REDIS_SERVER="./redis-server"
REDIS_CLIENT="./redis-cli"
NODE_SERVER="node server.js"
ANGULAR_SERVER="ng serve"
JAVA_CORE="java -jar mp-core.jar"

if [[ $1 == "gui" ]]; then
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
	echo "Creating tmux session..."
	tmux -f dependencies/sources/tmux.conf new -s magma -d 
	tmux new-window -n redis  -t magma -c "$REDIS_PATH" "$REDIS_SERVER"
	tmux new-window -n melted -t magma -c "$MELTED_PATH" "$MELTED_SERVER"
	tmux new-window -n status -t magma -c "$MELTED_STATUS_PATH" "$MELTED_STATUS"
	tmux new-window -n coreapi  -t magma -c "$CORE_API" "$NODE_SERVER"
	tmux new-window -n adminapi -t magma -c "$ADMIN_API" "$NODE_SERVER"
	tmux new-window -n playoutapi -t magma -c "$PLAYOUT_API" "$NODE_SERVER"
	tmux new-window -n core -t magma -c "$CORE" "$JAVA_CORE"
	tmux new-window -n gui  -t magma -c "$PLAYOUT_UI" "$ANGULAR_SERVER"
	echo "Done! now run: "
	echo "    tmux attach-session -t magma"
	echo " use (Ctrl+B)(r) shortcut to respawn a killed command"
fi

