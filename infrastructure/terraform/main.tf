################
# AWS PROVIDER
################
# Defines the AWS provider and region for deployment.
provider "aws" {
    region = var.aws_region
}


##########################
# EC2 INSTANCE MODULE 
##########################
# This Module manages the EC2 instance creation.
module "ec2" {
    source              = "./modules/ec2"
    instance_type       = var.instance_type
    key_name            = var.key_name
    security_group_id   = module.networking.security_group_id
}

#####################################
# NETWORKING MODULE (SECURITY GROUP)
#####################################
# Define network security rules for the EC2 instance.
module "networking" {
    source              = "./modules/networking"
    security_group_name = "hugo-security-group"
}

############################
# OUTPUTS
############################
# Outputs the EC2 instance ID and public IP address, AFTER deployment.
# Outputs are useful for retrieving information about the deployed resources.
output "ec2_public_ip" {
    description = "Public IP address of the EC2 instance"
    value       = module.ec2.public_ip
}
