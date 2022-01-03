pipeline {
    agent any

    stages {
        stage('test') {
            agent { 
                dockerfile {
                    filename 'jenkinsBuildEnvironment/Dockerfile'
                }
            }
            steps {
                sh 'aws --version'
            }
        }
    }
}
