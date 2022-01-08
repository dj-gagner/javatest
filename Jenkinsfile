pipeline {
    agent any

    environment {
        ECR_REPO = '007156912793.dkr.ecr.us-east-1.amazonaws.com/kubernetes-lab'
        AWS_REGION = 'us-east-1'
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
        POSTGRES_HOST = credentials('postgres-host')
        POSTGRES_DATABASE = credentials('postgres-database')
        POSTGRES_USERNAME = credentials('postgres-username')
        PGPASSWORD = credentials('postgres-password')
        POSTGRES_PORT = credentials('postgres-port')
    }

    stages {
        stage ('Run postgres script') {
            steps {
              // replace this with something better
              sh 'psql -f sql/10-odos_init.sql -h ${POSTGRES_HOST} -U ${POSTGRES_USERNAME} -d ${POSTGRES_DATABASE}'
              sh 'psql -f sql/20-odos_seed.sql -h ${POSTGRES_HOST} -U ${POSTGRES_USERNAME} -d ${POSTGRES_DATABASE}'
            }
        }
        stage('Push docker repo to AWS') {
            steps {
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
                sh 'eksctl utils write-kubeconfig --cluster=kubernetes-lab'
                sh 'envsubst < pod.yaml > templated-pod.yaml'
                sh 'kubectl apply -f templated-pod.yaml'
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