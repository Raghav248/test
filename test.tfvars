environment                   = "test"
region                        = "us-east-1"
account_no                    = "767397862132"
aliases                       = ["ci2test-gf.plymouthrock.com", "mobiletest-gf.plymouthrock.com"]
aliases_2                     = ["citest-gf.pilgrimins.com"]
enabled                       = true
http_version                  = "http2"
is_ipv6_enabled               = "true"
price_class                   = "PriceClass_100"
retain_on_delete              = "false"
staging                       = "false"
create_origin_access_identity = true
origin_access_identities = {
  eservice_ui_test_gf = "eservice-ui-test-gf.s3.amazonaws.com"
}
origin = {
  s3_one = {
    domain_name = "eservice-ui-test-gf.s3.us-east-1.amazonaws.com"
    origin_id   = "S3-eservice-ui-test-gf"
    s3_origin_config = {
      origin_access_identity = "eservice_ui_test_gf"
    }
  }
  custom_agw = {
    domain_name = "agwtest-gf.plymouthrock.com"
    origin_id   = "custom-agwtest-gf.plymouthrock.com"
    custom_origin_config = {
      https_port           = 443
      http_port              = 80
      origin_protocol_policy = "https-only"
      origin_ssl_protocols = ["TLSv1.2"]
    }
  }
  custom_apims = {
    domain_name = "apimstest-gf.plymouthrock.com"
    origin_id   = "custom-apimstest-gf.plymouthrock.com"
    custom_origin_config = {
      https_port           = 443
      http_port              = 80
      origin_protocol_policy = "https-only"
      origin_ssl_protocols = ["TLSv1.2"]
    }
  }
}

viewer_certificate = {
  acm_certificate_arn            = "arn:aws:acm:us-east-1:767397862132:certificate/906a9162-c4dc-4206-b0d2-cd6bb59f1ffa"
  cloudfront_default_certificate = "false"
  minimum_protocol_version       = "TLSv1.2_2021"
  ssl_support_method             = "sni-only"
}

web_acl_id = "arn:aws:wafv2:us-east-1:767397862132:global/webacl/Default-WAF-Test-CF/77d5f1cc-80ad-4df1-8ce2-778d193f0fcf"

target_origin_id                          = ["S3-eservice-ui-test-gf", "custom-agwtest-gf.plymouthrock.com", "custom-apimstest-gf.plymouthrock.com"]
target_origin_id_2                        = ["S3-eservice-ui-test-gf", "custom-apimstest-gf.plymouthrock.com"]
viewer_protocol_policy_https_only         = "https-only"
viewer_protocol_policy_allow_all          = "allow-all"
viewer_protocol_policy_redirects_to_https = "redirect-to-https"
compress                                  = false
use_forwarded_values                      = true
allowed_methods                           = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
query_string                              = true
cookies_forward                           = ["all", "none", "all", "none"]
cookies_forward_cf2                       = ["all", "all", "none"]
event_type                                = ["origin-request", "origin-response"]
lambda_arn                                = ["arn:aws:lambda:us-east-1:xxxxxxxxxx:function:CI_Maintainance_Page_Trigger:1", "arn:aws:lambda:us-east-1:xxxxxxxxxx:function:ci-eservice-response-headers-prod:6"]
cf_log_bucket                             = "aws-accelerator-s3-access-logs-767397862132-us-east-1.s3.amazonaws.com"
cf_prefix                                 = "ci2"
cf2_prefix                                = "pilg"
path_pattern                              = ["/mfe-driver/*", "/rq/*", "/eservice-ws/*"]
path_pattern_2                            = ["/mfe-driver/*", "/eservice-ws/*"]
response_page_path                        = "/index.html"
response_code                             = 200
error_code                                = [403, 404, 500]
response_headers_policy_id                = "e2410abb-ff50-4755-8a9f-f623af192b8d"
origin_access_identities_2 = {
  eservice-ui-test-gf = "eservice-ui-test-gf.s3.amazonaws.com"
}

origin_2 = {
  s3_bucket = {
    domain_name = "eservice-ui-test-gf.s3.us-east-1.amazonaws.com"
    origin_id   = "S3-eservice-ui-test-gf"
    s3_origin_config = {
      origin_access_identity = "eservice-ui-test-gf"
    }
  }
  custom_ec = {
    domain_name = "apimstest-gf.plymouthrock.com"
    origin_id   = "custom-apimstest-gf.plymouthrock.com"
    custom_origin_config = {
      https_port           = 443
      http_port              = 80
      origin_protocol_policy = "https-only"
      origin_ssl_protocols = ["TLSv1.2"]
    }
  }
}

viewer_certificate_cf2 {
  acm_certificate_arn            = "arn:aws:acm:us-east-1:767397862132:certificate/e05daa2c-c5a0-434f-ab21-9bb2ea221a96"
  cloudfront_default_certificate = "false"
  minimum_protocol_version       = "TLSv1.2_2021"
  ssl_support_method             = "sni-only"
}
