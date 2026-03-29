FROM eclipse-temurin:21-jre

WORKDIR /server

# Install tools
RUN apt-get update && apt-get install -y wget jq

# Download latest Paper build correctly
RUN BUILD=$(wget -qO- "https://api.papermc.io/v2/projects/paper/versions/1.21.11" | jq -r '.builds[-1]') && \
    wget -O server.jar "https://api.papermc.io/v2/projects/paper/versions/1.21.11/builds/${BUILD}/downloads/paper-1.21.11-${BUILD}.jar"

# Accept EULA automatically
RUN echo "eula=true" > eula.txt

# Create plugins folder (optional but clean)
RUN mkdir -p plugins

# Open Minecraft port
EXPOSE 25565

# Start server
CMD ["java", "-Xms512M", "-Xmx512M", "-jar", "server.jar", "nogui"]