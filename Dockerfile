FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/contact_management-0.0.1-SNAPSHOT.jar contact_management.jar
EXPOSE 8282
ENTRYPOINT ["java","-jar","contact_management.jar"]



