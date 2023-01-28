pipeline {
    agent {
        label 'main'
    }
    stages{
        stage('Start') {
            steps{
                gh workflow run publish.yml
            }
            steps{                
                echo "Rodando!"
            }
        }
    }
} 
