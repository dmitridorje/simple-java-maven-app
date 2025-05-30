pipeline {
    agent any

    environment {
        IMAGE_NAME = 'new-app-image-001'
    }

    stages {
        stage('Build') {
            steps {
                echo '🧱 Building Java application...'
                sh './mvnw clean package'
            }
        }

        stage('Docker Build') {
            steps {
                echo '🐳 Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
    }
}
