resource "google_compute_instance" "vm" {
  for_each     = var.vm
  project      = var.project_id
  zone         = var.zone
  name         = each.value.name
  machine_type = each.value.machine_type

  boot_disk {
    initialize_params {
      image = each.value.boot_disk.initialize_params.image
      size  = each.value.boot_disk.initialize_params.size
    }
  }

  metadata = {
    enable-oslogin = each.value.metadata.enable-oslogin
  }

  network_interface {
    subnetwork = "projects/${var.project_id}/regions/${var.region}/subnetworks/${each.value.network_interface.subnetwork}"
    network_ip = each.value.network_interface.network_ip

    access_config {
     network_tier = each.value.network_interface.access_config.network_tier
    }
  }
}



