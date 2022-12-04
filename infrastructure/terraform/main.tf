terraform {
  required_version = "~> 1.2.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.41.0"
    }
  }

  backend "s3" {
    bucket = "terraform-state-20221128202702577300000001"
    key    = "react-frontend/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project   = "React-GithubActions"
      CreatedBy = "Terraform"
    }
  }
}






