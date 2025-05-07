variable "project_id" {
  description = "ID del proyecto en GCP"
  type        = string
}

variable "region" {
  description = "Región predeterminada para los recursos"
  type        = string
}

variable "zone" {
  type        = string
  description = "zona para los recursos"
}

variable "bucket_name" {
  description = "Nombre del bucket para almacenar el estado de Terraform"
  type        = string
}

variable "service_account_secret" {
  description = "Nombre del secreto en Secret Manager que contiene la service account"
  type        = string
}

variable "environment" {
  description = "variable de ambientes"
  type        = string
}


variable "vpc_name" {
  type        = string
  description = "Nombre de la VPC"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR para la subred de la VPC"
}

variable "sql_instance_name" {
  type        = string
  description = "Nombre de la instancia de Cloud SQL"
}

variable "sql_tier" {
  type        = string
  description = "Tier de la instancia de Cloud SQL"
}

variable "allowed_psc_projects" {
  type        = list(string)
  description = "Lista de proyectos permitidos para PSC"
}

# variable "allocated_ip_range" {
# description = "Rango de IP reservada para instancias de base de datos"
# type        = string
# }

variable "iap_users" {
  description = "Lista de usuarios con acceso a IAP y OS Login"
  type        = list(string)
}

variable "instance_name" {
  description = "lista de vms en caso sean mas de una"
  type        = list(string)
}

variable "vm" {
  description = "Mapa de objetos que definen las VMs a crear."
  type = map(object({
    name         = string
    machine_type = string
    boot_disk = object({
      initialize_params = object({
        image = string
        size  = number
      })
    })
    metadata = object({
      enable-oslogin = bool
    })
    network_interface = object({
      subnetwork = string
      network_ip = string # IP privada estática opcional
      access_config = object({
        network_tier = string #"PREMIUM" o "STANDARD". Dejar null si no se necesita IP pública.
      })
    })
  }))
}     
