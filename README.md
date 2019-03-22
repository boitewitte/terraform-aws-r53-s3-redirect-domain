# terraform-aws-route53-s3-redirect-domain

Terraform module that creates a Route53 record pointing to a S3 redirect bucket.

## Dependency

Using [`terraform-null-label`](https://github.com/cloudposse/terraform-null-label) from [`CloudPosse`](https://github.com/cloudposse) for naming of bucket.


## Usage

### Simple example

```
module "label" {
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.6.0"
}

module "redirect" {
  context = "${module.label.context}"

  domain_name = "www.example.org"
  zone_name   = "example.org"

  redirect_hostname = "https://www.example.com"
}
```


## Inputs

| Context | Description | Type | Default | Required |
| ------- | ----------- | ---- | ------- | -------- |
| additional_tag_map | Additional tags for appending to each tag map | map | `<map>` | no |
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| context | Default context to use for passing state between label invocations | map | `<map>` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | string | `-` | no |
| enabled | Set to false to prevent the module from creating any resources | string | `true` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | string | `` | no |
| label_order | The naming order of the id output and Name tag | list | `<list>` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | string | `` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | string | `` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | string | `` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | map | `<map>` | no |
| domain_name | Domain name that needs to be redirected | string | - | yes |
| enabled | Set to false to prevent the module from creating any resources | string | `true` | no |
| redirect_hostname | The hostname to which the domain name is redirected | string | - | yes |
| zone_name | The zone name for the `domain_name` | string | - | yes |


## Outputs

| Name | Description | Type |
| ---- | ----------- | ---- |
| record_name | The name of the record. | string |
| record_fqdn | FQDN built using the zone domain and name. | string |
| bucket_id | The name of the bucket. | string |
| bucket_arn | The ARN of the bucket. | string |
| bucket_domain_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. | string |
| bucket_regional_domain_name | The bucket region-specific domain name. The bucket domain name including the region name | string |
| bucket_hosted_zone_id | The Route 53 Hosted Zone ID for this bucket's region. | string |
| bucket_region | The AWS region this bucket resides in. | string |
| bucket_website_endpoint | The website endpoint | string |
| bucket_website_domain | The domain of the website endpoint | string |
