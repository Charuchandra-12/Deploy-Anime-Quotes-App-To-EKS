variable "vpc_cidr" {
  description = "vpc_cidr_value"
  type        = string
}

variable "public_subnets" {
  description = "public_subnets_cidr_value"
  type        = list(string)
}

variable "instance_type" {
  description = "instance_type_value"
  type        = string
}

variable "ubuntu_lts_ami" {
  description = "ubuntu_lts_ami_value"
  type        = string
}