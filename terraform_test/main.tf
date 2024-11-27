terraform {
  backend "s3" {
    bucket         = "terraform-bucket-test-kotak"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.77.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source           = "./modules/vpc"
  cidr_block       = "10.0.0.0/16"
  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
  az_count         = 2
  project_name     = "eks-project-kotak"
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = "eks-cluster-kotak"
  cluster_version = "1.26"
  private_subnets = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  desired_capacity = var.eks_desired_capacity
  max_capacity     = var.eks_max_capacity
  min_capacity     = var.eks_min_capacity
  instance_type    = "t3.medium"
}

module "alb" {
  source           = "./modules/alb"
  public_subnets   = module.vpc.public_subnets
  alb_security_group = "sg-12345678"  # Replace with your security group
  project_name     = "eks-project-kotak"
}

