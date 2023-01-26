pipeline{

	agent main

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub_access')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t guilhermebrumatti/desafio1:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push guilhermebrumatti/desafio1:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
