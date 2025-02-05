output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.app_alb.dns_name
}

output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.app_distribution.domain_name
}

output "cloudfront_distribution_id" {
  description = "AWS Cloud front distribution ID"
  value       = aws_cloudfront_distribution.app_distribution.id
}