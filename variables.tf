variable "tenancy_ocid" {
  type = string
}

variable "user_ocid" {
  type = string
}

variable "fingerprint" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "region" {
  type = string
}

variable "bucket_namespace" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "compartment_id" {
  type = string
}

variable "oic_ocid" {
  type = string
}

variable "compute_ocid" {
  type        = string
  description = "OCID of the existing compute instance"
}

variable "atp_ocid" {
  type        = string
  description = "OCID of the existing Autonomous Transaction Processing DB"
}
