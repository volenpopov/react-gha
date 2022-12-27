locals {
  account_id = data.aws_caller_identity.this.account_id

  bucket_prefix = "terraform-state-"

  cicd_worker_prefix = "github-actions-cicd-"

  dynamodb_table_name = "terraform-state"

  # TODO: insert your github username below
  github_username = ""

  github_oidc_provider     = "token.actions.githubusercontent.com"
  github_oidc_provider_url = "https://${local.github_oidc_provider}"

  oidc_audience = "sts.amazonaws.com"

  # TODO: insert your repository name below
  repo_name = ""
}
