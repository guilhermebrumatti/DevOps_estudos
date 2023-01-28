pipeline {
    agent {
        label 'main'
    }	
    stages{
        stage('Start') {
            steps{
                sh 'gh workflow run publish.yml'
            }
        }
    }
}
