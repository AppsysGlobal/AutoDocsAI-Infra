resource "oci_integration_integration_instance" "my_oic" {}




data "oci_core_instance" "test_instance" {
  instance_id = var.compute_instance_id
}

data "oci_database_autonomous_database" "test_autonomous_database" {
  autonomous_database_id = var.atp_database_id
}

