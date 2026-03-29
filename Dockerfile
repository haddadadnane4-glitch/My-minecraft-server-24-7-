FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y curl nodejs npm

RUN npm install

# Download Playit agent
RUN curl -L https://github.com/playit-cloud/playit-agent/releases/latest/download/playit-linux-amd64 -o playit
RUN chmod +x playit

RUN chmod +x start.sh
RUN chmod +x playit.sh

EXPOSE 25565
EXPOSE 3000

CMD ["bash", "start.sh"]