# IAM bindings para IAP y OS Login
# resource "google_project_iam_binding" "iap_tunnel_users" {
#   project = var.project_id
#   role    = "roles/iap.tunnelResourceAccessor"

#   members = var.iap_users
# }

# resource "google_project_iam_binding" "os_login_users" {
#   project = var.project_id
#   role    = "roles/compute.osLogin"

#   members = var.iap_users
# }

