variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "cidr_public_subnet" {
  description = "CIDR block for the public subnet"
  type        = list(string)
}

variable "cidr_private_subnet" {
  description = "CIDR block for the private subnet"
  type        = list(string)
}

variable "eu_availability_zone" {
  description = "Availability zone for the subnets"
  type        = list(string)
}
variable "public_key" {
  type        = string
  description = "DevOps Project 1 Public key for EC2 instance"
}

variable "ec2_ami_id" {
  type        = string
  description = "DevOps Project 1 AMI Id for EC2 instance"
}