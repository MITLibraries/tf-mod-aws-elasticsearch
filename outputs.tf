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
  description = "Domain-specific endpoint for Kibana without https scheme"
  value       = "${aws_elasticsearch_domain.es.kibana_endpoint}"
}

output "read_policy_arn" {
  description = "Default domain read only policy ARN"
  value       = "${aws_iam_policy.read.arn}"
}

output "write_policy_arn" {
  description = "Default domain write policy ARN"
  value       = "${aws_iam_policy.write.arn}"
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

