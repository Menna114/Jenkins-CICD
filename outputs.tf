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

output "jenkins_ec2_instance_ip" {
  value = module.ec2-jenkins.jenkins_ec2_instance_ip
}

output "dev_proj_1_lb_target_group_arn" {
  value = module.lb-target-group.dev_proj_1_lb_target_group_arn
}

output "aws_lb_dns_name" {
  value = module.alb.aws_lb_dns_name
}

output "aws_lb_zone_id" {
  value = module.alb.aws_lb_zone_id
}
