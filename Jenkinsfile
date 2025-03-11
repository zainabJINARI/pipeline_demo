pipeline {
    agent any
    tools {
        maven 'Maven 3.9.9' 
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/zainabJINARI/pipeline_demo'
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
