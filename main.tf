provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

resource "oci_objectstorage_bucket" "my_bucket" {
  name           = "placeholder"
  namespace      = var.namespace
  compartment_id = var.compartment_id
}

resource "oci_integration_integration_instance" "my_oic" {
  id = var.oic_ocid
}
