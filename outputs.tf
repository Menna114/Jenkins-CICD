output "dev_proj_1_vpc_id" {
  value = module.networking.dev_proj_1_vpc_id
}

output "sg_ec2_sg_ssh_http_id" {
  value = module.security_group.sg_ec2_sg_ssh_http_id
}

output "sg_ec2_jenkins_port_8080" {
  value = module.security_group.sg_ec2_jenkins_port_8080
}


output "dev_proj_1_public_subnets" {
  value = module.networking.dev_proj_1_public_subnets
}

