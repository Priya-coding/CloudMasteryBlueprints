##########################################
# EC2 INSTANCE CONFIGURATION
##########################################
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
# Deploys an Amazon Linux 2 EC2 instance to host the HUGO website.
resource "aws_instance" "hugo_server" {
    ami                   = var.ami_id
    instance_type         = var.instance_type
    key_name              = var.key_name
    vpc_security_group_ids       = [var.security_group_id]
    # depends_on = [aws_security_group.hugo_sg]

    # User data script to install Nginx and configure it to serve the Hugo website.
    user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y

                # Install Nginx
                sudo amazon-linux-extras enable nginx1
                sudo yum install -y nginx
                sudo systemctl start nginx
                sudo systemctl enable nginx

                # Install Hugo (Manual Binary Installation)
                curl -LO https://github.com/gohugoio/hugo/releases/latest/download/hugo_extended_0.125.3_Linux-64bit.tar.gz
                tar -xvzf hugo_extended_0.125.3_Linux-64bit.tar.gz
                sudo mv hugo /usr/local/bin/
                
                # Verify Hugo installation
                hugo version > /home/ec2-user/hugo_install.log

                EOF
    tags = {
        Name = "Hugo-Documentation-Server"
    }
}