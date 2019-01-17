output "arn" {
  description = "Amazon Resource Name (ARN) of the domain"
  value       = "${aws_elasticsearch_domain.es.arn}"
}

output "domain_id" {
  description = "Unique identifier for the domain"
  value       = "${aws_elasticsearch_domain.es.domain_id}"
}

output "domain_name" {
  description = "Domain name of cluster"
  value       = "${aws_elasticsearch_domain.es.domain_name}"
}

output "endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests"
  value       = "${aws_elasticsearch_domain.es.endpoint}"
}

output "kibana_endpoint" {
  value       = "${aws_elasticsearch_domain.es.kibana_endpoint}"
  description = "Domain-specific endpoint for Kibana without https scheme"
}

/*
output "domain_hostname" {
  value       = "${aws_route53_record.domain_hostname.name}"
  description = "Elasticsearch domain hostname to submit index, search, and data upload requests"
}

output "kibana_hostname" {
  value       = "${aws_route53_record.kibana_hostname.name}"
  description = "Kibana hostname"
}
*/

