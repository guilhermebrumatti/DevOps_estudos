pipeline {
    agent {
        label 'main'
    }
    
    environment {
        DOCKERHUB_CREDENTIALS = '<password>'
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                docker pull python
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
