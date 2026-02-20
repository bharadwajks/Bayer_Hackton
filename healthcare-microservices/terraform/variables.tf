variable "project_id" {
  description = "GCP Project ID"
  type        = string
}
variable "region" {
  default = "us-central1"
}

variable "patient_image" {}
variable "appointment_image" {}