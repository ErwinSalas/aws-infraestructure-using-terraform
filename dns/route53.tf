resource "aws_route53_zone" "main" {
  name = var.domain

  lifecycle {
    # prevent_destroy = true
    ignore_changes  = [
			tags
		]
  }
}
resource "aws_route53_record" "webpage" {
  zone_id =  aws_route53_zone.main.zone_id
  name    = "${var.lab_name}.${var.domain}"
  type    = "CNAME"
  ttl     = 60
  records = [var.webserver_alb.dns_name]
}
