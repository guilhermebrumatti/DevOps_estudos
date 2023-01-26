pipeline {
    agent {
        label 'main'
    }
	
    environment {
	  DOCKERHUB_ACCESS = credentials('DOCKERHUB_ACCESS')
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
		echo $senha_DH
            }
        }
	stage('Login to dockerhub') {
            steps{
		    bat 'docker login -u -p '$senha_DH''
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
