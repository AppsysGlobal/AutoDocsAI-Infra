// Jenkinsfile
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
    TF_VAR_compute_ocid     = 'ocid1.instance.oc1.iad.anuwcljtggm52bqcicnvzligentjkfjr7yfglykfg3c5uu2enyhw3uhplxfa'
    TF_VAR_atp_ocid         = 'ocid1.autonomousdatabase.oc1.iad.anuwcljrggm52bqaeg3ituate5kw5gejvxgppt7qcwfiv3w6yzdscadn76dq'
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

    stage('Import Bucket') {
      steps {
        sh '''
          cp main.tf main.tf.bak
          sed -i '/resource "oci_objectstorage_bucket"/,/}/d' main.tf
          echo 'resource "oci_objectstorage_bucket" "my_bucket" {}' >> main.tf
          terraform import oci_objectstorage_bucket.my_bucket "${TF_VAR_namespace}/${TF_VAR_bucket_name}"
          mv main.tf.bak main.tf
        '''
      }
    }

    stage('Import OIC') {
      steps {
        sh '''
          cp main.tf main.tf.bak
          sed -i '/resource "oci_integration_integration_instance"/,/}/d' main.tf
          echo 'resource "oci_integration_integration_instance" "my_oic" {}' >> main.tf
          terraform import oci_integration_integration_instance.my_oic "${TF_VAR_oic_ocid}"
          mv main.tf.bak main.tf
        '''
      }
    }

    stage('Import Compute') {
      steps {
        sh '''
          cp main.tf main.tf.bak
          sed -i '/resource "oci_core_instance"/,/}/d' main.tf
          echo 'resource "oci_core_instance" "my_instance" {}' >> main.tf
          terraform import oci_core_instance.my_instance "${TF_VAR_compute_ocid}"
          mv main.tf.bak main.tf
        '''
      }
    }

    stage('Import ATP') {
      steps {
        sh '''
          cp main.tf main.tf.bak
          sed -i '/resource "oci_database_autonomous_database"/,/}/d' main.tf
          echo 'resource "oci_database_autonomous_database" "my_atp" {}' >> main.tf
          terraform import oci_database_autonomous_database.my_atp "${TF_VAR_atp_ocid}"
          mv main.tf.bak main.tf
        '''
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan > imported_plan.txt'
        archiveArtifacts artifacts: 'imported_plan.txt'
      }
    }

    stage('Show State') {
      steps {
        sh 'terraform show > full_state.txt'
        archiveArtifacts artifacts: 'full_state.txt'
      }
    }
  }
}
