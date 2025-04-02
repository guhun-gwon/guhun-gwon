#output
output "argocd_helm_release_name" {
  description = "The name of the Helm release for ArgoCD"
  value       = helm_release.argocd.name
}

output "argocd_namespace" {
  description = "The namespace where ArgoCD is installed"
  value       = helm_release.argocd.namespace
}

output "argocd_chart" {
  description = "The Helm chart name used for ArgoCD"
  value       = helm_release.argocd.chart
}

output "argocd_ingress_hostname" {
  description = "Hostname of the ArgoCD ingress"
  value = (
    length(kubernetes_ingress_v1.argocd_ingress.status[0].load_balancer[0].ingress) > 0 ?
    kubernetes_ingress_v1.argocd_ingress.status[0].load_balancer[0].ingress[0].hostname :
    ""
  )
}