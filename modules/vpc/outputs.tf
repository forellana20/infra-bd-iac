output "google_compute_network_id" {
  value = google_compute_network.postgres-network.id
}
output "private_service_connection" {
  value = google_service_networking_connection.private_vpc_connection
}
