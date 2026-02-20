terraform {
  backend "gcs" {
    bucket = "hackton-terraform-state"
    prefix = "terraform/state"
  }
}