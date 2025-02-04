################################
# GLOBAL VARIABLE DEFINITIONS
################################
variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type (Free Tier: t2.micro)"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair for accessing EC2 instance"
  type        = string
}
