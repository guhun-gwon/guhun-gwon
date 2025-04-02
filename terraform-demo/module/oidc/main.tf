data "aws_eks_cluster" "eks" {
  name = var.cluster_name
}

resource "aws_iam_openid_connect_provider" "oidc" {
  url = data.aws_eks_cluster.eks.identity[0].oidc[0].issuer
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da0afd10df6"]

  tags = {
    Name = "eks-oidc"
  }
}

