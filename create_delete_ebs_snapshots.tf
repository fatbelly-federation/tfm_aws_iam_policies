# Create policy that allows creating, deleting and tagging EBS snapshots

# ref: https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html

resource "aws_iam_policy" "create_delete_ebs_snapshots" {
    name = "${var.policy_prefix}_create_delete_ebs_snapshots"
    path = "/"
    description = "Allow creation and deletion of ebs snapshots along with tagging them"
    policy  = "${data.aws_iam_policy_document.create_delete_ebs_snapshots.json}"
}

data "aws_iam_policy_document" "create_delete_ebs_snapshots" {
  statement {
    # sid *must* be alphanumberic
    sid       = "20181021"
    effect    = "Allow"
    resources = [ 
                "arn:aws:ec2:*::snapshot/*",
                "arn:aws:ec2:*:*:volume/*"
    ]
    actions   = [ 
                "ec2:CreateSnapshot",
                "ec2:CreateTags",
                "ec2:DeleteSnapshot",
                "ec2:DescribeSnapshots",
                "ec2:DescribeVolumes"
    ]
    # enforce encrypted communications
    condition = {
        test      = "Bool"
        variable  = "aws:SecureTransport"
        values    = ["true"]
      }
  }

    statement {
    # sid *must* be alphanumberic
    sid       = "20181021"
    effect    = "Allow"
    resources = [ "*" ]
    actions   = [ "ec2:DescribeInstances" ]
    # enforce encrypted communications
    condition = {
        test      = "Bool"
        variable  = "aws:SecureTransport"
        values    = ["true"]
      }
  }

}

