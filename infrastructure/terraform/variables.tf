###############################################################
#              GLOBAL VARIABLE DEFINITIONS
# CloudMasteryBlueprints – Terraform Variables Definition
# Path: infrastructure/terraform/variables.tf
# Purpose: Declare input variables for EC2, IAM, and Route 53 setup
###############################################################

# ----------------------------
# AWS Configuration
# ----------------------------

variable "aws_region" {
  description = "AWS region to deploy resources (e.g., us-east-1)"
  type        = string
}

# ----------------------------
# EC2 Instance Configuration
# ----------------------------

variable "instance_type" {
  description = "EC2 instance type (Free Tier: t2.micro)"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name to access the EC2 instance"
  type        = string
}

# ----------------------------
# IAM Configuration
# ----------------------------

variable "iam_user_name" {
  description = "IAM user to attach the ECR policy to"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "The name of the IAM instance profile to attach to the EC2 instance"
  type        = string
}

# ----------------------------
# Route 53 / Domain Configuration
# ----------------------------

variable "domain_name" {
  description = "Custom domain name to configure (e.g., cloudmom-stack.site)"
  type        = string
}

variable "ec2_elastic_ip" {
  description = "Elastic IP address of the EC2 instance used in Route 53 A-record"
  type        = string
}


