#!/bin/bash

echo "Starting Minecraft server..."

java -Xmx1G -Xms1G -jar server/paper.jar nogui &

echo "Starting Playit tunnel..."

./playit --secret $PLAYIT_SECRET

echo "Starting web server..."

node web/index.js