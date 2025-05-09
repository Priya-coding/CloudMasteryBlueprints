variable "project_name" {
  description = "Project name for tagging and naming"
  type        = string
}

variable "iam_user_name" {
  description = "IAM user to attach the ECR policy to"
  type        = string
}
