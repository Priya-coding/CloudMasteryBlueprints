###############################################################
# CloudMasteryBlueprints – Terraform Outputs
# Path: infrastructure/terraform/outputs.tf
# Purpose: Expose important values after provisioning
###############################################################

# ----------------------------
# EC2 Outputs
# ----------------------------

output "ec2_instance_type" {
  description = "The EC2 instance type being used"
  value       = var.instance_type
}

output "ec2_elastic_ip" {
  description = "Elastic IP address assigned to the EC2 instance"
  value       = var.ec2_elastic_ip
}

# ----------------------------
# IAM Outputs
# ----------------------------

output "iam_user_name" {
  description = "Name of the IAM user provisioned for access"
  value       = var.iam_user_name
}

output "iam_instance_profile_name" {
  description = "IAM instance profile name attached to the EC2 instance"
  value       = var.iam_instance_profile_name
}

# ----------------------------
# Route 53 Outputs
# ----------------------------

output "route53_domain_name" {
  description = "The registered domain name in Route 53"
  value       = var.domain_name
}

output "route53_zone_id" {
  description = "Hosted Zone ID for the Route 53 domain"
  value       = module.route53.zone_id
}
