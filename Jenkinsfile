pipeline {
    agent any

    parameters {
        string(name: 'ENVIRONMENT', defaultValue: 'blue', description: 'Environment (blue/green)')
    }

    stages {

        stage('Terraform Init') {
            steps {
                withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-access' ]]) {
                    dir("${params.ENVIRONMENT}") {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-access' ]]) {
                    dir("${params.ENVIRONMENT}") {
                        sh 'terraform plan -var-file="terraform.tfvars" -out=tfplan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-access' ]]) {
                    dir("${params.ENVIRONMENT}") {
                        sh 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }

        stage('Terraform Output') {
            steps {
                dir("${params.ENVIRONMENT}") {
                    sh 'terraform output'
                }
            }
        }
    }
}
