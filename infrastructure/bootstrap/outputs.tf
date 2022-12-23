output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}

output "cicd_role_arn" {
  value = aws_iam_role.this.arn
}
