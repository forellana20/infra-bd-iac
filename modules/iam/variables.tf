variable "project_id" {
    description = "ID del proyecto"
    type = string
}

variable "zone" {
    type    = string
    description = "zona para los recursos"
}

variable "iap_users" {
  description = "Lista de usuarios con acceso a IAP y OS Login"
  type        = list(string)
}

variable "instance_name" {
    description = "lista de vms en caso sean mas de una"
    type      = list(string)
}