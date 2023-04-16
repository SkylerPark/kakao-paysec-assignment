FROM gradle:8.1.0-jdk17 AS builder
WORKDIR /app
COPY settings.gradle settings.gradle
COPY build.gradle build.gradle
RUN gradle build --no-daemon -x test --parallel --continue || true
COPY . .
RUN gradle build --no-daemon -x test

FROM openjdk:21-ea-17-jdk-slim
RUN groupadd -g 1000 -o java
RUN useradd java -u 1000 -g 1000 -m -s /bin/bash
WORKDIR /app
COPY --from=builder /app/build/libs/spring-petclinic-data-jdbc-3.0.0.BUILD-SNAPSHOT.jar ./app.jar
RUN chown -R 1000:1000 /app
EXPOSE 8080
