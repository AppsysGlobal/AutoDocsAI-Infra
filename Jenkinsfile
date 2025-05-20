
<<<<<<< HEAD
    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Checkout') {
            steps {
                // Assuming Jenkins is pulling from Git, or else skip this
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
=======
>>>>>>> 1500651354c63d573d7b8a27429b9213e4e87832
