
# Add permanent namespaces to cluster
resource "kubernetes_namespace" "production_ns" {
  metadata {
    name = var.cluster_production_namespace
  }
}

resource "kubernetes_namespace" "staging_ns" {
  metadata {
    name = var.cluster_staging_namespace
  }
}

resource "kubernetes_namespace" "development_ns" {
  metadata {
    name = var.cluster_development_namespace
  }
}

resource "kubernetes_namespace" "qa_ns" {
  metadata {
    name = var.cluster_qa_namespace
  }
}

