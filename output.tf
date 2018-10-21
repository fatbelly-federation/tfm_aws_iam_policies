###### OUTPUTS ######

# ses_send_mail
output "ses_send_mail_policy_arn" {
  value = "${aws_iam_policy.ses_send_mail.arn}"
}

output "ses_send_mail_policy_document" {
  value = "${data.aws_iam_policy_document.ses_send_mail.json}"
}


# s3_full_access
output "s3_full_access_policy_arn" {
  value = "${aws_iam_policy.s3_full_access.arn}"
}

output "s3_full_access_policy_document" {
  value = "${data.aws_iam_policy_document.s3_full_access.json}"
}


# deny_senstive_services
output "deny_senstive_services_arn" {
  value = "${aws_iam_policy.deny_sestive_services.arn}"
}

output "deny_senstive_services_policy_document" {
  value = "${data.aws_iam_policy_document.deny_sestive_services.json}"
}


# s3_read_only_access
output "s3_read_only_access_arn" {
  value = "${aws_iam_policy.s3_read_only_access.arn}"
}

output "s3_read_only_access_policy_document" {
  value = "${data.aws_iam_policy_document.s3_read_only_access.json}"
}


# s3_read_write_access
output "s3_read_write_access_arn" {
  value = "${aws_iam_policy.s3_read_write_access.arn}"
}

output "s3_read_write_access_policy_document" {
  value = "${data.aws_iam_policy_document.s3_read_write_access.json}"
}


# sqs_read_write
output "sqs_read_write_arn" {
  value = "${aws_iam_policy.sqs_read_write.arn}"
}

output "sqs_read_write_policy_document" {
  value = "${data.aws_iam_policy_document.sqs_read_write.json}"
}


# create_delete_ebs_snapshots
output "create_delete_ebs_snapshots_arn" {
  value = "${aws_iam_policy.create_delete_ebs_snapshots.arn}"
}

output "create_delete_ebs_snapshots_policy_document" {
  value = "${data.aws_iam_policy_document.create_delete_ebs_snapshots.json}"
}

