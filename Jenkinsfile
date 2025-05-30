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
                script {
                    // Заходим в Docker Registry, Jenkins сам подтянет credentials по id
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        echo "🚀 Pushing Docker image ${FULL_IMAGE} to Docker Hub..."
                        // Пушим образ
                        sh "docker push ${FULL_IMAGE}"
                    }
                }
            }
        }
    }
}
