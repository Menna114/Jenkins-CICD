variable "vpc_cidr" {}
resource "aws_vpc" "dev_proj_1_vpc" {
  cidr_block = var.vpc_cidr #ip range for my vpc
  tags = {
    Name = var.vpc_name
  }
}
