#######################
# S3 Bucket policy
#######################
data "aws_iam_policy_document" "bucket" {
  statement {
    sid = "PublicRead"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion"
    ]

    resources = ["${aws_s3_bucket.this.arn}/*"]
  }
}
