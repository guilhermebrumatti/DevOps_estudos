pipeline {
    agent {
        label 'main'
    }
    stage('Start') {
        steps{
            bat 'gh workflow run publish.yml'
        }
        steps{                
            echo "Rodando!"
        }
    }
} 
