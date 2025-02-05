variable "AWS_REGION" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1" # set your AWS region in which you want to deploy ec2.
}

variable "vpc_id" {
  description = "The VPC ID where the ALB will be deployed"
  type        = string
  default     = "vpc-00be5cbbd305a3fc2" #Please give your Default VPC ID in your AWS account.
}

variable "public_subnets" {
  description = "List of public subnets for the ALB"
  type        = list(string)
  default     = ["subnet-0b8144da755d36a7e", "subnet-0087637f8890ccb7e"] # Check your default public subnets and give any 2 of them for ALB.
}

variable "windows_ami" {
  description = "The AMI ID for the Windows Server"
  type        = string
  default     = "ami-0a0ebee827a585d06" # Check your AMI ID , in your region and provide here(Microsoft Windows 2022 Datacenter edition.).
}