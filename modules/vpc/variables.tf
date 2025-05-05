variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}
variable "project_id" {
  description = "Id del proyecto para la ejecucion"
  type        = string
}
variable "region" {
  description = "Region donde se desplegaran los recursos"
}
variable "subnet_cidr" {
  description = "CIDR del la subnet"
  type        = string
}

variable "environment" {
  description = "variable para identificacion de ambientes"
  type        = string
}

# variable "allocated_ip_range" {
#     description = "Rango de IP reservado para instancia de base de datos"
#     type        = string
# }