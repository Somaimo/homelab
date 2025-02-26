## file:        gcp_testing/data.tf
## usage:       declare configuration for terraform / tofu
## last_upd:    31.12.2024

# Read secrets from sops
data "sops_file" "general_secrets" {
    source_file = "./00_secrets/general_secrets.sops.yaml"
}

data "google_client_config" "current" {}