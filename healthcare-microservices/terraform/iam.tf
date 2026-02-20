resource "google_service_account" "cloudrun_sa" {
  account_id   = "cloudrun-healthcare-sa"
  project      = "hackton-488008"
  display_name = "Cloud Run Healthcare Service Account"
}

resource "google_project_iam_member" "artifact_reader" {
  project = "hackton-488008"
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.cloudrun_sa.email}"
}
