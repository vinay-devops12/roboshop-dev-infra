resource "aws_route53_record" "mongodb" {
  zone_id = var.zone_id
  name    = "${var.project}-${var.environment}-${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.mongodb.private_ip]
}