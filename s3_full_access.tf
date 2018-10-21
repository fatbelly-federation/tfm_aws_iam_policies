# Creates an IAM Policy that grants full access to S3
# and Denies access to Terraform buckets (terraform*)
# Used primarily in IAM role attached to servers

# ref: https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html

resource "aws_iam_policy" "s3_full_access" {
    name = "${var.policy_prefix}_s3_full_access"
    path = "/"
    description = "Allow full access to S3, except for terraform buckets"
    policy  = "${data.aws_iam_policy_document.s3_full_access.json}"
}

data "aws_iam_policy_document" "s3_full_access" {
  # this bit here denies access to buckets that start with terraform
  # the idea being try to protect our terraform buckets
  statement {
    # sid *must* be alphanumberic
    sid       = "20180909"
    effect    = "Deny"
    resources = [ "arn:aws:s3:::terraform*" ]
    actions   = [ "s3:*" ]
  }

  # explicitly deny unencrypted communications
  statement {
    # sid *must* be alphanumberic
    sid       = "20181021"
    effect    = "Deny"
    resources = [ "arn:aws:s3:::*"]
    actions   = [ "s3:*" ]
    condition = {
        test      = "Bool"
        variable  = "aws:SecureTransport"
        values    = ["false"]
      }
  }

  statement {
    # sid *must* be alphanumberic
    sid       = "20180909"
    effect    = "Allow"
    resources = [ "*" ]
    actions   = [ "s3:*" ]
    # enforce encrypted communications
    condition = {
        test      = "Bool"
        variable  = "aws:SecureTransport"
        values    = ["true"]
      }
  }
}

