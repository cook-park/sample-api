FROM openjdk:17-jdk-slim

WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

COPY src src

RUN ./mvnw clean package -DskipTests
COPY target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]

# 컨테이너가 특정 포트를 리스닝하는 것을 "명시"함, 실제 포트 지정은 docker compose 또는 docker run에서 지정
EXPOSE 8088