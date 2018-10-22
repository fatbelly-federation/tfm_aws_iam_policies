# grant ability to create, tag and copy snapshot.
# along with creating and registering AMIs (images)

# ref: https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html

resource "aws_iam_policy" "create_copy_tag_register_images" {
    name = "${var.policy_prefix}_create_copy_tag_register_images"
    path = "/"
    description = "Allow creating, copying, tagging snapshots along with creating and registering images"
    policy  = "${data.aws_iam_policy_document.create_copy_tag_register_images.json}"
}

data "aws_iam_policy_document" "create_copy_tag_register_images" {
  statement {
    # sid *must* be alphanumberic
    sid       = "20181021"
    effect    = "Allow"
    resources = [ 
                "arn:aws:ec2:::snapshot/*",
                "arn:aws:ec2:::volume/*",
                "arn:aws:ec2:::image/*"
    ]
    actions   = [ 
                "ec2:CreateSnapshot",
                "ec2:CreateTags",
                "ec2:DescribeImages",
                "ec2:DescribeSnapshots",
                "ec2:DescribeTags",
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
    effect    = "Allow"
    resources = [ "*" ]
    actions   = [ 
                "ec2:CopySnapshot",
                "ec2:RegisterImage",
                "ec2:CreateImage",
                "ec2:CopyImage",
                "ec2:DescribeInstances", 
                "ec2:DescribeImages",
    ]
    # enforce encrypted communications
    condition = {
        test      = "Bool"
        variable  = "aws:SecureTransport"
        values    = ["true"]
      }
  }

}

