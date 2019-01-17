module "label" {
  source = "git::https://github.com/mitlibraries/tf-mod-name?ref=master"
  name   = "${var.name}"
  tags   = "${var.tags}"
}

# Elasticsearch domain

resource "aws_elasticsearch_domain" "es" {
  domain_name           = "${module.label.name}"
  elasticsearch_version = "${var.es_version}"
  advanced_options      = "${var.advanced_options}"

  cluster_config {
    instance_type            = "${var.instance_type}"
    instance_count           = "${var.instance_count}"
    dedicated_master_enabled = "${var.instance_count >= 10 ? true : false}"
    dedicated_master_count   = "${var.instance_count >= 10 ? 3 : 0}"
    dedicated_master_type    = "${var.instance_count >= 10 ? (var.dedicated_master_type != "false" ? var.dedicated_master_type : var.instance_type) : ""}"
    zone_awareness_enabled   = "${var.es_zone_awareness}"
  }

  ebs_options {
    ebs_enabled = "${var.ebs_volume_size > 0 ? true : false}"
    volume_size = "${var.ebs_volume_size}"
    volume_type = "${var.ebs_volume_type}"
  }

  encrypt_at_rest {
    enabled    = "${var.encrypt_at_rest}"
    kms_key_id = "${var.kms_key_id}"
  }

  snapshot_options {
    automated_snapshot_start_hour = "${var.snapshot_start_hour}"
  }

  node_to_node_encryption {
    enabled = "${var.node_to_node_encryption_enabled}"
  }

  log_publishing_options {
    enabled                  = "${var.log_publishing_index_enabled }"
    log_type                 = "INDEX_SLOW_LOGS"
    cloudwatch_log_group_arn = "${var.log_publishing_index_cloudwatch_log_group_arn}"
  }

  log_publishing_options {
    enabled                  = "${var.log_publishing_search_enabled }"
    log_type                 = "SEARCH_SLOW_LOGS"
    cloudwatch_log_group_arn = "${var.log_publishing_search_cloudwatch_log_group_arn}"
  }

  log_publishing_options {
    enabled                  = "${var.log_publishing_application_enabled }"
    log_type                 = "ES_APPLICATION_LOGS"
    cloudwatch_log_group_arn = "${var.log_publishing_application_cloudwatch_log_group_arn}"
  }

  tags = "${module.label.tags}"
}

/* Ignore creating Route53 entries for now
    1. We aren't using kibana
    2. We can't use our own certificate with an AWS ES domain endpoint

  resource "aws_route53_record" "domain_hostname" {
  name    = "${module.label.name}"
  ttl     = 300
  type    = "CNAME"
  zone_id = "${var.dns_zone_id}"
  records = ["${aws_elasticsearch_domain.es.*.endpoint}"]
}

resource "aws_route53_record" "kibana_hostname" {
  name    = "kibana-${module.label.name}"
  ttl     = 300
  type    = "CNAME"
  zone_id = "${var.dns_zone_id}"
  records = ["${aws_elasticsearch_domain.es.kibana_endpoint}"]
}
*/

