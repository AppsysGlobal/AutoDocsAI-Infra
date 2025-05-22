provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

resource "oci_objectstorage_bucket" "my_bucket" {
  # placeholder for import
}

resource "oci_integration_integration_instance" "my_oic" {
  # placeholder for import
}

resource "oci_core_instance" "my_instance" {
  # placeholder for import
}

resource "oci_database_autonomous_database" "my_atp" {
  # placeholder for import
}
