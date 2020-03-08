variable "gcp_project" {
  type = string
}

variable "gcp_region" {
  type    = string
  default = "us-central1"
}

variable "gcp_zone" {
  type    = string
  default = "us-central1-a"
}

variable "gcp_network_name" {
  type    = string
  default = "default"
}

variable "cloud_flare_api_token" {
  type = string
}

variable "cloudflare_zone_id" {
  type = string
}

variable "gce_ssh_user" {
  type        = string
  default     = "runner"
  description = "GCE username. In cloud-init file is created the runner user"
}

variable "gce_ssh_pub_key_file" {
  type        = string
  description = "The location of your or the system ssh public key"
}

variable "gce_ssh_priv_key_file" {
  type        = string
  description = "The location of yout or the system private key for the remote-exec and file provisioners"
}

variable "gce_machine_type" {
  type    = string
  default = "f1-micro"
}

variable "gce_image" {
  type    = string
  default = "cos-cloud/cos-stable"
}

variable "gce_cloud_init_file" {
  type    = string
  default = "cloud-init.conf"
}

variable "cloud_flare_record_name" {
  type    = string
  default = "www"
}