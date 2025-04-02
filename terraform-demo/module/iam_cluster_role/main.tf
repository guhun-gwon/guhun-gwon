resource "aws_iam_role" "test_eks_cluster_role" {
  name = "test-eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "test-eks-cluster-role"
  }
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.test_eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_vpc_resource_controller_policy" {
  role       = aws_iam_role.test_eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}

#output
output "eks_cluster_role_arn" {
  description = "ARN of the EKS cluster IAM role"
  value       = aws_iam_role.test_eks_cluster_role.arn
}
