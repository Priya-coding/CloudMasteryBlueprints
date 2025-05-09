################################
# SECURITY GROUP FOR EC2
################################
# Defines the security group for network access to the EC2 instance.
resource "aws_security_group" "hugo_sg" {
  name        = "hugo_sg"
  description = "Allow inbound HTTP and SSH"

  # Allow HTTP (Port 80) for website access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH (Port 22) for manual server access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open HTTPS to the world
  }

  # Outbound rules (Allow all traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cloudmastery-hugo-sg"
  }
}


