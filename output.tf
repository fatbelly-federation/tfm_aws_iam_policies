###### OUTPUTS ######

# ses_send_mail
output "ses_send_mail_policy_arn" {
  value = "${aws_iam_policy.ses_send_mail.arn}"
}

# s3_full_access
output "s3_full_access_policy_arn" {
  value = "${aws_iam_policy.s3_full_access.arn}"
}

# deny_senstive_services
output "deny_senstive_services_arn" {
  value = "${aws_iam_policy.deny_sestive_services.arn}"
}

# s3_read_only_access
output "s3_read_only_access_arn" {
  value = "${aws_iam_policy.s3_read_only_access.arn}"
}

# s3_read_write_access
output "s3_read_write_access_arn" {
  value = "${aws_iam_policy.s3_read_write_access.arn}"
}

# sqs_read_write
output "sqs_read_write_arn" {
  value = "${aws_iam_policy.sqs_read_write.arn}"
}

