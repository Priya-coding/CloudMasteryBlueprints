##########################################
# ECR MODULE – CloudMasteryBlueprints
# Path: infrastructure/terraform/modules/ecr/main.tf
##########################################

resource "aws_ecr_repository" "cloudmastery_ecr" {
  name                 = "${var.project_name}-hugo-${var.environment}"
  image_tag_mutability = "MUTABLE"  # Allow updates to 'latest' tag (can change to IMMUTABLE)
  force_delete         = true        # Optional: allows repo deletion even with images

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "${var.project_name}-hugo-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_ecr_lifecycle_policy" "expire_old_images" {
  repository = aws_ecr_repository.cloudmastery_ecr.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Expire untagged images after 14 days",
        selection     = {
          tagStatus     = "untagged",
          countType     = "sinceImagePushed",
          countUnit     = "days",
          countNumber   = 14
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
} 
