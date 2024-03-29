variable "name" {
  type        = string
  default     = "app"
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "es_version" {
  type        = string
  description = "Version of Elasticsearch to deploy (default 6.3)"
  default     = "6.3"
}

variable "instance_type" {
  type        = string
  description = "ES instance type for data nodes in the cluster (default t2.small.elasticsearch)"
  default     = "t2.small.elasticsearch"
}

variable "instance_count" {
  type        = string
  description = "Number of data nodes in the cluster (default 3)"
  default     = 3
}

variable "dedicated_master_type" {
  type        = string
  description = "ES instance type to be used for dedicated masters (default same as instance_type)"
  default     = false
}

variable "encrypt_at_rest" {
  type        = string
  description = "Enable encrption at rest (only specific instance family types support it: m4, c4, r4, i2, i3 default: false)"
  default     = false
}

variable "es_zone_awareness" {
  type        = string
  description = "Enable zone awareness for Elasticsearch cluster (default false)"
  default     = "false"
}

variable "ebs_volume_size" {
  type        = string
  description = "Optionally use EBS volumes for data storage by specifying volume size in GB (default 10)"
  default     = 10
}

variable "ebs_volume_type" {
  type        = string
  description = "Storage type of EBS volumes, if used (default gp2)"
  default     = "gp2"
}

variable "kms_key_id" {
  type        = string
  description = "KMS key used for elasticsearch"
  default     = ""
}

variable "node_to_node_encryption_enabled" {
  type        = string
  default     = "true"
  description = "Whether to enable node-to-node encryption"
}

variable "snapshot_start_hour" {
  type        = string
  description = "Hour at which automated snapshots are taken, in UTC (default 0)"
  default     = 0
}

variable "log_publishing_index_enabled" {
  type        = string
  default     = "false"
  description = "Specifies whether log publishing option for INDEX_SLOW_LOGS is enabled or not"
}

variable "log_publishing_search_enabled" {
  type        = string
  default     = "false"
  description = "Specifies whether log publishing option for SEARCH_SLOW_LOGS is enabled or not"
}

variable "log_publishing_application_enabled" {
  type        = string
  default     = "false"
  description = "Specifies whether log publishing option for ES_APPLICATION_LOGS is enabled or not"
}

variable "advanced_options" {
  type        = map(string)
  default     = {}
  description = "Key-value string pairs to specify advanced configuration options"
}

variable "tags" {
  description = "tags to apply to all resources"
  type        = map(string)
  default     = {}
}

/* Not creating Route53 entries currently
variable "dns_zone_id" {
  type        = "string"
  default     = ""
  description = "Route53 DNS Zone ID to add hostname records for Elasticsearch domain and Kibana"
}
*/
