FROM eclipse-temurin:21-jre

WORKDIR /server

RUN apt-get update && apt-get install -y wget jq curl

# Download Paper ONLY (stable part)
RUN BUILD=$(wget -qO- "https://api.papermc.io/v2/projects/paper/versions/1.21.11" | jq -r '.builds[-1]') && \
    wget -O server.jar "https://api.papermc.io/v2/projects/paper/versions/1.21.11/builds/${BUILD}/downloads/paper-1.21.11-${BUILD}.jar"

RUN echo "eula=true" > eula.txt

EXPOSE 25565

# Install plugins ON START (NOT BUILD)
CMD sh -c "\
mkdir -p plugins && \
cd plugins && \
curl -L -o Geyser.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot && \
curl -L -o Floodgate.jar https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot && \
curl -L -o ViaVersion.jar https://ci.viaversion.com/job/ViaVersion/lastSuccessfulBuild/artifact/build/libs/ViaVersion.jar && \
curl -L -o ViaBackwards.jar https://ci.viaversion.com/job/ViaBackwards/lastSuccessfulBuild/artifact/build/libs/ViaBackwards.jar && \
curl -L -o ViaRewind.jar https://ci.viaversion.com/job/ViaRewind/lastSuccessfulBuild/artifact/build/libs/ViaRewind.jar && \
java -Xms512M -Xmx512M -jar ../server.jar nogui"