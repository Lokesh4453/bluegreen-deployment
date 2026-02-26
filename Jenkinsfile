pipeline {
    agent any

    parameters {
        string(name: 'ENVIRONMENT', defaultValue: 'blue', description: 'Environment (blue/green)')
    }

    stages {

        stage('Terraform Init') {
            steps {
                withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-access' ]]) {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-access' ]]) {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-access' ]]) {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Terraform Output') {
            steps {
                sh 'terraform output'
            }
        }
    }
}
