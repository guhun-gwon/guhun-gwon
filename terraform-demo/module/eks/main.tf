resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  tags = {
    Name = var.cluster_name
  }
}

resource "aws_eks_node_group" "default" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids
  instance_types  = var.instance_types

  scaling_config {
    desired_size = var.desired_capacity
    min_size     = var.min_capacity
    max_size     = var.max_capacity
  }

  capacity_type = var.capacity_type

  tags = merge(
    var.node_group_tags,
    var.cluster_tags
  )

  depends_on = [
    aws_eks_cluster.eks
  ]
}

#aws_eks_cluster에서 기본 SG를 가져오기
data "aws_eks_cluster" "eks" {
  name       = aws_eks_cluster.eks.name
  depends_on = [aws_eks_cluster.eks]
}

resource "aws_security_group_rule" "allow_from_alb" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = data.aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
  source_security_group_id = var.alb_sg_id
}

data "aws_eks_cluster_auth" "eks" {
  name       = aws_eks_cluster.eks.name
  depends_on = [aws_eks_cluster.eks]
}

