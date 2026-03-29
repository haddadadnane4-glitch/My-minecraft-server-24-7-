FROM eclipse-temurin:21-jre

WORKDIR /server

# Download Paper automatically
RUN curl -o paper.jar -L https://api.papermc.io/v2/projects/paper/versions/1.21.11/builds/127/downloads/paper-1.21.11-127.jar

EXPOSE 25565

CMD ["sh", "-c", "java -Xms512M -Xmx512M -jar paper.jar nogui"]