locals {
  enabled = "${var.enabled && var.redirect_hostname != "" && var.domain_name != "" ? true : false}"
}

module "label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.6.0"

  enabled     = "${local.enabled}"

  name        = "${var.domain_name}"

  context     = "${var.context}"

  attributes  = ["${list(var.redirect_hostname, "redirect")}"]
}

data "aws_route53_zone" "domain" {
  count           = "${local.enabled ? 1 : 0}"

  name            = "${var.zone_name}"
  private_zone    = false
}

resource "aws_s3_bucket" "bucket" {
  count       = "${local.enabled ? 1 : 0}"

  bucket      = "${replace(module.label.id, ".", "-")}"
  acl         = "public"

  website {
    redirect_all_requests_to = "${var.redirect_hostname}"
  }

  tags        = "${var.tags}"
}

resource "aws_route53_record" "domain" {
  count   = "${local.enabled ? 1 : 0}"

  type    = "A"

  zone_id = "${element(data.aws_route53_zone.domain.*.id, count.index)}"

  name    = "${var.domain_name}"

  alias {
    name    = "${element(aws_s3_bucket.bucket.*.website_domain, count.index)}"
    zone_id = "${element(aws_s3_bucket.bucket.*.hosted_zone_id, count.index)}"
    evaluate_target_health = false
  }
}
