resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "public" {
  count                   = var.az_count
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_subnets, count.index)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count                   = var.az_count
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.private_subnets, count.index)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = "${var.project_name}-private-${count.index}"
  }
}

data "aws_availability_zones" "available" {}

output "private_subnets" {
  value = aws_subnet.private[*].id
  description = "The IDs of the private subnets"
}

output "public_subnets" {
  value = aws_subnet.public[*].id
  description = "The IDs of the public subnets"
}

output "vpc_id" {
  value = aws_vpc.main.id
  description = "The ID of the VPC"
}

