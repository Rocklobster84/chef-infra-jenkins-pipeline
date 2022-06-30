pipeline {
    agent any 
    stages {
        stage('Delete the workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Second') {
            steps {
                echo "Second Stage"
            }
        }
        stage('Third Stage') {
            steps {
                echo "Third Stage"
            }
        }
    }
}