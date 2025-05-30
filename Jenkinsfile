pipeline {
    agent any

    environment {
        IMAGE_NAME = 'dmitridorje/new-app-image-001'
        IMAGE_TAG = 'latest'
        FULL_IMAGE = "${IMAGE_NAME}:${IMAGE_TAG}"
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
                // Собираем образ с тегом
                sh "docker build -t ${FULL_IMAGE} ."
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials',
                usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh '''
                          echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                          docker push ${FULL_IMAGE}
                    '''
                }
            }
        }
    }
}
