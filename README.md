# Terraform Module for AWS SQS

## Using as Module

KMS Enabled

```hcl
module "sqsexample" {
   source = "../"
   name = var.name
   tags = var.tags
}
```

Without KMS

```hcl
module "sqsexample" {
   source = "../"
   name = var.name
   kms_enabled = false
   tags = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| aws  | n/a     |

## Inputs

| Name                              | Description                                                                                                                                                                                                                                                                                                           | Type          | Default               | Required |
| --------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------- | --------------------- | :------: |
| content_based_deduplication       | Enables content-based deduplication for FIFO queues                                                                                                                                                                                                                                                                   | `bool`        | `false`               |    no    |
| create                            | Whether to create SQS queue                                                                                                                                                                                                                                                                                           | `bool`        | `true`                |    no    |
| customer_master_key_spec          | Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1. Defaults to SYMMETRIC_DEFAULT | `string`      | `"SYMMETRIC_DEFAULT"` |    no    |
| delay_seconds                     | The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes)                                                                                                                                                                                             | `number`      | `0`                   |    no    |
| deletion_window_in_days           | Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days.                                                                                                                                                                                | `number`      | `30`                  |    no    |
| description                       | The description of the key as viewed in AWS console.                                                                                                                                                                                                                                                                  | `string`      | `"SQS: KMS Key for"`  |    no    |
| enable_key_rotation               | Specifies whether key rotation is enabled. Defaults to false                                                                                                                                                                                                                                                          | `bool`        | `false`               |    no    |
| fifo_queue                        | Boolean designating a FIFO queue                                                                                                                                                                                                                                                                                      | `bool`        | `false`               |    no    |
| is_enabled                        | Specifies whether the key is enabled. Defaults to true.                                                                                                                                                                                                                                                               | `bool`        | `true`                |    no    |
| key_usage                         | Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT or SIGN_VERIFY. Defaults to ENCRYPT_DECRYPT.                                                                                                                                                                                                     | `string`      | `"ENCRYPT_DECRYPT"`   |    no    |
| kms_data_key_reuse_period_seconds | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours)                                                                                   | `number`      | `300`                 |    no    |
| kms_enabled                       | Do you want to Enable KMS key for SQS                                                                                                                                                                                                                                                                                 | `bool`        | `true`                |    no    |
| kms_master_key_id                 | The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK                                                                                                                                                                                                                                     | `string`      | `null`                |    no    |
| kms_policy                        | A valid KMS policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy.                                             | `string`      | `""`                  |    no    |
| max_message_size                  | The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB)                                                                                                                                                                       | `number`      | `262144`              |    no    |
| message_retention_seconds         | The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days)                                                                                                                                                                                             | `number`      | `345600`              |    no    |
| name                              | This is the human-readable name of the queue. If omitted, Terraform will assign a random name.                                                                                                                                                                                                                        | `string`      | `null`                |    no    |
| policy                            | The JSON policy for the SQS queue                                                                                                                                                                                                                                                                                     | `string`      | `""`                  |    no    |
| receive_wait_time_seconds         | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds)                                                                                                                                                                         | `number`      | `0`                   |    no    |
| redrive_policy                    | The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string ("5")                                                                                                                                                   | `string`      | `""`                  |    no    |
| tags                              | A mapping of tags to assign to all resources                                                                                                                                                                                                                                                                          | `map(string)` | `{}`                  |    no    |
| visibility_timeout_seconds        | The visibility timeout for the queue. An integer from 0 to 43200 (12 hours)                                                                                                                                                                                                                                           | `number`      | `30`                  |    no    |

## Outputs

| Name               | Description                                     |
| ------------------ | ----------------------------------------------- |
| arn                | The ARN of the SQS queue                        |
| id                 | The URL for the created Amazon SQS queue        |
| kmd_arn            | The Amazon Resource Name(ARN) of the key alias. |
| kmd_key_id         | The globally unique identifier for the key.     |
| kmd_target_key_arn | ARN pointed to by the alias.                    |
| kmd_target_key_id  | Key identifier pointed to by the alias.         |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
