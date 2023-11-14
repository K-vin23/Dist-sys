FROM openjdk:11
VOLUME /tmp
EXPOSE 8090
ARG JAR_FILE=./jdk-docker-2/target/spring-boot-docker.jar
ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
