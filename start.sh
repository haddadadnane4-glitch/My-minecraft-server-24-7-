#!/bin/bash

echo "Starting Minecraft server..."

cd server
java -Xmx1G -Xms1G -jar paper.jar nogui &
cd ..

echo "Starting web server..."

node web/index.js &

echo "Starting Playit tunnel..."

bash playit.sh