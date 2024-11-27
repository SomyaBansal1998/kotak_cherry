variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "az_count" {
  default = 2
}

variable "project_name" {
  default = "eks-project-kotak"
}

