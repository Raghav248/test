environment                   = "test"
region                        = "us-east-1"
account_no                    = "767397862132"
aliases                       = ["mc2test-gf.plymouthrock.com", "mc2-cltest-gf.plymouthrock.com"]
aliases_2                     = ["mctest-gf.plymouthrock.com", "mc-cltest-gf.plymouthrock.com"]
enabled                       = true
http_version                  = "http2"
is_ipv6_enabled               = "true"
price_class                   = "PriceClass_All"
retain_on_delete              = "false"
staging                       = "false"
create_origin_access_identity = true
origin_access_identities = {
  esales_rider_s3_bk = "access-identity-esales-test-gf-dr.s3.amazonaws.com"
}
origin = {
  s3_one = {
    domain_name = "esales-rider-ui-test-gf-dr.s3.us-east-1.amazonaws.com"
    origin_id   = "S3-esales-rider-ui-test-gf-dr"
    s3_origin_config = {
      origin_access_identity = "esales_rider_s3_bk"
    }
  }
  custom_ec = {
    domain_name = "es-cltest-gf.plymouthrock.com"
    origin_id   = "custom-ectest-gf.plymouthrock.com"
    custom_origin_config = {
      https_port           = 443
      origin_ssl_protocols = ["TLSv1"]
    }
  }
  custom_es = {
    domain_name = "estest-gf.plymouthrock.com"
    origin_id   = "custom-estest-gf.plymouthrock.com"
    custom_origin_config = {
      https_port           = 443
      origin_ssl_protocols = ["TLSv1"]
    }
  }
  esales_rider_maintenance_pages = {
    origin_id   = "esales-rider-maintenance-pages"
    domain_name = "www.plymouthrock.com"
    origin_path = "/utility/maintenance"
    custom_origin_config = {
      http_port = 80
    }
  }
}

viewer_certificate = {
  acm_certificate_arn            = "arn:aws:acm:us-east-1:767397862132:certificate/43de728e-d920-4472-815f-e1b8e835b2d3"
  cloudfront_default_certificate = "false"
  minimum_protocol_version       = "TLSv1.2_2021"
  ssl_support_method             = "sni-only"
}

web_acl_id = "arn:aws:wafv2:us-east-1:767397862132:global/webacl/Default-WAF-Test-CF/77d5f1cc-80ad-4df1-8ce2-778d193f0fcf"

target_origin_id                          = ["S3-esales-rider-ui-test-gf-dr", "esales-rider-maintenance-pages", "custom-ectest-gf.plymouthrock.com"]
target_origin_id_2                        = ["S3-esales-rider-ui-test-gf", "esales-rider-maintenance-pages", "custom-es-cltest-gf.plymouthrock.com"]
viewer_protocol_policy_https_only         = "https-only"
viewer_protocol_policy_allow_all          = "allow-all"
viewer_protocol_policy_redirects_to_https = "redirect-to-https"
compress                                  = false
use_forwarded_values                      = true
allowed_methods                           = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
query_string                              = true
path_pattern                              = ["/xyz/*", "/eway/route/rider2/ws/ui/pdf/multiquote/*", "/eway/route/rider2/ws/ui/esign/getPDFDoc/*", "/eway/route/rider2/ws/ui/esign/pdf/*"]
path_pattern_2                            = ["/xyz/*", "/eway/route/rider/ws/ui/pdf/multiquote/*", "/eway/route/rider/ws/ui/esign/getPDFDoc/*", "/eway/route/rider/ws/ui/esign/pdf/*"]
response_page_path                        = "/index.html"
response_code                             = 200
error_code                                = [403, 404, 500]
header_policy_name                        = "Custom-CORS-and-SecurityHeadersPolicy"
origin_override                           = false
override                                  = false
access_control_max_age_sec                = 31536000
referrer_policy                           = "strict-origin-when-cross-origin"
response_headers_policy_name              = "Custom-CORS-and-SecurityHeadersPolicy"
origin_access_identities_2 = {
  esales_rider_s3_bucket = "access-identity-esales-test-gf.s3.amazonaws.com"
}

origin_2 = {
  s3_bucket = {
    domain_name = "esales-rider-ui-test-gf.s3.us-east-1.amazonaws.com"
    origin_id   = "S3-esales-rider-ui-test-gf"
    s3_origin_config = {
      origin_access_identity = "esales_rider_s3_bucket"
    }
  }
  custom_ec = {
    domain_name = "es-test-gf.plymouthrock.com"
    origin_id   = "custom-ectest-gf.plymouthrock.com"
    custom_origin_config = {
      http_port = 80
    }
  }
  custom_es = {
    domain_name = "es-cltest-gf.plymouthrock.com"
    origin_id   = "custom-es-cltest-gf.plymouthrock.com"
    custom_origin_config = {
      https_port           = 443
      origin_ssl_protocols = ["TLSv1"]
    }
  }
  esales_rider_maintenance_pages = {
    origin_id   = "esales-rider-maintenance-pages"
    domain_name = "www.plymouthrock.com"
    origin_path = "/utility/maintenance/?"
    custom_origin_config = {
      http_port = 80
    }
  }
}
