pipeline {
    agent {
        docker {
            image 'maven:3.8.7-eclipse-temurin-17'
            args '-v /root/.m2:/root/.m2' // кеш Maven
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
    }
}
