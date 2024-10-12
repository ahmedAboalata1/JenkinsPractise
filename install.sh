#!/bin/bash

# Update the system
echo "--------------------Updating the System--------------------"
sudo apt update -y
sudo apt upgrade -y

# Install Java (OpenJDK 17)
echo "--------------------Installing Java (OpenJDK 17)--------------------"
sudo apt install -y fontconfig openjdk-17-jre

# Verify Java installation
echo "--------------------Verifying Java Installation--------------------"
java -version

# Add Jenkins GPG key and repository
echo "--------------------Adding Jenkins Repository--------------------"
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list and install Jenkins
echo "--------------------Installing Jenkins--------------------"
sudo apt update -y
sudo apt install -y jenkins

# Start and enable Jenkins service
echo "--------------------Starting and Enabling Jenkins--------------------"
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Install Docker
echo "--------------------Installing Docker--------------------"
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Install Ansible
echo "--------------------Installing Ansible--------------------"
sudo apt install -y ansible

# Add current user and Jenkins to Docker group
echo "--------------------Adding Docker Permissions--------------------"
sudo usermod -aG docker $USER
sudo usermod -aG docker jenkins
newgrp docker

# Display Jenkins initial admin password
echo "--------------------Displaying Jenkins Initial Admin Password--------------------"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword


#chmod +x install_jenkins.sh
# ./install_jenkins.sh
