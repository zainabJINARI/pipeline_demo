pipeline {
    agent {
        dockerContainer {
            image 'maven:3.9.5-jdk-17' // Utilise une image Docker avec Maven et Java 17
        }
    }
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials') // Injecte les credentials Docker Hub
        DOCKER_IMAGE = "zainabjinari/demo_app_pipeline:latest" // Nom de l'image Docker
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/zainabJINARI/pipeline_demo'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test' // Exécute les tests avec Maven
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${env.DOCKER_IMAGE} ." // Construit l'image Docker
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    sh "echo ${env.DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${env.DOCKER_HUB_CREDENTIALS_USR} --password-stdin" // Se connecte à Docker Hub
                }
            }
        }

        stage('Deploy to Docker Hub') {
            steps {
                script {
                    sh "docker push ${env.DOCKER_IMAGE}" // Pousse l'image Docker sur Docker Hub
                }
            }
        }
    }
}
