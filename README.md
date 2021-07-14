This module is used to created an AWS Elasticsearch Domain per environment (workspace).

A default read and write policy are created and the ARN of each is outputted.
When possible, create more restrictive policies (per index) for security.

IAM roles and users are not created by this module like many other similar modules. All IAM access should be assigned to users (separately outside of the module), not via the ES domain.

Note: Name must start with a lowercase alphabet and be at least 3 and no more than 28 characters long. Valid characters are a-z (lowercase letters), 0-9, and - (hyphen).

## Modules

| Name | Source | Version |
|------|--------|---------|
| label | [github.com/mitlibraries/tf-mod-name](https://github.com/mitlibraries/tf-mod-name) | 0.13 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| advanced\_options | Key-value string pairs to specify advanced configuration options | map | `<map>` | no |
| dedicated\_master\_type | ES instance type to be used for dedicated masters (default same as instance_type) | string | `false` | no |
| ebs\_volume\_size | Optionally use EBS volumes for data storage by specifying volume size in GB (default 10) | string | `10` | no |
| ebs\_volume\_type | Storage type of EBS volumes, if used (default gp2) | string | `gp2` | no |
| encrypt\_at\_rest | Enable encrption at rest (only specific instance family types support it: m4, c4, r4, i2, i3 default: false) | string | `false` | no |
| es\_version | Version of Elasticsearch to deploy (default 6.3) | string | `6.3` | no |
| es\_zone\_awareness | Enable zone awareness for Elasticsearch cluster (default false) | string | `false` | no |
| instance\_count | Number of data nodes in the cluster (default 3) | string | `3` | no |
| instance\_type | ES instance type for data nodes in the cluster (default t2.small.elasticsearch) | string | `t2.small.elasticsearch` | no |
| kms\_key\_id | KMS key used for elasticsearch | string | `` | no |
| log\_publishing\_application\_enabled | Specifies whether log publishing option for ES_APPLICATION_LOGS is enabled or not | string | `false` | no |
| log\_publishing\_index\_enabled | Specifies whether log publishing option for INDEX_SLOW_LOGS is enabled or not | string | `false` | no |
| log\_publishing\_search\_enabled | Specifies whether log publishing option for SEARCH_SLOW_LOGS is enabled or not | string | `false` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | string | `app` | no |
| node\_to\_node\_encryption\_enabled | Whether to enable node-to-node encryption | string | `true` | no |
| snapshot\_start\_hour | Hour at which automated snapshots are taken, in UTC (default 0) | string | `0` | no |
| tags | tags to apply to all resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Amazon Resource Name (ARN) of the domain |
| domain\_hostname | Elasticsearch domain hostname to submit index, search, and data upload requests |
| domain\_id | Unique identifier for the domain |
| domain\_name | Domain name of cluster |
| endpoint | Domain-specific endpoint used to submit index, search, and data upload requests |
| read\_policy\_arn | Default domain read only policy ARN |
| write\_policy\_arn| Default domain write policy ARN |
