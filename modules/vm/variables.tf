variable "project_id" {
  description = "ID del proyecto"
  type        = string
}

variable "zone" {
  type        = string
  description = "zona para los recursos"
}

variable "region" {
  description = "Region para los recursos"
  type        = string
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

