podTemplate(containers: [
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