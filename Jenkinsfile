pipeline {
    agent {
        label 'main'
    }
	
    environment {
	  DOCKERHUB_LOGIN = credentials('DOCKERHUB_ACCESS')
    }
	
    stages{
        stage('Clone repository') {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], browser: [$class: 'GithubWeb', repoUrl: 'https://github.com/guilhermebrumatti/desafio1.git'], extensions: [], userRemoteConfigs: [[credentialsId: 'dockerhub_access', url: 'https://github.com/guilhermebrumatti/desafio1.git']]])
            }
            
        }

        stage('Build') {
            steps{
                
                bat 'docker build -t guilhermebrumatti/desafio1/imagem:latest .'
            }
        }
	stage('Login to dockerhub') {
            steps{
		    bat 'docker login -u ${DOCKERHUB_LOGIN_USR} --password-stdin ${DOCKERHUB_LOGIN_PSW}'
            }    
        }
    	stage('Push image') {
            steps{
               echo 'push image'
            }
        post {
            always {
               bat 'docker logout' 
            }
        }         
            
        }
    }
}
