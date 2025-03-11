pipeline {
    agent any
    tools {
        maven 'Maven 3.9.9' 
    }
     environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials') 
        DOCKER_IMAGE = "zainabjinari/demo_app_pipeline:latest"
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

        stage('Build Docker Image') {
            steps {
                script {
                   
                    sh "docker build -t ${env.DOCKER_IMAGE} ."
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                script {
                  
                    sh "echo ${env.DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${env.DOCKER_HUB_CREDENTIALS_USR} --password-stdin"
                }
            }
        }
        stage('Deply in  Docker Hub') {
            steps {
                script {
                   
                    sh "docker push ${env.DOCKER_IMAGE}"
                }
            }
        }

       
    }
}
