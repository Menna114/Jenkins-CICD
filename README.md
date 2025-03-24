# **Jenkins-CICD Setup**

## Overview

This repository contains Terraform scripts for setting up a **Jenkins CI/CD server** on AWS. The Jenkins instance is provisioned in the **eu-west-1** region and is configured to automate deployment pipelines for applications.

## Project Structure

```
├── ec2-instance/             # EC2 instance setup for Jenkins
│   ├── main.tf
│   ├── outputs.tf
├── security-groups/          # Security groups and firewall rules
│   ├── main.tf
│   ├── outputs.tf
├── networking/               # VPC, subnets, and networking configuration
│   ├── main.tf
│   ├── outputs.tf
├── hosted-zone/              # Route 53 hosted zone setup
│   ├── main.tf
├── lb-target-groups/         # Target groups for load balancing
│   ├── main.tf
│   ├── outputs.tf
├── load-balancer/            # Application Load Balancer setup
│   ├── main.tf
│   ├── outputs.tf
├── jenkins-runner-script/    # Jenkins installation and setup scripts
│   ├── jenkins-installer.sh
├── main.tf                   # Main Terraform configuration
├── provider.tf               # Provider configuration
├── backend.tf                # Terraform backend configuration
├── outputs.tf                # Output values after Terraform apply
├── .gitignore                # Ignoring Terraform state and sensitive files
└── README.md                  # Project documentation

```

## AWS Services Used

- **EC2**: Hosts the Jenkins master node.
- **IAM**: Manages permissions and access control.
- **Security Groups**: Controls access to Jenkins via SSH and HTTP(S).
- **VPC & Subnets**: Networking configuration for Jenkins and Load Balancer.
- **Load Balancer**: Ensures high availability.
- **Route 53**: Custom domain mapping for Jenkins.
- **S3 (optional)**: Stores Terraform state files securely.

## Prerequisites

- **SSH key pair** for accessing the Jenkins instance
- **Git** for version control
- **Domain Name**: You need to purchase a domain from a provider (e.g., Namecheap, AWS Route 53) or use the Load Balancer's domain name.

## Continuous Deployment

Jenkins is configured to pull changes from **your** **application repository** and deploy them automatically. The pipeline can be customized based on your CI/CD workflow.
