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

    # Automatically deploy Hugo on EC2 launch
    user_data = file("${path.module}/user_data.sh")
    
    tags = {
        Name = "Hugo-Documentation-Server"
    }
}