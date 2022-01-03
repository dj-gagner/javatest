pipeline {
    agent any

    environment {
        ECR_REPO = '007156912793.dkr.ecr.us-east-1.amazonaws.com/kubernetes-lab'
        ECR_NAME = 'kubernetes-lab'
        AWS_REGION = 'us-east-1'
    }

    stages {
        stage('Push docker repo to AWS') {
          withCredentials([usernamePassword(credentialsId: 'AWS_CREDS', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) 
          {
              
          }
            steps {
                // add the 
                sh 'echo ${AWS_SECRET_ACCESS_KEY:0:2}'
                sh 'docker --version'
                sh 'docker build . -t ${ECR_NAME}:${GIT_COMMIT}'
                // copy aws credentials
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${ECR_REPO}'
                sh 'docker push ${ECR_REPO}:${GIT_COMMIT}'
            }
        }
        stage('Deploy to k8s') {
            steps {
                
            }
        }
        stage('Deploy frontend') {
            steps {
                
            }
        }
        stage('Deploy lambda') {
            steps {
                
            }
        }
    }
}