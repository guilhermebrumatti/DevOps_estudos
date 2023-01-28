pipeline {
    agent {
        label 'main'
    }
    stages{
        stage('Clone repository') {
            gh workflow run triage.yml
        }       
    }
}
