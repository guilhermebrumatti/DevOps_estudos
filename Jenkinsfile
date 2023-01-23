pipeline {
    agent {
        any
    }
    stages { 
        stage('Stage Inicio') {
            steps{
            echo 'iniciou...'
            }
        }

        stage('Stage Meio') {
            steps {  
                echo 'ta no meio...'
            }
        }
        stage('Stage Fim') {
            steps{
                echo 'finalizou...'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
