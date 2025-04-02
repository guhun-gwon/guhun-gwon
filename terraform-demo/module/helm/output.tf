output "aws_lb_controller_name" {
  description = "The name of the AWS Load Balancer Controller Helm release"
  value       = helm_release.aws_lb_controller.name
}

output "aws_lb_controller_namespace" {
  description = "The namespace where the AWS Load Balancer Controller is deployed"
  value       = helm_release.aws_lb_controller.namespace
}

output "aws_lb_controller_chart" {
  description = "The chart used for the AWS Load Balancer Controller"
  value       = helm_release.aws_lb_controller.chart
}

output "aws_lb_controller_version" {
  description = "The deployed version of the AWS Load Balancer Controller Helm chart"
  value       = helm_release.aws_lb_controller.version
}
