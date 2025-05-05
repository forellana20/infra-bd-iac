resource "google_sql_database_instance" "postgres-sql-instance" {
  name             = var.instance_name
  project          = var.project_id
  region           = var.region
  database_version = "POSTGRES_16"

  settings {
    tier              = var.tier
    availability_type = "ZONAL"
    edition           = "ENTERPRISE_PLUS"

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.private_network

      psc_config {
        psc_enabled               = true
        allowed_consumer_projects = var.allowed_psc_projects
      }
    }

    backup_configuration {
      enabled = true
    }
  }

  deletion_protection = false
}

