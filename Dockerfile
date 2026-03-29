FROM eclipse-temurin:21-jre

WORKDIR /server

RUN apt-get update && apt-get install -y wget jq

# Download Paper
RUN BUILD=$(wget -qO- "https://api.papermc.io/v2/projects/paper/versions/1.21.11" | jq -r '.builds[-1]') && \
    wget -O server.jar "https://api.papermc.io/v2/projects/paper/versions/1.21.11/builds/${BUILD}/downloads/paper-1.21.11-${BUILD}.jar"

# EULA
RUN echo "eula=true" > eula.txt

# 👇 THIS is the missing magic
COPY plugins /server/plugins

EXPOSE 25565

CMD ["java", "-Xms512M", "-Xmx512M", "-jar", "server.jar", "nogui"]