pipeline {
    agent any

    environment {
        IMAGE_NAME = 'dmitridorje/new-app-image-001'
        IMAGE_TAG = "latest"
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

        stage('Docker Login') {
                    steps {
                        script {
                            docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                                echo 'Logged in to Docker Hub'
                            }
                        }
                    }
                }

        stage('Docker Push') {
                    steps {
                        echo '🚀 Pushing Docker image to Docker Hub...'
                        sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
                    }
                }
    }
}
