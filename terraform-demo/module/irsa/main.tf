resource "aws_iam_role" "this" {
  name = var.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = var.oidc_provider_arn
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringEquals = {
            "${replace(var.oidc_provider_url, "https://", "")}:sub" = "system:serviceaccount:${var.namespace}:${var.service_account_name}"
          }
        }
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_policy" "this" {
  count  = var.policy_json != null ? 1 : 0
  name   = "${var.name}-policy"
  policy = var.policy_json
}

resource "aws_iam_role_policy_attachment" "this" {
  count      = var.policy_json != null ? 1 : 0
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this[0].arn
}

resource "kubernetes_service_account" "this" {
  metadata {
    name      = var.service_account_name
    namespace = var.namespace
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.this.arn
    }
  }
}


