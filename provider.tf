#Provider que utiliza las credenciales predeterminadas de la aplicación (para obtener el secreto)
provider "google" {
  alias   = "secret_manager"
  project = var.project_id
  region  = var.region
}

#Obtenemos la clave de la Service Account del Secret Manager utilizando el provider anterior
data "google_secret_manager_secret_version" "terraform_service_account_key" {
  provider = google.secret_manager
  secret   = "terraform-service-account-key"
  project  = var.project_id
}

# Provider principal que utiliza el secreto obtenido de Secret Manager 
# para la suplantación de la SA "terraform"
provider "google" {
  credentials = data.google_secret_manager_secret_version.terraform_service_account_key.secret_data
  project     = var.project_id
  region      = var.region
}
