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


# ec2_assume_policy
output "ec2_assume_policy_document" {
  value = "${data.aws_iam_policy_document.ec2_assume_policy.json}"
}


# kms_readonly
output "kms_readonly_arn" {
  value = "${aws_iam_policy.kms_readonly.arn}"
}

output "kms_readonly_policy_document" {
  value = "${data.aws_iam_policy_document.kms_readonly.json}"
}


# lambda_write_logs
output "lambda_write_logs_arn" {
  value = "${aws_iam_policy.lambda_write_logs.arn}"
}

output "lambda_write_logs_policy_document" {
  value = "${data.aws_iam_policy_document.lambda_write_logs.json}"
}


# create_copy_tag_register_images
output "create_copy_tag_register_images_arn" {
  value = "${aws_iam_policy.create_copy_tag_register_images.arn}"
}

output "create_copy_tag_register_images_policy_document" {
  value = "${data.aws_iam_policy_document.create_copy_tag_register_images.json}"
}


# account_assume_policy
output "account_assume__policy_document" {
  value = "${data.aws_iam_policy_document.account_assume_policy.json}"
}


# terraform_buckets_read_write_access
output "terraform_buckets_read_write_access_arn" {
  value = "${aws_iam_policy.terraform_buckets_read_write_access.arn}"
}

output "terraform_buckets_read_write_access_policy_document" {
  value = "${data.aws_iam_policy_document.terraform_buckets_read_write_access.json}"
}


# terraform_buckets_read_only_access
output "terraform_buckets_read_only_access_arn" {
  value = "${aws_iam_policy.terraform_buckets_read_only_access.arn}"
}

output "terraform_buckets_read_only_access_policy_document" {
  value = "${data.aws_iam_policy_document.terraform_buckets_read_only_access.json}"
}

