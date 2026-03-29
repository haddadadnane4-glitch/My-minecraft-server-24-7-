FROM eclipse-temurin:21-jre

WORKDIR /server

RUN apt-get update && apt-get install -y wget jq curl

# ------------------------
# PAPER SERVER
# ------------------------
RUN BUILD=$(wget -qO- "https://api.papermc.io/v2/projects/paper/versions/1.21.11" | jq -r '.builds[-1]') && \
    wget -O server.jar "https://api.papermc.io/v2/projects/paper/versions/1.21.11/builds/${BUILD}/downloads/paper-1.21.11-${BUILD}.jar"

# EULA
RUN echo "eula=true" > eula.txt

# Plugins folder
RUN mkdir -p plugins

# ------------------------
# GEYSER + FLOODGATE
# ------------------------
RUN wget -O plugins/Geyser-Spigot.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot
RUN wget -O plugins/Floodgate-Spigot.jar https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot

# ------------------------
# VIAVERSION + VIABACKWARDS + VIAREWIND
# (stable Jenkins build downloads)
# ------------------------
RUN wget -O plugins/ViaVersion.jar https://ci.viaversion.com/job/ViaVersion/lastSuccessfulBuild/artifact/build/libs/ViaVersion.jar

RUN wget -O plugins/ViaBackwards.jar https://ci.viaversion.com/job/ViaBackwards/lastSuccessfulBuild/artifact/build/libs/ViaBackwards.jar

RUN wget -O plugins/ViaRewind.jar https://ci.viaversion.com/job/ViaRewind/lastSuccessfulBuild/artifact/build/libs/ViaRewind.jar

# ------------------------
# START SERVER
# ------------------------
EXPOSE 25565

CMD ["java", "-Xms512M", "-Xmx512M", "-jar", "server.jar", "nogui"]