#!/bin/bash

echo "🚀 Starting Minecraft server setup..."

# Go to server folder
cd /data

# Ensure plugins folder exists
mkdir -p plugins

echo "📦 Downloading plugins..."

cd plugins

# ViaVersion
curl -L -o ViaVersion.jar https://hangarcdn.papermc.io/plugins/ViaVersion/ViaVersion/versions/latest

# ViaBackwards
curl -L -o ViaBackwards.jar https://hangarcdn.papermc.io/plugins/ViaVersion/ViaBackwards/versions/latest

# ViaRewind
curl -L -o ViaRewind.jar https://github.com/ViaVersion/ViaRewind/releases/latest/download/ViaRewind.jar

# Geyser (Spigot)
curl -L -o Geyser-Spigot.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot

cd /data

echo "🎮 Starting Paper server..."

# Start server (works even if jar name slightly changes)
java -Xms512M -Xmx512M -jar paper.jar nogui