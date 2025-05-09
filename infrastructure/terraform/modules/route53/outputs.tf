###############################################################
# Output – Route53 Module
# Path: infrastructure/terraform/modules/route53/outputs.tf
###############################################################

output "zone_id" {
  description = "Route 53 hosted zone ID"
  value       = aws_route53_zone.main.zone_id
}
