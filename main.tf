#### KMS Key ##########
resource "aws_kms_key" "this" {
  count                    = var.kms_enabled ? 1 : 0
  description              = format("%s %s", var.description, var.name)
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  policy                   = var.kms_policy
  deletion_window_in_days  = var.deletion_window_in_days
  is_enabled               = var.is_enabled
  #checkov:skip=CKV_AWS_7: ******
  enable_key_rotation      = var.enable_key_rotation
  tags                     = var.tags
  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}

resource "aws_kms_alias" "this" {
  count         = var.kms_enabled ? 1 : 0
  name          = format("alias/%s", var.name)
  target_key_id = join("", aws_kms_key.this.*.key_id)
  lifecycle {
    create_before_destroy = true
  }
}

####### SQS ########

resource "aws_sqs_queue" "this" {
  count = var.create ? 1 : 0

  name = var.name

  visibility_timeout_seconds  = var.visibility_timeout_seconds
  message_retention_seconds   = var.message_retention_seconds
  max_message_size            = var.max_message_size
  delay_seconds               = var.delay_seconds
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  policy                      = var.policy
  redrive_policy              = var.redrive_policy
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication

  kms_master_key_id                 = var.kms_enabled ? aws_kms_key.this[0].key_id : var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds

  tags = var.tags
}
