variable "context" {
  type        = "map"
  description = "Context for the label"
  default     = {}
}


variable "domain_name" {
  type        = "string"
  description = "Domain name"
}

variable "enabled" {
  description = "Module is enabled"

  default = true
}

variable "redirect_hostname" {
  type        = "string"
  description = "Redirect Domain name to Redirect Hostname"
}

variable "zone_name" {
  type        = "string"
  description = "Zone name for the Domain name"
}


