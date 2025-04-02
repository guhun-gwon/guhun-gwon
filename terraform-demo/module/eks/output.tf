output "cluster_name" {
  description = "EKS Cluster name"
  value       = aws_eks_cluster.eks.name
}

output "cluster_endpoint" {
  description = "EKS Cluster endpoint"
  value       = aws_eks_cluster.eks.endpoint
}

output "cluster_ca" {
  description = "EKS Cluster Certificate Authority"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}

output "cluster_auth_token" {
  description = "EKS Cluster Auth Token (used with kubectl or Helm)"
  value       = data.aws_eks_cluster_auth.eks.token
  sensitive   = true
}

output "node_group_name" {
  description = "Name of the node group"
  value       = aws_eks_node_group.default.node_group_name
}
