################################
# OUTPUT VARIABLES FOR ECR
################################

output "ecr_repository_url" {
  description = "The URL of the created ECR repository"
  value       = aws_ecr_repository.cloudmastery_ecr.repository_url
}

output "ecr_repository_name" {
  description = "The name of the ECR repository"
  value       = aws_ecr_repository.cloudmastery_ecr.name
}

output "ecr_repository_id" {
  description = "The ID of the ECR repository"
  value       = aws_ecr_repository.cloudmastery_ecr.registry_id
}