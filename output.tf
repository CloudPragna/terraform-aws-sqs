output "kmd_arn" {
  description = "The Amazon Resource Name(ARN) of the key alias."
  value       = join("", aws_kms_key.this.*.arn)
}

output "kmd_key_id" {
  description = "The globally unique identifier for the key."
  value       = join("", aws_kms_key.this.*.key_id)
}
output "kmd_target_key_id" {
  description = "Key identifier pointed to by the alias."
  value       = join("", aws_kms_alias.this.*.target_key_id)
}

output "kmd_target_key_arn" {
  description = "ARN pointed to by the alias."
  value       = join("", aws_kms_alias.this.*.target_key_arn)
}

output "id" {
  description = "The URL for the created Amazon SQS queue"
  value       = aws_sqs_queue.this[0].id
}

output "arn" {
  description = "The ARN of the SQS queue"
  value       = aws_sqs_queue.this[0].arn
}
