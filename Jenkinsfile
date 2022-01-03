pipeline {
  agent {
    kubernetes {
      yaml '''
metadata:
  labels:
    class: KubernetesDeclarativeAgentTest
spec:
  containers:
  - name: maven
    image: maven:3.3.9-jdk-8-alpine
    command:
    - cat
    tty: true
    env:
    - name: CONTAINER_ENV_VAR
      value: maven
'''
    }
  }
  stages {
    stage('Run maven') {
      steps {
        sh 'set'
        sh "echo 'hi'"
        container('maven') {
          sh 'echo "hey"'
          sh 'mvn -version'
        }
      }
    }
  }
}