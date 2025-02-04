################################
# OUTPUT VARIABLES FOR EC2
################################
# Outputs the public IP of the EC2 instance for easy access.
output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.hugo_server.public_ip
}