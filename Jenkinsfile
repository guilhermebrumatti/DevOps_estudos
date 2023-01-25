pipeline {
    agent {
        label 'main'
    }

    environment {
	    DOCKERHUB_CREDENTIALS = '<password>'
	}


    stages{
        stage('Clone repository') {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], browser: [$class: 'GithubWeb', repoUrl: 'https://github.com/guilhermebrumatti/desafio1.git'], extensions: [], userRemoteConfigs: [[credentialsId: 'NONE', url: 'https://github.com/guilhermebrumatti/desafio1.git']]])
            }
            
        }

        stage('Build') {
            steps{
                
                bat 'docker build -t guilhermebrumatti/desafio1:latest .'
            }
        }
        stage('Login to dockerhub') {
            steps{
                bat 'docker login -u <login> -p <password>'
            }    
        }
        stage('Push image') {
            steps{
                bat 'docker push https://github.com/guilhermebrumatti/desafio1.git:latest'
            }  
        post {
            always {
               bat 'docker logout' 
            }
        }         
            
        }
    }
}
