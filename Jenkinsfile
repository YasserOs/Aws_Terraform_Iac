pipeline {
    agent {label 'aws'}

    stages {
        stage('Git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/YasserOs/Aws_Terraform_Iac' 
            }
        }
        stage('terraform place') {
            steps {
                sh 'PATH=/usr/local/bin/terraform'
            }
        }
        stage('terraform') {
            steps {
                withAWS(credentials: 'Infra-creds', region: 'us-east-1'){
                dir("${env.WORKSPACE}/terraform"){

                    sh 'terraform init --reconfigure'
                    sh 'terraform apply --auto-approve -var-file dev.tfvars'
                }
                }
            }
        }
    }
}
