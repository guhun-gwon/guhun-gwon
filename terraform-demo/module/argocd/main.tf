resource "helm_release" "argocd" {
  name             = var.argocd_name
  repository       = var.argocd_repository
  chart            = var.argocd_chart
  namespace        = var.argocd_namespace
  create_namespace = true

  set {
    name  = "server.service.type"
    value = "ClusterIP"
  }

  set {
    name  = "server.insecure"
    value = true
  }

  set {
    name  = "server.config.url"
    value = "http://${var.argocd_hostname}"
  }

  set {
    name  = "server.service.ports.https"
    value = ""
  }

  set {
    name  = "server.extraArgs"
    value = "{--insecure}"
  }
}

# ALB 기반 ArgoCD Ingress
resource "kubernetes_ingress_v1" "argocd_ingress" {
  depends_on = [helm_release.argocd]

  metadata {
    name      = "argocd-ingress"
    namespace = var.argocd_namespace

    annotations = {
      "kubernetes.io/ingress.class"                = "alb"
      "alb.ingress.kubernetes.io/scheme"           = "internet-facing"
      "alb.ingress.kubernetes.io/target-type"      = "ip"
      "alb.ingress.kubernetes.io/security-groups"  = var.alb_security_group_id
      "alb.ingress.kubernetes.io/listen-ports"     = "[{\"HTTP\":80}]"
      "alb.ingress.kubernetes.io/backend-protocol" = "HTTP"
      "alb.ingress.kubernetes.io/subnets"          = join(",", var.public_subnet_ids)
      "alb.ingress.kubernetes.io/healthcheck-path" = "/healthz"
    }
  }

  spec {
    ingress_class_name = "alb"

    rule {
      host = var.argocd_hostname
      http {
        path {
          path      = var.argocd_path
          path_type = var.argocd_path_type
          backend {
            service {
              name = var.argocd_service_name
              port {
                number = var.argocd_service_port
              }
            }
          }
        }
      }
    }
  }
}

