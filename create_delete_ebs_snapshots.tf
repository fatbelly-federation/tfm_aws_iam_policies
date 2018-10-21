# Creates an IAM Policy that grants full access to S3
# and Denies access to Terraform buckets (terraform*)
# Used primarily in IAM role attached to servers

# ref: https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html

resource "aws_iam_policy" "create_delete_ebs_snapshots" {
    name = "${var.policy_prefix}_create_delete_ebs_snapshots"
    path = "/"
    description = "Allow creation and deletion of ebs snapshots along with tagging them"
    policy  = "${data.aws_iam_policy_document.create_delete_ebs_snapshots.json}"
}

data "aws_iam_policy_document" "create_delete_ebs_snapshots" {
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
                "ec2:CreateSnapshot",
                "ec2:CreateTags",
                "ec2:DeleteSnapshot",
                "ec2:DescribeSnapshots",
                "ec2:DescribeVolumes",
                "ec2:DescribeInstances"
    ]
    # enforce encrypted communications
    condition = {
        test      = "Bool"
        variable  = "aws:SecureTransport"
        values    = ["true"]
      }
  }
}

