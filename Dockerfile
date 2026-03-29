FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y nodejs npm

RUN npm install

RUN chmod +x start.sh

EXPOSE 25565
EXPOSE 3000

CMD ["bash", "start.sh"]