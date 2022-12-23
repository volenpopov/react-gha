terraform {
  required_version = "~> 1.2.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.41.0"
    }
  }

  # backend "s3" {
  #   key = "terraform-s3-backend-infrastructure/terraform.tfstate"
  # }
}

provider "aws" {
  region = "us-east-1"
}





