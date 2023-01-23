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
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], browser: [$class: 'BitbucketWeb', repoUrl: 'https://lrocha85@bitbucket.org/lrocha85/brasileirao.git'], extensions: [], userRemoteConfigs: [[credentialsId: 'user_jenkins', url: 'https://lrocha85@bitbucket.org/lrocha85/brasileirao.git']]])
            }
            
        }

        stage('Build') {
            steps{
                
                bat 'docker build - < Dockerfile'
            }
        }
        stage('Login to dockerhub') {
            steps{
                bat 'docker login -u <user> -p <password>'
            }    
        }
        stage('Push image') {
            steps{
                bat 'docker push lrocha85/brasileirao_image:latest'
            }  
        post {
            always {
               bat 'docker logout' 
            }
        }         
            
        }
    }
}
