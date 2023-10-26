# Build stage
FROM openjdk:17.0.1-jdk-slim AS build
WORKDIR /app
COPY . /app
RUN ./build-script.sh  # This is where you build your JAR

# Final stage
FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=build /app/target/contact_management-0.0.1-SNAPSHOT.jar contact_management.jar
EXPOSE 8282
ENTRYPOINT ["java", "-jar", "contact_management.jar"]
