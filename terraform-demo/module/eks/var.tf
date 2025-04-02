variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
}

variable "cluster_role_arn" {
  description = "IAM role ARN for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS"
  type        = list(string)
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for the worker nodes"
  type        = string
}

variable "instance_types" {
  description = "List of EC2 instance types for the node group"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "capacity_type" {
  description = "Capacity type for the node group"
  type        = string
}

variable "node_group_tags" {
  description = "Tags to apply to the EKS node group"
  type        = map(string)
  default     = {}
}

variable "cluster_tags" {
  description = "Tags to apply to the EKS cluster"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "alb_sg_id" {
  description = "ALB Security Group ID"
  type        = string
}