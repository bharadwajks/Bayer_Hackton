resource "google_service_account" "cloudrun_sa" {
  account_id   = "cloudrun-healthcare-sa"
  project      = "project-0d31fa55-9a98-4b08-860"
  display_name = "Cloud Run Healthcare Service Account"
}

resource "google_project_iam_member" "artifact_reader" {
  project = "project-0d31fa55-9a98-4b08-860"
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.cloudrun_sa.email}"
}