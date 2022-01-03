podTemplate(containers: [
    containerTemplate(name: 'test', image: 'djgagner/git-pipeline-best-practices', command: 'sleep', args: '99d'),
  ]) {

    node(POD_LABEL) {
        stage('test') {
            git 'https://github.com/jenkinsci/kubernetes-plugin.git'
            container('jnlp') {
                stage('test') {
                    sh 'echo "hi'
                }
            }
        }

    }
}