variable "vpc_cidr" {
  description = "vpc_cidr_value"
  type        = string
}

variable "public_subnets" {
  description = "public_subnets_cidr_value"
  type        = list(string)
}

variable "private_subnets" {
  description = "private_subnets_cidr_value"
  type        = list(string)
}