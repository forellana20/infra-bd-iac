variable "instance_name" {
  description = "Nombre de la instancia de base de datos"
  type        = string
}
variable "project_id" {
  description = "ID del proyecto"
  type        = string
}
variable "region" {
  description = "Region para los recursos"
  type        = string
}
variable "tier" {
  description = "Tipo de maquina que se usara para alojar la instancia"
  type        = string
}
variable "private_network" {
  description = "Configuracion de red privada para la instancia de base de datos"
  type        = string
}
variable "allowed_psc_projects" {
  description = "Lista de objetos para los proyectos permitidos para el PSC"
  type        = list(string)
}
