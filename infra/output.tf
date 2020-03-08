output "webserver_ip" {
  value = data.google_compute_instance.webserver.network_interface.0.access_config.0.nat_ip
}

output "ssh" {
  value = "ssh ${var.gce_ssh_user}@${data.google_compute_instance.webserver.network_interface.0.access_config.0.nat_ip}"
} 