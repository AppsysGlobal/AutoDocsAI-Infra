pipeline {
  agent any

  environment {
    TF_VAR_tenancy_ocid     = credentials('oci-tenancy-ocid')
    TF_VAR_user_ocid        = credentials('oci-user-ocid')
    TF_VAR_fingerprint      = credentials('oci-fingerprint')
    TF_VAR_private_key_path = '/var/lib/jenkins/.oci/Optimuskey_pkcs1.pem'
    TF_VAR_region           = 'us-ashburn-1'
    TF_VAR_compartment_id   = 'ocid1.tenancy.oc1..aaaaaaaasiigfpcj7o4xn6o5r725u5zofb5tfmfb57vzqqsirlnkhg6lpiva'
    TF_VAR_namespace        = 'idyhabl91i8j'
    TF_VAR_bucket_name      = 'Doc-understanding-storage'
    TF_VAR_oic_ocid         = 'ocid1.integrationinstance.oc1.iad.amaaaaaaggm52bqazc6ru5y4ocmn7dcta5kvf7lyofvccesfwtcefksuxlqa'
  }

  stages {
    stage('Clone Repo') {
      steps {
        git credentialsId: 'Github-Cred', url: 'https://github.com/AppsysGlobal/AutoDocsAI-Infra.git'
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
}
