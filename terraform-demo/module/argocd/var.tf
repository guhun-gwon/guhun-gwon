# Helm 설정
variable "argocd_name" {
  description = "Helm release name for ArgoCD"
  type        = string
}

variable "argocd_repository" {
  description = "ArgoCD Helm chart repository"
  type        = string
}

variable "argocd_chart" {
  description = "ArgoCD Helm chart name"
  type        = string
}

variable "argocd_namespace" {
  description = "Namespace to install ArgoCD"
  type        = string
}

# Ingress (ALB 기반) 설정
variable "argocd_hostname" {
  description = "Hostname for ArgoCD ingress"
  type        = string
}

variable "argocd_path" {
  description = "Ingress path for ArgoCD"
  type        = string
}

variable "argocd_path_type" {
  description = "Ingress path type (e.g., Prefix, Exact)"
  type        = string
}

variable "argocd_service_name" {
  description = "Name of the ArgoCD service to expose"
  type        = string
}

variable "argocd_service_port" {
  description = "Port of the ArgoCD service"
  type        = number
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "ALB security group ID"
  type        = string
}
