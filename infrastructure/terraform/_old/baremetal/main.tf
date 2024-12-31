## file:        baremetal/main.terraform
## usage:       declare common settings for terraform
## last_upd:    02.07.2024

# Read secrets from sops
data "sops_file" "baremetal_secrets" {
  source_file = "baremetal_secrets.sops.yaml"
}