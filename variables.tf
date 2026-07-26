variable "aws_region" {
  description = "Target AWS region for infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "Base CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "alert_email" {
  description = "Email address for billing and security alerts"
  type        = string
  sensitive   = true
}