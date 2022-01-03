pipeline {
  agent {
    kubernetes {
      yaml '''
metadata:
  labels:
    class: KubernetesDeclarativeAgentTest
spec:
  containers:
  - name: jnlp
    env:
    - name: CONTAINER_ENV_VAR
      value: jnlp
  - name: test
    image: djgagner/git-pipeline-best-practices
    command:
    - ls
    env:
    - name: CONTAINER_ENV_VAR
      value: maven
'''
    }
  }
  stages {
    stage('Run test aws cli') {
      steps {
        sh 'set'
        sh "echo OUTSIDE_CONTAINER_ENV_VAR = ${CONTAINER_ENV_VAR}"
        container('test') {
          sh 'aws --version'
        }
      }
    }
  }
}