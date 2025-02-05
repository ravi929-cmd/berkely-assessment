# Terraform Infrastructure Deployment Guide

## Prerequisites

Before deploying the Terraform Infrastructure as Code (IaC) on AWS, ensure you have the following setup on your local machine:

### 1. Install AWS CLI v2
- Download and install **AWS CLI v2** from [AWS CLI Official Download Page](https://aws.amazon.com/cli/).
- After installation, verify it is correctly installed by running:
  
  aws --version
  
- Ensure the AWS CLI path is added to your system's **Environment Variables**.
  - If not, manually add the AWS CLI installation directory to the **PATH** variable.

### 2. Install Terraform
- Download and install **Terraform** from [Terraform Official Download Page](https://developer.hashicorp.com/terraform/downloads).
- Verify the installation by running:
  
  terraform -version
  

### 3. Create an IAM User on AWS with Full Access
- Log in to your **AWS Console**.
- Navigate to **IAM (Identity & Access Management)**.
- Create a new IAM user with the following permissions:
  - **AdministratorAccess** (Grants full access to all AWS services and resources)
- Generate **Access Key ID** and **Secret Access Key**.
- Store these keys securely, as they will be needed for authentication.

### 4. Configure AWS Environment Variables
- Open **Command Prompt** and set up the AWS credentials using the following commands:
  
  setx AWS_ACCESS_KEY_ID "YourAccessKeyID"
  setx AWS_SECRET_ACCESS_KEY "YourSecretAccessKey"
  setx AWS_REGION "us-east-1"   # Change the region as per your requirement
  
  _Note: Restart the terminal after setting environment variables._

## Deployment Instructions

### 1. Clone the GitHub Repository

git clone https://github.com/ravi929-cmd/berkely-assessment.git


### 2. Navigate to the Terraform Deployment Folder ""task2-ec2""

cd berkely-assesment/task2-ec2

Modify variables default values in ""variables.tf"" according to your AWS Environment.

Once done, save it and head to start terraform.

### 3. Initialize Terraform

terraform init


### 4. Validate the Terraform Configuration

terraform validate


### 5. Plan the Deployment

terraform plan


### 6. Deploy the Infrastructure

terraform apply -auto-approve



### 7. Verify the Deployed Infrastructure
After successful deployment, verify the EC2 instance in the AWS Console:
- Go to **AWS Console > EC2 > Instances**
- Find the instance and confirm that it is running.
- Find ".pem key" in AWS secret manager, to decrypt AWS EC2 Instance Administrator Password and connect to it through Downloaded RDP file.

## Cleanup (Optional)
To destroy the infrastructure when no longer needed, run:

terraform destroy -auto-approve


---

