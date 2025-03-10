pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/zainabJINARI/pipeline_demo'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy') {
            steps {
                echo 'deplyement phase '
            }
        }
    }
}
