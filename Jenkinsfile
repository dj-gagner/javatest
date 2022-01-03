pipeline {
    agent any

    stages {
        stage('test') {
            def testImage = docker.build("test-image", "./Dockerfile") 

            testImage.inside {
                sh 'aws --version'
            }
        }
    }
}
