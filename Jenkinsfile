pipeline {
    agent {
        label 'main'
    }

    environment {
	    Token_pw = credentials('dockerhub_pw')
	    Token_user = credentials('dockerhub_user')
	}


    stages{
        stage('Clone repository') {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], browser: [$class: 'GithubWeb', repoUrl: 'https://github.com/guilhermebrumatti/desafio1.git'], extensions: [], userRemoteConfigs: [[credentialsId: 'dockerhub_access', url: 'https://github.com/guilhermebrumatti/desafio1.git']]])
            }
            
        }

        stage('Build') {
            steps{
                
                bat 'docker build -t guilhermebrumatti/desafio1:latest .'
            }
        }
	stage('Login to dockerhub') {
            steps{
                bat 'docker login -u $Token_user --password-stdin $Token_pw'
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
