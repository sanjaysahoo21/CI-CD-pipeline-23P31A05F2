CI CD Pipeline Project using GitHub Actions

> Project description

In this project, I created a complete CI CD pipeline using GitHub Actions for a Spring Boot application.
The pipeline automates testing, building, Docker image creation, security scanning, and deployment.

This project helped me understand how real DevOps pipelines work in industry level projects.

> Application details

The application is a simple Spring Boot application built using Java 17 and Maven.
It is packaged as a JAR file and containerized using Docker.

> Pipeline overview

The pipeline works in the following way.

When a pull request is created to the main or master branch, the CI pipeline runs.
When the pull request is merged, the CD pipeline runs.

> Continuous Integration process

The CI pipeline is triggered on pull request.

It performs the following steps.

First, the source code is checked out from GitHub.
Second, Java 17 is set up using GitHub Actions.
Third, Maven tests are executed.
If any test fails, the pipeline fails and the code cannot be merged.

This ensures code quality before merging into the main branch.

> Docker image build

After the code is merged to the main branch, the pipeline builds a Docker image.

The project uses a multi stage Dockerfile.

In the first stage, Maven is used to build the application JAR file.
In the second stage, the JAR file is copied into a lightweight Java runtime image.

This creates a smaller and production ready Docker image.

> Container registry

The Docker image is pushed to GitHub Container Registry.

Each image is tagged using the Git commit SHA.
This helps in tracking which code version is deployed.

The registry used is GitHub Container Registry and not Docker Hub.

> Security scanning

After the Docker image is pushed, it is scanned using Trivy.

If any HIGH or CRITICAL vulnerabilities are found, the pipeline fails.
This prevents insecure images from getting deployed.

> Deployment process

Staging deployment runs automatically after a successful security scan.
This deployment is simulated using a simple command.

Production deployment requires manual approval.
GitHub Environments are used to add this approval step.
Only after approval, the production deployment job runs.

> Secrets management

No secrets are hard coded in the project.
All sensitive values are handled using GitHub Secrets.

The GitHub provided GITHUB_TOKEN is used for authentication with GitHub Container Registry.

> How to run the application locally without Docker

Go to the project directory and run the following command.

mvn spring-boot:run

The application runs on port 8080.

> How to run the application using Docker

First, build the project.

mvn clean package

Then build the Docker image.

docker build -t cicd-github-actions .

Run the container.

docker run -p 9090:8080 cicd-github-actions

The application will be available on port 9090.

> How to run the application from GHCR image

Login to GitHub Container Registry.

docker login ghcr.io

Pull the image using commit SHA.

docker pull ghcr.io/your-username/cicd-github-actions:commit-sha

Run the container.

docker run -p 9090:8080 ghcr.io/your-username/cicd-github-actions:commit-sha

>> Final result

This project implements a complete CI CD flow using GitHub Actions.
It ensures code quality, security, and controlled deployment.
The pipeline follows real world DevOps best practices.
