###############################################################
# CloudMasteryBlueprints – Terraform Variables
# Purpose: Declare all configurable variables 
###############################################################

# ----------------------------
# AWS Configuration
# ----------------------------

# AWS Region where resources will be deployed
aws_region = "us-east-1"

# ----------------------------
# EC2 Instance Configuration
# ----------------------------

# Instance type – t2.micro is free-tier eligible
instance_type = "t2.micro"

# SSH Key Pair name – must exist in the selected AWS region
# You can create one via AWS Console or CLI and upload your public key
key_name = "cloudmastery_key"

# ----------------------------
# IAM Configuration
# ----------------------------

# IAM user for EC2 or programmatic access
iam_user_name = "CloudMaster"

# IAM instance profile name used to attach policies to EC2
iam_instance_profile_name = "CloudMasteryEC2InstanceProfile"

# ----------------------------
# Route 53 / Domain Configuration
# ----------------------------

# Custom domain name purchased from Namecheap or other registrar
domain_name = "cloudmom-stack.site"

# Static Elastic IP of your EC2 instance (must be allocated and associated)
# This is the public IPv4 address that Route 53 will point to
ec2_elastic_ip = "44.217.178.252"