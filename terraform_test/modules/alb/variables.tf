variable "public_subnets" {
  type = list(string)
}

variable "alb_security_group" {}

variable "project_name" {
  default = "eks-project-kotak"
}

