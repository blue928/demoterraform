resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  # todo change this to a variable
  namespace = "ingress-nginx"
  create_namespace = true
  timeout = 120
  #atomic  = true
  cleanup_on_fail = true

  #values = [file("nginx_ingress_values.yaml")]

  set {
    name  = "controller.replicaCount"
    value = "2"
  }

  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }

  set {
    name  = "controller.service.loadBalancerIP"
    value = azurerm_public_ip.lb_public_ip.ip_address
  }

  depends_on = [
    azurerm_kubernetes_cluster.k8s,
  ]

}