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
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], browser: [$class: 'GithubWeb', repoUrl: 'https://github.com/guilhermebrumatti/desafio1.git'], extensions: [], userRemoteConfigs: [[credentialsId: 'dockerhub_access', url: 'https://github.com/guilhermebrumatti/desafio1.git']]])
            }            
        }
        stage('Build') {
            steps{                
                bat 'docker build -t desafio1_image:latest .'
            }
        }
    	stage('Push image') {
            steps{
               withDockerRegistry([ credentialsId: "DOCKERHUB_ACCESS", url: "" ]) {
	       bat 'docker push ghcr.io/guilhermebrumatti/desafio1/desafio1_image:latest'
	       }
            }
        post {
            always {
               bat 'docker logout' 
            }
        }         
            
        }
    }
}
