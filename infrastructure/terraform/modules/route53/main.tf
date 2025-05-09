##########################################
# ROUTE53 MODULE – CloudMasteryBlueprints
# Path: infrastructure/terraform/modules/route53/main.tf
##########################################

# Create a public hosted zone for the domain
resource "aws_route53_zone" "main" {
  name = var.domain_name
}

# Create an A record to map domain to EC2 Elastic IP
resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 300
  records = [var.ec2_elastic_ip]
}