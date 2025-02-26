resource "kubernetes_namespace" "argocd" {
  metadata {
    annotations = {
      name = "argocd-namespace-test-env"
    }

    name = "argocd"
  }
}