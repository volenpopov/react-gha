terraform {
  required_version = "~> 1.2.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.41.0"
    }
  }

  backend "s3" {
    key = "terraform-s3-backend-infrastructure/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "this" {}

locals {
  account_id          = data.aws_caller_identity.this.account_id
  bucket_prefix       = "terraform-state-"
  dynamodb_table_name = "terraform-state"
}




