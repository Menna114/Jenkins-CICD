terraform {
  backend "s3" {
    bucket = "jenkins-bucket-devops-project-2"
    key    = "devops-terraform.tfstate"
    region = "eu-west-1"
    profile = "devops_project"
  }
}