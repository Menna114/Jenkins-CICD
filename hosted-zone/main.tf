variable "domain_name" {}
variable "aws_lb_dns_name" {}
variable "aws_lb_zone_id" {}

# Create a new Route 53 hosted zone
resource "aws_route53_zone" "dev_proj_zone" {
  name = var.domain_name
}

# Create an A record in the new hosted zone
resource "aws_route53_record" "lb_record" {
  zone_id = aws_route53_zone.dev_proj_zone.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.aws_lb_dns_name
    zone_id                = var.aws_lb_zone_id
    evaluate_target_health = true
  }
}
