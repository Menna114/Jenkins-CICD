output "dev_proj_1_vpc_id" {
  value       = aws_vpc.dev_proj_1_vpc.id
  description = "The VPC ID of the created VPC"
}

output "sg_ec2_sg_ssh_http_id" {
  value       = aws_security_group.ec2_sg_ssh_http.id
  description = "The security group ID for SSH and HTTP"
}

output "sg_ec2_jenkins_port_8080" {
  value       = aws_security_group.ec2_jenkins_port_8080.id
  description = "The security group ID for Jenkins port 8080"
}


