pipeline {
    agent {
        label 'main'
    }
    stages{
        stage('Start') {
            steps{
                bat 'gh workflow run publish.yml'
            }
            steps{                
                echo "Rodando!"
            }
        }
    }
} 
