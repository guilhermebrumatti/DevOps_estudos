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
        stage('Docker Scan') {
	    steps{
		bat 'docker scan guilhermebrumatti/desafio1:latest --file Dockerfile'
	    }
	}
	stage('Login to dockerhub') {
            steps{
                bat 'docker login -u guilhermebrumatti -p <password>'
            }    
        }
    	stage('Push image') {
            steps{
                bat 'git push https://github.com/guilhermebrumatti/desafio1 HEAD:main'
            }
        post {
            always {
               bat 'docker logout' 
            }
        }         
            
        }
    }
}
