resource "oci_integration_integration_instance" "my_oic" {}


data "oci_core_instance" "test_instance" {
  #Required
  instance_id = oci_core_instance.test_instance.id
}

data "oci_database_autonomous_database" "test_autonomous_database" {
  #Required
  autonomous_database_id = oci_database_autonomous_database.test_autonomous_database.id
}
