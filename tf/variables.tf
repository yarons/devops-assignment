variable "region" {
  description = "AWS region"
  default     = "eu-north-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  default     = "vi-eks-cluster"
}

variable "mongodb_root_username" {
  description = "MongoDB root username"
  type        = string
}

variable "mongodb_root_password" {
  description = "MongoDB root password"
  type        = string
  sensitive   = true
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS access key"
  type        = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS secret key"
  type        = string
}