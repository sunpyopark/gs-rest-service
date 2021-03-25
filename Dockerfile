FROM openjdk:8-jdk-alpine
RUN apk add --no-cache curl tar bash
VOLUME /tmp
ADD /var/lib/docker/tmp/docker-builder810534036/build/libs/gs-rest-service-0.1.0.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT ["java","-jar","/app.jar"]
