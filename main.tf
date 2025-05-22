resource "oci_integration_integration_instance" "my_oic" {
  compartment_id             = var.compartment_id
  display_name               = "Test"
  integration_instance_type  = "ENTERPRISE"
  is_byol                    = false
  message_packs              = 1
  consumption_model          = "UCM"
  is_file_server_enabled     = true
  is_visual_builder_enabled  = true
  shape                      = "PRODUCTION"

  defined_tags = {
    "Oracle-Tags.CreatedBy" = "default/sajith.m@appsysglobal.com"
    "Oracle-Tags.CreatedOn" = "2025-04-30T12:36:43.686Z"
  }

  # Optional: only if you want to recreate or manage DR/VCN/Custom endpoints
  # idcs_at = var.integration_instance_idcs_at
  # network_endpoint_details {
  #   network_endpoint_type = "PUBLIC" # or PRIVATE
  # }
}

data "oci_core_instance" "test_instance" {
  #Required
  instance_id = oci_core_instance.test_instance.id
}

data "oci_database_autonomous_database" "test_autonomous_database" {
  #Required
  autonomous_database_id = oci_database_autonomous_database.test_autonomous_database.id
}
