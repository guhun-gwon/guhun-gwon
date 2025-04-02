variable "name" {
  description = "IAM Role 이름"
  type        = string
}

variable "namespace" {
  description = "ServiceAccount가 생성될 Kubernetes 네임스페이스"
  type        = string
}

variable "service_account_name" {
  description = "ServiceAccount 이름"
  type        = string
}

variable "oidc_provider_arn" {
  description = "EKS OIDC Provider ARN"
  type        = string
}

variable "oidc_provider_url" {
  description = "EKS OIDC Provider URL"
  type        = string
}

variable "policy_json" {
  description = "IAM Policy JSON (옵션, null이면 정책 생성 안 함)"
  type        = string
}

variable "tags" {
  description = "IAM Role 태그"
  type        = map(string)
}