################
# AWS PROVIDER
################
# Defines the AWS provider and region for deployment.
provider "aws" {
    region = var.aws_region
}

##########################
# IAM MODULE 
##########################
module "iam" {
  source         = "./modules/iam"
  project_name   = "cloudmastery"
  iam_user_name  = "CloudMaster"
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
    iam_instance_profile_name = module.iam.ec2_instance_profile_name
}

##########################
# ROUTE53 MODULE 
##########################
module "route53" {
  source          = "./modules/route53"
  domain_name     = var.domain_name
  ec2_elastic_ip  = var.ec2_elastic_ip
}

#####################################
# NETWORKING MODULE (SECURITY GROUP)
#####################################
# Define network security rules for the EC2 instance.
module "networking" {
    source              = "./modules/networking"
    security_group_name = "hugo-security-group"
}

#######################################
# ECR MODULE
#######################################
# This module hnadles the ECR repo for the Docekr images
module "ecr" {
    source         = "./modules/ecr"
    project_name  = "cloudmastery"
    environment   = "dev"
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
