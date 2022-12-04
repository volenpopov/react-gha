data "aws_cloudfront_cache_policy" "this" {
  name = "Managed-CachingOptimized"
}

data "aws_route53_zone" "this" {
  name         = local.domain_name
  private_zone = false
}

#######################
# S3 Bucket policy
#######################
data "aws_iam_policy_document" "bucket" {
  statement {
    sid = "AllowCloudFrontServicePrincipal"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion"
    ]

    resources = ["${aws_s3_bucket.this.arn}/*"]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"

      values = [aws_cloudfront_distribution.this.arn]
    }
  }
}
