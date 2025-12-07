FROM openjdk:17
EXPOSE 8080
ADD target/cicd-github-actions.jar cicd-github-actions.jar
ENTRYPOINT ["java","jar","/cicd-github-actions.jar"]