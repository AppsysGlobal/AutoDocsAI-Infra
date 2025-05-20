provider "oci" {
<<<<<<< HEAD
  config_file_profile = "DEFAULT"
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaasiigfpcj7o4xn6o5r725u5zofb5tfmfb57vzqqsirlnkhg6lpiva"
}

output "availability_domains" {
  value = data.oci_identity_availability_domains.ads.availability_domains[*].name
}
=======
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

resource "oci_core_instance" "vm1" {}
resource "oci_core_instance" "vm2" {}

resource "oci_core_virtual_network" "vcn1" {}

resource "oci_core_subnet" "subnet1" {}
>>>>>>> 1500651354c63d573d7b8a27429b9213e4e87832
