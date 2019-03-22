output "record_name" {
  value = "${var.enabled ? aws_route53_record.domain.name : ""}"
  description = "The name of the record."
}

output "record_fqdn" {
  value = "${var.enabled ? aws_route53_record.domain.fqdn : ""}"
  description = "FQDN built using the zone domain and name."
}

output "bucket_id" {
  value = "${var.enabled ? aws_s3_bucket.bucket.id : ""}"
  description = "The name of the bucket."
}

output "bucket_arn" {
  value = "${var.enabled ? aws_s3_bucket.bucket.arn : ""}"
  description = "The ARN of the bucket."
}

output "bucket_domain_name " {
  value = "${var.enabled ? aws_s3_bucket.bucket.bucket_domain_name : ""}"
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
}

output "bucket_regional_domain_name" {
  value = "${var.enabled ? aws_s3_bucket.bucket.bucket_regional_domain_name : ""}"
  description = "The bucket region-specific domain name. The bucket domain name including the region name"
}

output "bucket_hosted_zone_id" {
  value = "${var.enabled ? aws_s3_bucket.bucket.hosted_zone_id : ""}"
  description = "The Route 53 Hosted Zone ID for this bucket's region."
}

output "bucket_region" {
  value = "${var.enabled ? aws_s3_bucket.bucket.region : ""}"
  description = "The AWS region this bucket resides in."
}

output "bucket_website_endpoint" {
  value = "${var.enabled ? aws_s3_bucket.bucket.website_endpoint : ""}"
  description = "The website endpoint"
}

output "bucket_website_domain" {
  value = "${var.enabled ? aws_s3_bucket.bucket.website_domain : ""}"
  description = "The domain of the website endpoint"
}
