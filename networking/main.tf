variable "vpc_cidr" {}
variable "vpc_name" {}
variable "cidr_public_subnet" {}
variable "eu_availability_zone" {}
variable "cidr_private_subnet" {}

output "dev_proj_1_vpc_id" {
  value = aws_vpc.dev_proj_1_vpc.id
}

#VPC
resource "aws_vpc" "dev_proj_1_vpc" {
  cidr_block = var.vpc_cidr #ip range for my vpc
  tags = {
    Name = var.vpc_name
  }
}

# Public Subnet
resource "aws_subnet" "dev_proj_1_public_subnets" {
  count             = length(var.cidr_public_subnet)
  vpc_id            = aws_vpc.dev_proj_1_vpc.id
  cidr_block        = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.eu_availability_zone, count.index)

  tags = {
    Name = "dev-proj-public-subnet-${count.index + 1}"
  }
}
# Private Subnet
resource "aws_subnet" "dev_proj_1_private_subnets" {
  count             = length(var.cidr_private_subnet)
  vpc_id            = aws_vpc.dev_proj_1_vpc.id
  cidr_block        = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.eu_availability_zone, count.index)

  tags = {
    Name = "dev-proj-private-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "dev_proj_1_public_internet_gateway" {
  vpc_id = aws_vpc.dev_proj_1_vpc.id
  tags = {
    Name = "dev-proj-1-igw"
  }
}
# Public Route Table
resource "aws_route_table" "dev_proj_1_public_route_table" {
  vpc_id = aws_vpc.dev_proj_1_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_proj_1_public_internet_gateway.id
  }
  tags = {
    Name = "dev-proj-1-public-rt"
  }
}
# Private Route Table
resource "aws_route_table" "dev_proj_1_private_subnets" {
  vpc_id = aws_vpc.dev_proj_1_vpc.id
  tags = {
    Name = "dev-proj-1-private-rt"
  }
}
# Public Route Table and Public Subnet Association
resource "aws_route_table_association" "dev_proj_1_public_rt_subnet_association" {
  count          = length(aws_subnet.dev_proj_1_public_subnets)
  subnet_id      = aws_subnet.dev_proj_1_public_subnets[count.index].id
  route_table_id = aws_route_table.dev_proj_1_public_route_table.id
}

# Private Route Table and private Subnet Association
resource "aws_route_table_association" "dev_proj_1_private_rt_subnet_association" {
  count          = length(aws_subnet.dev_proj_1_private_subnets)
  subnet_id      = aws_subnet.dev_proj_1_private_subnets[count.index].id
  route_table_id = aws_route_table.dev_proj_1_private_subnets.id
}

