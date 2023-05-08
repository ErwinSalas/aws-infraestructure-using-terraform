variable "vpc" {
  type        = any
  description = "VPC del laboratorio"
}

variable "cidr_block" {
  type = string
}

variable "public_cidr_block_a" {
  type = string
}

variable "public_cidr_block_b" {
  type = string
}


variable "private_cidr_block" {
  type = string
}