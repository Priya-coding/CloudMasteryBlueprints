################################
# VARIABLE DEFINITIONS FOR EC2
################################
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0062355a529d6089c" # Amazon Linux 2 AMI (Free Tier)
}

variable "instance_type" {
  description = "The instance type (t2.micro for Free Tier)"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair for EC2 access"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group associated with EC2"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "Name of the IAM instance profile to attach to the EC2 instance"
  type        = string
}
