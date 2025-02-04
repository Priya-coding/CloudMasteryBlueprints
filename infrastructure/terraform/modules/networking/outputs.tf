################################
# OUTPUT VARIABLES FOR NETWORKING
################################
# Outputs the security group ID.
output "security_group_id" {
  description = "Security Group ID for EC2 instance"
  value       = aws_security_group.hugo_sg.id
}
