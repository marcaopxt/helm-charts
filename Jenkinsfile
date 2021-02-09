pipeline {
//    environment {
//        registryCredential = "docker"
//        TF_IN_AUTOMATION      = '1'
//        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
//        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
//    }    
    agent {
      label "jenkins-helm"
    }
//    options { 
//        timestamps()
//        ansiColor("xterm")
//    }
//    tools {
//        terraform 'terraform-default'
//    }
//    parameters {
//        string(name: 'environment', defaultValue: 'default', description: 'Workspace/environment file to use for deployment')
//        string(name: 'version', defaultValue: '0.14.5', description: 'Version variable to pass to Terraform')
//        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
//    }
    stages {
        stage('Plan') {
            container('jenkins-helm') {
                steps {
//                    currentBuild.displayName = params.version
                    sh 'helm repo update'
                }
            }
        }
        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }

            steps {
                script {
//                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                        parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }

        stage('Deploy') {
            container('jenkins-terraform') {
                steps {
                    sh "helm version"

                }
            }
        }
    }
}
