# k8s_cluster/talos_image.tf

locals {
  factory_url   = "https://factory.talos.dev"

  platform      = "nocloud"
  arch          = list("amd64","arm")
  version       = "v1.8.1"
  schematic     = file("$(path.module)/image/schematic.yaml")

  schematic_id  = jsondecode(data.http.schematic_id.response_body)["id"]
  image_id      = "${local.schematic_id}_${local.version}"
}

data "http" "schematic_id" {
    url             = "${local.factory_url}/schematics"
    method          = "POST"
    request_body    = local.schematic
}

