#!/bin/bash -e

echo "Building stream-m..."
if [ -d stream-m ]; then
	git pull
else
	git clone https://github.com/MagmaPlayout/stream-m.git
fi

cd stream-m
ant -f $(pwd) -Dnb.internal.action.name=rebuild clean jar

outputDir=../../../magma-playout/core/stream-m
mkdir -p $outputDir
cp dist/stream-m.jar $outputDir
cp dist/player-demo.zip $outputDir
cp dist/console.zip $outputDir
cp ../stream-m.properties $outputDir
echo "Done building stream-m."
