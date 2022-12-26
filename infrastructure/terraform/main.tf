terraform {
  required_version = "~> 1.2.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.41.0"
    }
  }

  backend "s3" {
    # TODO: after bootstrap completion update the bucket property below with the bucket name from the bootstrap phase
    bucket = "terraform-state-20221226091321459900000001"
    key    = "react-app/terraform.tfstate"
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






