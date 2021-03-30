FROM openjdk:8-jdk-alpine
RUN apk add --no-cache curl tar bash
ADD complete/target/rest-service-0.0.1-SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT ["java","-jar","/app.jar"]
