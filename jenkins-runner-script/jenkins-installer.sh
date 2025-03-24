#!/bin/bash
sudo apt-get update
yes | sudo apt install openjdk-17-jdk-headless  # use Java 17 
echo "Waiting for 30 seconds before installing the Jenkins package..."
sleep 30

#Jenkins repository key and source list
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
yes | sudo apt-get install jenkins
sleep 30

echo "Waiting for 30 seconds before installing Terraform..."
wget https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_amd64.zip  # Use amd64 for better compatibility
yes | sudo apt-get install unzip
unzip terraform_1.6.5_linux_amd64.zip  
sudo mv terraform /usr/local/bin/
