pipeline {
    agent any

    tools {
        // Specify the name of the Maven installation
        maven 'M3'
    }

    environment {
        // Define any environment variables you might need
        MAVEN_OPTS = '-Dmaven.test.failure.ignore=true'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your version control system
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Compile the code and package it using Maven
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                // Run the tests
                sh 'mvn test'
            }
        }
   }

    post {
        always {
            // Perform actions that should always happen, such as archiving artifacts and sending notifications
            archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
            junit '**/target/surefire-reports/*.xml'
        }
        success {
            // Actions to perform on successful build
            echo 'Build succeeded!'
        }
        failure {
            // Actions to perform on failed build
            echo 'Build failed!'
        }
    }
}
