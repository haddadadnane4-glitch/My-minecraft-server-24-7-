mkdir -p /data/plugins

echo "Downloading plugins..."

cd /data/plugins

curl -L -o ViaVersion.jar https://hangarcdn.papermc.io/plugins/ViaVersion/ViaVersion/versions/latest
curl -L -o ViaBackwards.jar https://hangarcdn.papermc.io/plugins/ViaVersion/ViaBackwards/versions/latest
curl -L -o ViaRewind.jar https://github.com/ViaVersion/ViaRewind/releases/latest/download/ViaRewind.jar
curl -L -o Geyser-Spigot.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot

cd /data

java -jar paper*.jar
