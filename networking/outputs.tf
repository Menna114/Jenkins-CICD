output "dev_proj_1_public_subnets" {
  value = aws_subnet.dev_proj_1_public_subnets.*.id
}
output "dev_proj_1_vpc_id" {
  value = aws_vpc.dev_proj_1_vpc.id
}
