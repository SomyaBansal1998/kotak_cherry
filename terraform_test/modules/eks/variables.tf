variable "cluster_name" {
  default = "eks-cluster-kotak"
}

variable "cluster_version" {
  default = "1.26"
}

variable "vpc_id" {}

variable "private_subnets" {
  type = list(string)
}

variable "desired_capacity" {
  description = "Desired capacity for EKS node group"
}

variable "max_capacity" {
  description = "Maximum capacity for EKS node group"
}

variable "min_capacity" {
  description = "Minimum capacity for EKS node group"
}

variable "instance_type" {
  default = "t3.medium"
}

