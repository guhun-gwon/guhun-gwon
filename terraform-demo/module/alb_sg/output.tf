output "alb_security_group_id" {
  description = "ID of the created security group for external access"
  value       = aws_security_group.ingress_allow_web_office.id
}
