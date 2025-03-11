FROM openjdk:17-jdk-alpine

WORKDIR /app


COPY target/demo_app_pipeline-0.0.1-SNAPSHOT.jar app.jar


EXPOSE 8081


ENTRYPOINT ["java", "-jar", "app.jar"]
