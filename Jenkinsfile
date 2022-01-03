pipeline {
    agent { 
        dockerfile {
            filename './jenkinsBuildEnvironment/Dockerfile'
        }
    }

    stages {
        stage('test') {
            steps {
                sh 'aws --version'
            }
        }
    }
}
