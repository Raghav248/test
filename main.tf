module "cloudfront" {
  depends_on                    = [aws_cloudfront_response_headers_policy.response_header_policy]
  source                        = "github.com/prac-CloudEngineering/aws-terraform-modules//common/cloudfront"
  aliases                       = var.aliases
  default_root_object           = var.default_root_object
  enabled                       = var.enabled
  http_version                  = var.http_version
  is_ipv6_enabled               = var.is_ipv6_enabled
  price_class                   = var.price_class
  retain_on_delete              = var.retain_on_delete
  staging                       = var.staging
  create_origin_access_identity = var.create_origin_access_identity
  origin_access_identities      = var.origin_access_identities
  origin                        = var.origin
  default_cache_behavior = {
    target_origin_id           = var.target_origin_id[0]
    allowed_methods            = var.allowed_methods
    compress                   = var.compress
    viewer_protocol_policy     = var.viewer_protocol_policy_redirects_to_https
    use_forwarded_values       = var.use_forwarded_values
    response_headers_policy_id = aws_cloudfront_response_headers_policy.response_header_policy.etag
    query_string               = var.query_string
    smooth_streaming           = false
    cookies = {
      forward = "all"
    }
  }

  ordered_cache_behavior = [
    {
      path_pattern           = var.path_pattern[0]
      target_origin_id       = var.target_origin_id[1]
      viewer_protocol_policy = var.viewer_protocol_policy_allow_all
      allowed_methods        = ["GET", "HEAD"]

      use_forwarded_values = var.use_forwarded_values
      query_string         = var.query_string
      custom_headers       = ["*"]
      cookies = {
        forward = "all"
      }
      response_headers_policy_name = var.response_headers_policy_name
    },
    {
      path_pattern           = var.path_pattern[1]
      target_origin_id       = var.target_origin_id[2]
      viewer_protocol_policy = var.viewer_protocol_policy_https_only
      allowed_methods        = var.allowed_methods

      use_forwarded_values = var.use_forwarded_values
      query_string         = var.query_string
      custom_headers       = ["*"]
      cookies = {
        forward = "all"
      }
      response_headers_policy_name = var.response_headers_policy_name
    },
    {
      path_pattern           = var.path_pattern[2]
      target_origin_id       = var.target_origin_id[2]
      viewer_protocol_policy = var.viewer_protocol_policy_https_only
      allowed_methods        = var.allowed_methods

      use_forwarded_values = var.use_forwarded_values
      query_string         = var.query_string
      custom_headers       = ["*"]
      cookies = {
        forward = "all"
      }
      response_headers_policy_name = var.response_headers_policy_name
    },
    {
      path_pattern           = var.path_pattern[3]
      target_origin_id       = var.target_origin_id[2]
      viewer_protocol_policy = var.viewer_protocol_policy_https_only
      allowed_methods        = var.allowed_methods

      use_forwarded_values = var.use_forwarded_values
      query_string         = var.query_string
      custom_headers       = ["*"]
      cookies = {
        forward = "all"
      }
      response_headers_policy_name = var.response_headers_policy_name
    }
  ]
  custom_error_response = [{
    error_code            = var.error_code[0]
    response_code         = var.response_code
    error_caching_min_ttl = 5
    response_page_path    = var.response_page_path
    }, {
    error_code            = var.error_code[1]
    response_code         = var.response_code
    error_caching_min_ttl = 5
    response_page_path    = var.response_page_path
    }, {
    error_code            = var.error_code[2]
    response_code         = var.response_code
    error_caching_min_ttl = 5
    response_page_path    = var.response_page_path
  }]
  viewer_certificate = var.viewer_certificate
  web_acl_id         = var.web_acl_id
  tags               = local.tags
}


resource "aws_cloudfront_response_headers_policy" "response_header_policy" {
  name    = var.header_policy_name
  comment = "custom header response policy"

  cors_config {
    access_control_allow_credentials = false

    access_control_allow_headers {
      items = ["*"]
    }

    access_control_allow_methods {
      items = ["ALL"]
    }

    access_control_allow_origins {
      items = ["*"]
    }

    origin_override = var.origin_override
  }
  security_headers_config {

    strict_transport_security {
      access_control_max_age_sec = var.access_control_max_age_sec
      override                   = var.override
      include_subdomains         = true
    }
    content_type_options {
      override = true
    }
    frame_options {
      frame_option = "SAMEORIGIN"
      override     = var.override
    }
    xss_protection {
      protection = true
      override   = var.override
      mode_block = true
    }
    referrer_policy {
      referrer_policy = var.referrer_policy
      override        = var.override
    }
  }
}

module "cloudfront_2" {
  depends_on                    = [aws_cloudfront_response_headers_policy.response_header_policy]
  source                        = "github.com/prac-CloudEngineering/aws-terraform-modules//common/cloudfront"
  aliases                       = var.aliases_2
  default_root_object           = var.default_root_object
  enabled                       = var.enabled
  http_version                  = var.http_version
  is_ipv6_enabled               = var.is_ipv6_enabled
  price_class                   = var.price_class
  retain_on_delete              = var.retain_on_delete
  staging                       = var.staging
  create_origin_access_identity = var.create_origin_access_identity
  origin_access_identities      = var.origin_access_identities_2
  origin                        = var.origin_2
  default_cache_behavior = {
    target_origin_id           = var.target_origin_id_2[0]
    allowed_methods            = var.allowed_methods
    compress                   = var.compress
    viewer_protocol_policy     = var.viewer_protocol_policy_redirects_to_https
    use_forwarded_values       = var.use_forwarded_values
    response_headers_policy_id = aws_cloudfront_response_headers_policy.response_header_policy.etag
    query_string               = var.query_string
    smooth_streaming           = false
    cookies = {
      forward = "all"
    }
  }

  ordered_cache_behavior = [
    {
      path_pattern           = var.path_pattern_2[0]
      target_origin_id       = var.target_origin_id_2[1]
      viewer_protocol_policy = var.viewer_protocol_policy_https_only
      allowed_methods        = ["GET", "HEAD"]

      use_forwarded_values = var.use_forwarded_values
      query_string         = var.query_string
      custom_headers       = ["*"]
      cookies = {
        forward = "all"
      }
      response_headers_policy_name = var.response_headers_policy_name
    },
    {
      path_pattern           = var.path_pattern_2[1]
      target_origin_id       = var.target_origin_id_2[2]
      viewer_protocol_policy = var.viewer_protocol_policy_https_only
      allowed_methods        = var.allowed_methods

      use_forwarded_values = var.use_forwarded_values
      query_string         = var.query_string
      custom_headers       = ["*"]
      cookies = {
        forward = "all"
      }
      response_headers_policy_name = var.response_headers_policy_name
    },
    {
      path_pattern           = var.path_pattern[2]
      target_origin_id       = var.target_origin_id[2]
      viewer_protocol_policy = var.viewer_protocol_policy_https_only
      allowed_methods        = var.allowed_methods

      use_forwarded_values = var.use_forwarded_values
      query_string         = var.query_string
      custom_headers       = ["*"]
      cookies = {
        forward = "all"
      }
      response_headers_policy_name = var.response_headers_policy_name
    },
    {
      path_pattern           = var.path_pattern[3]
      target_origin_id       = var.target_origin_id[2]
      viewer_protocol_policy = var.viewer_protocol_policy_https_only
      allowed_methods        = var.allowed_methods

      use_forwarded_values = var.use_forwarded_values
      query_string         = var.query_string
      custom_headers       = ["*"]
      cookies = {
        forward = "all"
      }
      response_headers_policy_name = var.response_headers_policy_name
    }
  ]
  custom_error_response = [{
    error_code            = var.error_code[0]
    response_code         = var.response_code
    error_caching_min_ttl = 5
    response_page_path    = var.response_page_path
    }, {
    error_code            = var.error_code[1]
    response_code         = var.response_code
    error_caching_min_ttl = 5
    response_page_path    = var.response_page_path
    }, {
    error_code            = var.error_code[2]
    response_code         = var.response_code
    error_caching_min_ttl = 5
    response_page_path    = var.response_page_path
  }]
  viewer_certificate = var.viewer_certificate
  web_acl_id         = var.web_acl_id
  tags               = local.tags
}
