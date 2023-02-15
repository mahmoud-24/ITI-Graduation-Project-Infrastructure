resource "google_project_iam_custom_role" "iam-role" {
  role_id     = "iam_role"
  title       = "iam_role"
  permissions = var.iam-role
}

resource "google_service_account" "service-account" {
  account_id = "service-account"
  project    = var.project_id
}

resource "google_project_iam_binding" "iam-bendig-1" {
  project = var.project_id
  role    = "roles/container.admin"
  members = [
    "serviceAccount:${google_service_account.service-account.email}"
  ]
}

resource "google_project_iam_binding" "iam-bending-2" {
  project = var.project_id
  role    = "projects/${google_service_account.service-account.project}/roles/${google_project_iam_custom_role.iam-role.role_id}"
  members = [
    "serviceAccount:${google_service_account.service-account.email}"
  ]
}