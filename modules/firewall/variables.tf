variable "project_id" {
  description = "ID del proyecto"
  type        = string
}

variable "region" {
    description = "Region de GCP para desplegar recurso"
}
variable "zone" {
  type        = string
  description = "zona para los recursos"
}
variable network {
    description = "Se crea lista de objetos para las diferenteste redes dentro del proyecto"
    type        = list(string)
}

locals {
  firewall_config = {
    name             = "iap-access"
    allowed_protocol = "tcp"
    source_range     = "35.235.240.0/20"
    target_tags      = ["iap"]
  }
}