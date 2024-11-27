variable "eks_desired_capacity" {
  description = "Desired capacity for EKS worker nodes"
  default     = 2
}

variable "eks_max_capacity" {
  description = "Maximum capacity for EKS worker nodes"
  default     = 4
}

variable "eks_min_capacity" {
  description = "Minimum capacity for EKS worker nodes"
  default     = 2
}

