resource "google_cloud_run_service" "patient" {
  name     = "patient-service"
  location = var.region

  template {
    spec {
      service_account_name = google_service_account.cloudrun_sa.email
      containers {
        image = var.patient_image
        ports { container_port = 8080 }
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service" "appointment" {
  name     = "appointment-service"
  location = var.region

  template {
    spec {
      service_account_name = google_service_account.cloudrun_sa.email
      containers {
        image = var.appointment_image
        ports { container_port = 8080 }
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "public" {
  service  = google_cloud_run_service.patient.name
  location = var.region
  role     = "roles/run.invoker"
  member   = "allUsers"
}


