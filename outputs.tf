output "record_name" {
  value       = "${var.enabled ? element(aws_route53_record.domain.*.name, 0) : ""}"
  description = "The name of the record."
}

output "record_fqdn" {
  value       = "${var.enabled ? element(aws_route53_record.domain.*.fqdn, 0) : ""}"
  description = "FQDN built using the zone domain and name."
}

output "bucket_id" {
  value       = "${local.enabled ? element(aws_s3_bucket.bucket.*.id, 0) : ""}"
  description = "The name of the bucket"
}

output "bucket_arn" {
  value       = "${local.enabled ? element(aws_s3_bucket.bucket.*.arn, 0) : ""}"
  description = "The ARN of the bucket"
}

output "bucket_domain_name " {
  value       = "${local.enabled ? element(aws_s3_bucket.bucket.*.bucket_domain_name, 0) : ""}"
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
}

output "bucket_regional_domain_name" {
  value       = "${local.enabled ? element(aws_s3_bucket.bucket.*.bucket_regional_domain_name, 0) : ""}"
  description = "The bucket region-specific domain name. The bucket domain name including the region name"
}

output "bucket_hosted_zone_id" {
  value       = "${local.enabled ? element(aws_s3_bucket.bucket.*.hosted_zone_id, 0) : ""}"
  description = "The Route 53 Hosted Zone ID for this bucket's region."
}

output "bucket_region" {
  value       = "${local.enabled ? element(aws_s3_bucket.bucket.*.region, 0) : ""}"
  description = "The AWS region this bucket resides in."
}

output "bucket_website_endpoint" {
  value       = "${local.enabled ? element(aws_s3_bucket.bucket.*.website_endpoint, 0) : ""}"
  description = "The website endpoint"
}

output "bucket_website_domain" {
  value       = "${local.enabled ? element(aws_s3_bucket.bucket.*.website_domain, 0) : ""}"
  description = "The domain of the website endpoint"
}
