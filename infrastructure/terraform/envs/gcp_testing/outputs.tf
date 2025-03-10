output "region" {
  value       = var.region
  description = "GCloud Region"
}

output "project_id" {
  value       = var.project_id
  description = "GCloud Project ID"
}

output "env-dynamic-url" {
  value = "https://${google_container_cluster.primary.endpoint}"
}


output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE Cluster Host"
}

output "kubernetes_cluster_client_certificate" {
  value       = google_container_cluster.primary.master_auth.0.client_certificate
  description = "GKE Client Certificate"
   sensitive = true
}

output "kubernetes_cluster_client_key" {
  value       = google_container_cluster.primary.master_auth.0.client_key
  description = "GKE Client Key"
   sensitive = true
}

output "kubernetes_cluster_ca_certificate" {
  value       = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
  description = "GKE CA Certificate"
  sensitive = true
}
