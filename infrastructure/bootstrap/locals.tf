locals {
  account_id          = data.aws_caller_identity.this.account_id
  bucket_prefix       = "terraform-state-"
  dynamodb_table_name = "terraform-state"
}
