output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.oidc.arn
}

output "oidc_provider_url" {
  value = replace(data.aws_eks_cluster.eks.identity[0].oidc[0].issuer, "https://", "")
}
