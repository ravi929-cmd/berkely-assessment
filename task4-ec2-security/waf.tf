resource "aws_wafv2_web_acl" "app_waf" {
  name        = "aspnet-app-waf"
  scope       = "CLOUDFRONT"
  description = "WAF for ASP.NET application"

  default_action {
    allow {}
  }

  rule {
    name     = "AWS-AWSManagedRulesCommonRuleSet"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesCommonRuleSet"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "aspnet-app-waf"
    sampled_requests_enabled   = true
  }

  tags = {
    Name = "aspnet-app-waf"
  }
}