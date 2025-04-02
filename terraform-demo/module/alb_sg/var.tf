variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "allowed_ip" {
  description = "CIDR block allowed to access HTTP/HTTPS"
  type        = string
}

variable "http_port" {
  description = "HTTP port to allow (usually 80)"
  type        = number
}

variable "https_port" {
  description = "HTTPS port to allow (usually 443)"
  type        = number
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

