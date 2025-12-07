FROM maven:3.9.9-eclipse-temurin-17 AS builder

WORKDIR /build
COPY pom.xml .
RUN mvn -B dependency:go-offline

COPY src ./src
RUN mvn -B -DskipTests package


FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

COPY --from=builder /build/target/cicd-github-actions.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
