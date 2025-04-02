resource "aws_iam_role" "test_eks_node_role" {
  name = "test-eks-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "test-eks-node-role"
  }
}

resource "aws_iam_role_policy_attachment" "node_ssm_policy" {
  role       = aws_iam_role.test_eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "node_worker_policy" {
  role       = aws_iam_role.test_eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "node_cni_policy" {
  role       = aws_iam_role.test_eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "node_ecr_policy" {
  role       = aws_iam_role.test_eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "node_cloudwatch_agent" {
  role       = aws_iam_role.test_eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "node_cloudwatch_logs" {
  role       = aws_iam_role.test_eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

resource "aws_iam_role_policy_attachment" "node_vpc_resource_controller" {
  role       = aws_iam_role.test_eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}

#output
output "eks_node_role_arn" {
  description = "ARN of the EKS node IAM role"
  value       = aws_iam_role.test_eks_node_role.arn
}