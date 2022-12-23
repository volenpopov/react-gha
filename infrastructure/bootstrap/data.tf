data "aws_caller_identity" "this" {}

data "aws_iam_policy_document" "oidc_assume" {
  statement {
    sid = "OIDC"

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.this.arn]
    }

    effect = "Allow"

    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "${local.github_oidc_provider}:aud"

      values = [local.oidc_audience]
    }

    condition {
      test     = "StringLike"
      variable = "${local.github_oidc_provider}:sub"

      values = ["repo:${local.github_username}/${local.repo_name}:*"]
    }
  }
}

data "aws_iam_policy" "poweruser" {
  name = "PowerUserAccess"
}

data "aws_iam_policy_document" "bucket" {
  statement {
    sid = "RestrictPrincipals"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    effect = "Deny"

    actions = ["s3:*"]

    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*",
    ]

    condition {
      test     = "StringNotEquals"
      variable = "aws:PrincipalArn"

      values = [
        "arn:aws:iam::${local.account_id}:root",
        "arn:aws:iam::${local.account_id}:user/admin",
        aws_iam_role.this.arn
      ]
    }
  }
}

