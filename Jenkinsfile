pipeline {
    agent any

    environment {
        ECR_REPO = '007156912793.dkr.ecr.us-east-1.amazonaws.com/kubernetes-lab'
        AWS_REGION = 'us-east-1'
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }

    stages {
        stage('Push docker repo to AWS') {
            steps {
                // add the 
                sh 'aws --version'
                sh 'docker --version'
                sh 'docker build . -t ${ECR_REPO}:${GIT_COMMIT}'
                // copy aws credentials
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${ECR_REPO}'
                sh 'docker push ${ECR_REPO}:${GIT_COMMIT}'
            }
        }
        stage('Deploy to k8s') {
            steps {
                // add the 
                sh 'eksctl utils write-kubeconfig --cluster=vmd-lab'
                sh 'kubectl apply -f pod.yaml'
            }
        }
        // stage('Deploy frontend') {
        //     steps {
                
        //     }
        // }
        // stage('Deploy lambda') {
        //     steps {
                
        //     }
        // }
    }
}