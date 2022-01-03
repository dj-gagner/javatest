podTemplate(containers: [
    containerTemplate(name: 'test', image: 'djgagner/git-pipeline-best-practices', command: 'sleep', args: '99d'),
  ]) {

    node(POD_LABEL) {
        stage('test') {
            sh 'echo $org.csanchez.jenkins.plugins.kubernetes.pipeline.ContainerExecDecorator.websocketConnectionTimeout'
            git 'https://github.com/jenkinsci/kubernetes-plugin.git'
            container('test') {
                stage('test') {
                    sh 'echo "hi'
                }
            }
        }

    }
}