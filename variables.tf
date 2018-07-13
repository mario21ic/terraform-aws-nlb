variable "region" {
  description = "aws region"
}

variable "name" {
  description = "ELB name"
}

variable "env" {
  description = "Environment name"
}

variable "internal" {
  default = false
}

variable "port" {}

variable "vpc_id" {
  description = "VPC Id"
}

variable "subnet_ids" {
  type = "list"
  description = "Subnet available"
}