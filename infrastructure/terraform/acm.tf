resource "aws_acm_certificate" "this" {
  domain_name               = local.domain_name
  validation_method         = "DNS"
  subject_alternative_names = ["*.${local.domain_name}"]
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [for record in aws_route53_record.acm_validation : record.fqdn]
}
