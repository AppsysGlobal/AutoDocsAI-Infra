stages {
  stage('Clone Repo') {
    steps {
      git credentialsId: 'github-cred', url: 'https://github.com/AppsysGlobal/AutoDocsAI-Infra.git'
    }
  }

  stage('Terraform Init') {
    steps {
      sh 'terraform init'
    }
  }

  stage('Import Bucket (safe)') {
    steps {
      sh '''
        echo "Minimally injecting placeholder bucket block to satisfy import syntax..."
        cp main.tf main.tf.bak

        # Replace actual block with placeholder
        sed -i '/resource "oci_objectstorage_bucket"/,/}/d' main.tf
        echo 'resource "oci_objectstorage_bucket" "my_bucket" {}' >> main.tf

        terraform import oci_objectstorage_bucket.my_bucket "${TF_VAR_namespace}/${TF_VAR_bucket_name}"

        echo "Restoring original full main.tf"
        mv main.tf.bak main.tf
      '''
    }
  }

  stage('Import OIC') {
    steps {
      sh 'terraform import oci_integration_integration_instance.my_oic "${TF_VAR_oic_ocid}"'
    }
  }

  stage('Terraform Plan') {
    steps {
      sh 'terraform plan > imported_plan.txt'
      archiveArtifacts artifacts: 'imported_plan.txt'
    }
  }
}
