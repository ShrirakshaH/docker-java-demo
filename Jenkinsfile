pipeline {
    agent any
    
    environment {
        DOCKER_CREDS = credentials('dockerhub-creds')
        REGISTRY = "rakshaa21/java-hi-app"
    }
    
    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Changed 'sh' to 'bat' for Windows
                bat "docker build -t %REGISTRY%:latest ."
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                // Windows login syntax using Batch variables
                bat "echo %DOCKER_CREDS_PSW% | docker login -u %DOCKER_CREDS_USR% --password-stdin"
                bat "docker push %REGISTRY%:latest"
            }
        }
    }
    
    post {
        always {
            // Cleanup local image
            bat "docker rmi %REGISTRY%:latest || exit 0"
        }
    }
}