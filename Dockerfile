FROM gradle:8.1.0-jdk17 AS builder
WORKDIR /build
COPY settings.gradle settings.gradle
COPY build.gradle build.gradle
RUN gradle build —no-daemon -x test —parallel —continue || true
COPY . .
RUN gradle bootjar —no-daemon

# FROM openjdk:21-ea-17-jdk-slim
# COPY --from=builder /app/build/