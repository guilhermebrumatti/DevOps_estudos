pipeline {
    agent {
        label 'main'
    }
    stages{
        stage('Clone repository') {
            bat 'antes do yml'
            g@h workflow run triage.yml
            bat 'depois do yml'
        }       
    }
}
