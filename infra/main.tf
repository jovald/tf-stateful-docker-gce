provider "google" {
  credentials = file("account.json")
  project     = var.project
  region      = var.region
}

resource "google_compute_instance" "webserver" {
  name         = "webserver"
  machine_type = "f1-micro"
  zone         = var.zone

  tags = ["webserver"]

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
    user-data = file("cloud-init.conf")
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}

resource "null_resource" "copy_dockert" {

  depends_on = [google_compute_instance.webserver]

  connection {
    host        = data.google_compute_instance.webserver.network_interface.0.access_config.0.nat_ip
    type        = "ssh"
    user        = var.gce_ssh_user
    private_key = file(var.gce_ssh_priv_key_file)
  }

  provisioner "file" {
    source      = "../app"
    destination = "/home/${var.gce_ssh_user}/grav"
  }

  provisioner "remote-exec" {
    inline = [
      "docker run docker/compose:1.24.0 version",
      "cd /home/${var.gce_ssh_user}/grav"
      "docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v $PWD:$PWD -w=$PWD docker/compose:1.24.0 -d up"
    ]
    connection {
      script_path = "/var/lib/cloud/instance/provision.sh"
    }
  }
}

data "google_compute_network" "default" {
  name = var.network_name
}

resource "google_compute_firewall" "default" {
  name    = "default-allow-http"
  network = data.google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}