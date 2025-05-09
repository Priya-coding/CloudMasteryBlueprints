#############################################
# VARIABLE DEFINITIONS FOR ECR REPOSITORY
#############################################

variable "project_name" {
  description = "The name of the project (e.g., cloudmastery)"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy ECR repository"
  type        = string
  default     = "us-east-1"
}

