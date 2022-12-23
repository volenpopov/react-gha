resource "aws_iam_openid_connect_provider" "this" {
  url = local.github_oidc_provider_url

  client_id_list = [local.oidc_audience]

  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

resource "aws_iam_role" "this" {
  name_prefix        = local.cicd_worker_prefix
  assume_role_policy = data.aws_iam_policy_document.oidc_assume.json
}

resource "aws_iam_role_policy" "this" {
  name_prefix = local.cicd_worker_prefix
  role        = aws_iam_role.this.id
  policy      = data.aws_iam_policy.poweruser.policy
}
