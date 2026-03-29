FROM eclipse-temurin:21-jre

WORKDIR /data

# Download Paper server
RUN curl -o paper.jar -L https://api.papermc.io/v2/projects/paper/versions/1.21.11/builds/127/downloads/paper-1.21.11-127.jar

# Create plugins folder
RUN mkdir -p plugins

EXPOSE 25565

# Start server
CMD ["java", "-Xms512M", "-Xmx512M", "-jar", "paper.jar", "nogui"]