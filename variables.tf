variable "region" {
  type = string
}

variable "account_no" {
  type = string
}

variable "environment" {
  type = string
}

variable "tags" {
  type    = map(any)
  default = {}
}

######################
### Cloudfront
######################
variable "aliases" {
  description = "A list of aliases for the distribution"
  type        = list(string)
}
variable "aliases_2" {
  description = "A list of aliases for the distribution"
  type        = list(string)
}

variable "origin_access_identities" {
  description = "Map of CloudFront origin access identities (value as a comment)"
  type        = map(string)
  default     = {}
}
variable "origin_access_identities_2" {
  description = "Map of CloudFront origin access identities (value as a comment)"
  type        = map(string)
  default     = {}
}

variable "default_root_object" {
  description = "The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  type        = string
  default     = null
}

variable "enabled" {
  description = "Whether the distribution is enabled"
  type        = bool
}

variable "http_version" {
  description = "The HTTP version to use"
  type        = string
}

variable "is_ipv6_enabled" {
  description = "Whether IPv6 is enabled"
  type        = bool
}

variable "retain_on_delete" {
  description = "Whether to retain the distribution on delete"
  type        = bool
}

variable "staging" {
  description = "Whether the distribution is a staging distribution."
  type        = bool
  default     = false
}
variable "create_origin_access_identity" {
  description = "Controls if CloudFront origin access identity should be created"
  type        = bool
  default     = false
}

variable "origin" {
  description = "One or more origins for this distribution (multiples allowed)."
  type        = any
  default     = null
}
variable "origin_2" {
  description = "One or more origins for this distribution (multiples allowed)."
  type        = any
  default     = null
}

variable "price_class" {
  description = "The price class for the distribution"
  type        = string
}

variable "viewer_certificate" {
  description = "The SSL configuration for this distribution"
  type        = any
  default = {
    cloudfront_default_certificate = true
    minimum_protocol_version       = "TLSv1"
  }
}

variable "web_acl_id" {
  description = "The ID of the WAF web ACL to associate with the distribution"
  type        = string
}
variable "custom_error_response" {
  description = "One or more custom error response elements"
  type        = any
  default     = {}
}
variable "target_origin_id" {
  type = list(string)
}
variable "target_origin_id_2" {
  type = list(string)
}
variable "viewer_protocol_policy_https_only" {
  type = string
}
variable "viewer_protocol_policy_allow_all" {
  type = string
}
variable "viewer_protocol_policy_redirects_to_https" {
  type = string
}
variable "compress" {
  type = bool
}
variable "use_forwarded_values" {
  type = bool
}
variable "allowed_methods" {
  type = list(string)
}
variable "query_string" {
  type = bool
}
variable "path_pattern" {
  type = list(string)
}
variable "path_pattern_2" {
  type = list(string)
}
variable "response_page_path" {
  type = string
}
variable "response_code" {
  type = number
}
variable "error_code" {
  type = list(number)
}
variable "header_policy_name" {
  type = string
}
variable "origin_override" {
  type = bool
}
variable "override" {
  type = bool
}
variable "access_control_max_age_sec" {
  type = number
}
variable "referrer_policy" {
  type = string
}
variable "response_headers_policy_name" {
  type = string
}
