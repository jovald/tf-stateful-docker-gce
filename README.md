# Stateful provisioning a Docker Compose application into Google Compute Engine with a domain in Cloudflare | CMS Grav

The application is a [Grav project](https://getgrav.org/).

## Variables
Rename `terraform.tfvars.copy` to `terraform.tfvars` and fill the variables:

```sh
cloud_flare_api_token = "<CLOUD_FLARE_API>"
cloudflare_zone_id    = "<CLOUD_FLARE_ZONE_ID>"
gcp_project           = "<GCP_PROJECT_ID>"
gce_ssh_user          = "runner" # Leave this, or modify cloud-init.conf for whit different user
gce_ssh_pub_key_file  = "<YOUR_SSH_PUBLIC_KEY_PATH>"
gce_ssh_priv_key_file = "<YOUR_SSH_PRIVATE_KEY_PATH>"
```

## Service account
Create a service account of your GCP project with GCE admin permissions. Place it in the `infra` folder and rename it to `account.json`.

## GCP APIs
Activate the GCE API in your GCP project.

## Run
```sh
cd infra
terraform init
terraform apply
```