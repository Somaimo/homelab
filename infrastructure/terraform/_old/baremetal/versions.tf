terraform {
  required_providers {
    dns = {
        source = "hashicorp/terraform-provider-dns"
        version = ">=3.4.1"
    }
    sops = {
        source = "carlpett/sops"
        version = "1.0.0"
    }
  }
}
