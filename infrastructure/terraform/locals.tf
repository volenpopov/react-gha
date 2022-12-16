locals {
  region = "us-east-1"

  bucket_prefix = "volenpopov-react-app-"

  s3_origin_id = "s3-react-app"

  domain_name   = "volenpopov.click"
  www_subdomain = "www.${local.domain_name}"
}
