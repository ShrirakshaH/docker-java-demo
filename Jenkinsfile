pipeline {
    agent any
    
    environment {
        // This ID must match the ID you create in Jenkins Credentials in Step 2
        DOCKER_CREDS = credentials('dockerhub-creds')
        REGISTRY = "your-dockerhub-username/java-hi-app"
    }
    
    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${REGISTRY}:latest ."
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                // This command logs in and pushes the image automatically
                sh "echo ${DOCKER_CREDS_PSW} | docker login -u ${DOCKER_CREDS_USR} --password-stdin"
                sh "docker push ${REGISTRY}:latest"
            }
        }
    }
    
    post {
        always {
            // Clean up the local image to save space on the Jenkins server
            sh "docker rmi ${REGISTRY}:latest || true"
        }
    }
}