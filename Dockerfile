FROM eclipse-temurin:21-jre

WORKDIR /server

RUN apt-get update && apt-get install -y wget

# Download Paper correctly
RUN wget -O server.jar https://api.papermc.io/v2/projects/paper/versions/1.21.11/builds/127/downloads/paper-1.21.11-127.jar

# Verify file is real (important)
RUN file server.jar

EXPOSE 25565

CMD ["java", "-Xms512M", "-Xmx512M", "-jar", "server.jar", "nogui"]