data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_name
}

data "aws_eks_node_group" "default" {
  cluster_name    = module.eks.cluster_name
  node_group_name = module.eks.node_group_name

  depends_on = [module.eks]
}

module "vpc" {
  source               = "../module/vpc"
  vpc_name             = "eks-test-vpc"
  vpc_cidr             = "9.0.0.0/16"
  availability_zones   = ["ap-northeast-2a", "ap-northeast-2b"]
  public_subnet_cidrs  = ["9.0.30.0/24", "9.0.40.0/24"]
  private_subnet_cidrs = ["9.0.10.0/24", "9.0.20.0/24"]
  enable_nat_gateway   = true
}

module "eks" {
  source               = "../module/eks"

  cluster_name         = "eks-test"
  cluster_version      = "1.31"
  cluster_role_arn     = module.iam_cluster_role.eks_cluster_role_arn
  node_group_name      = "test-nodegroup"
  node_role_arn        = module.iam_node_role.eks_node_role_arn
  subnet_ids           = concat(module.vpc.private_subnets, module.vpc.public_subnets)
  instance_types       = ["t3.medium"]
  desired_capacity     = 2
  min_capacity         = 1
  max_capacity         = 3
  capacity_type        = "ON_DEMAND"
  vpc_id               = module.vpc.vpc_id
  alb_sg_id            = module.alb_sg.alb_security_group_id

  node_group_tags = {
    Name = "eks-node"
    env  = "test"
  }

  cluster_tags = {
    Name = "my-eks-cluster"
    env  = "test"
  }
}

module "iam_cluster_role" {
  source = "../module/iam_cluster_role"
}

module "iam_node_role" {
  source = "../module/iam_node_role"
}
module "alb_sg" {
  source     = "../module/alb_sg"

  vpc_id     = module.vpc.vpc_id
  allowed_ip = "1.214.218.218/32"
  http_port  = 80
  https_port = 443
  sg_name    = "ingress-allow-web-office"
}

module "helm" {
  source = "../module/helm"
  depends_on = [module.eks]

  cluster_name = module.eks.cluster_name
  vpc_id       = module.vpc.vpc_id
}

module "argocd" {
  source                  = "../module/argocd"
  depends_on              = [
    module.eks,
    module.helm
  ]

  argocd_name             = "argocd"
  argocd_repository       = "https://argoproj.github.io/argo-helm"
  argocd_chart            = "argo-cd"
  argocd_namespace        = "argocd"

  argocd_hostname         = "argocd.ts.local.test.com"
  argocd_path             = "/"
  argocd_path_type        = "Prefix"
  argocd_service_name     = "argocd-server"
  argocd_service_port     = 80

  alb_security_group_id   = module.alb_sg.alb_security_group_id
  public_subnet_ids       = module.vpc.public_subnets
}

module "oidc" {
  source        = "../module/oidc"
  cluster_name  = module.eks.cluster_name
  depends_on = [module.eks]
}

module "irsa_lb_controller" {
  source                = "../module/irsa"
  name                  = "AmazonEKSLoadBalancerControllerRole"
  namespace             = "kube-system"
  service_account_name  = "aws-load-balancer-controller"
  oidc_provider_arn     = module.oidc.oidc_provider_arn
  oidc_provider_url     = module.oidc.oidc_provider_url
  policy_json           = file("${path.module}/lb-controller-policy.json")
  tags = {
    Project = "eks"
  }
}