variable "context" {
  type        = "map"
  description = "Context for the label"
  default     = {}
}

variable "domain_name" {
  type        = "string"
  description = "Domain name that needs to be redirected"
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"

  default = true
}

variable "redirect_hostname" {
  type        = "string"
  description = "The hostname to which the domain name is redirected"
}

variable "zone_name" {
  type        = "string"
  description = "Zone name for the domain_name"
}
