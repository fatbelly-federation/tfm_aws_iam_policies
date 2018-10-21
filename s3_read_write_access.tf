# Creates an IAM Policy that grants read+write access to S3
# and Denies access to Terraform buckets (terraform*)

# ref: https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html

resource "aws_iam_policy" "s3_read_write_access" {
    name = "${var.policy_prefix}_s3_read_write_access"
    path = "/"
    description = "Allow read and write access to S3, except for terraform buckets"
    policy  = "${data.aws_iam_policy_document.s3_read_write_access.json}"
}

data "aws_iam_policy_document" "s3_read_write_access" {
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
    sid       = "20181021"
    effect    = "Allow"
    resources = [ "*" ]
    actions   = [ 
        "s3:AbortMultipartUpload",
        "s3:CreateBucket",
        "s3:DeleteBucket",
        "s3:DeleteObject",
        "s3:DeleteObjectTagging",
        "s3:DeleteObjectVersion",
        "s3:DeleteObjectVersionTagging",
        "s3:GetAccelerateConfiguration",
        "s3:GetAnalyticsConfiguration",
        "s3:GetBucketAcl",
        "s3:GetBucketCORS",
        "s3:GetBucketLocation",
        "s3:GetBucketLogging",
        "s3:GetBucketNotification",
        "s3:GetBucketPolicy",
        "s3:GetBucketRequestPayment",
        "s3:GetBucketTagging",
        "s3:GetBucketVersioning",
        "s3:GetBucketWebsite",
        "s3:GetEncryptionConfiguration",
        "s3:GetInventoryConfiguration",
        "s3:GetIpConfiguration",
        "s3:GetLifecycleConfiguration",
        "s3:GetMetricsConfiguration",
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:GetObjectTagging",
        "s3:GetObjectTorrent",
        "s3:GetObjectVersion",
        "s3:GetObjectVersionAcl",
        "s3:GetObjectVersionForReplication",
        "s3:GetObjectVersionTagging",
        "s3:GetObjectVersionTorrent",
        "s3:GetReplicationConfiguration",
        "s3:ListAllMyBuckets",
        "s3:ListBucket",
        "s3:ListBucketByTags",
        "s3:ListBucketMultipartUploads",
        "s3:ListBucketVersions",
        "s3:ListMultipartUploadParts",
        "s3:PutBucketTagging",
        "s3:PutObject",
        "s3:PutObjectTagging",
        "s3:RestoreObject"
    ]
    # enforce encrypted communications
    condition = {
        test      = "Bool"
        variable  = "aws:SecureTransport"
        values    = ["true"]
      }
  }
}

