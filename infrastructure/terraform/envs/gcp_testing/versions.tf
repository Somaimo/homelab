terraform {
  required_providers {
    sops = {
        source = "carlpett/sops"
        version = "~>1.0.0"
    }
    google = {
      source = "hashicorp/google"
      version = ">=6.14.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}
