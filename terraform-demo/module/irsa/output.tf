output "iam_role_arn" {
  description = "IAM Role ARN"
  value       = aws_iam_role.this.arn
}

output "service_account_name" {
  description = "ServiceAccount 이름"
  value       = kubernetes_service_account.this.metadata[0].name
}
