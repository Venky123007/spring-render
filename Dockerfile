FROM maven:3-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.2-jdk-slim
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 2001
ENTRYPOINT ["java","-jar","demo.jar"]