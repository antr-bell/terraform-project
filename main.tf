terraform {
  required_version = ">= 1.5.0"

  cloud {
    organization = "tray-cloud-portfolio"

    workspaces {
      name = "terraform-project"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.56.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      ManagedBy   = "Terraform"
      Project     = "HCP-Drift-Detection"
    }
  }
}
