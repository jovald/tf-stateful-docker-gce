variable "project" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "domain" {
  type = string
}

variable "network_name" {
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
  type = string
}

variable "gce_ssh_pub_key_file" {
  type = string
}

variable "gce_ssh_priv_key_file" {
  type = string
}