provider "cloudflare" {
  version   = "~> 2.0"
  api_token = var.cloud_flare_api_token
}

data "google_compute_instance" "webserver" {
  name = google_compute_instance.webserver.name
  zone = var.zone
}

resource "cloudflare_record" "www" {
  depends_on = [google_compute_instance.webserver]
  zone_id    = var.cloudflare_zone_id
  name       = "www"
  value      = data.google_compute_instance.webserver.network_interface.0.access_config.0.nat_ip
  type       = "A"
  proxied    = true
}