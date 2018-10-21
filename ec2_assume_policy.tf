# this defines the default ec2 assume policy
# this is used when creating a role that will be 
# attached to an instance

# ref: https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html

data "aws_iam_policy_document" "ec2_assume_policy" {
  statement {
    # sid *must* be alphanumberic
    sid       = "20181021"
    effect    = "Allow"
    actions   = [ "sts:AssumeRole" ]
    principals  {
        type    = "Service"
        identifiers = [ "ec2.amazonaws.com" ]
    }
    # enforce encrypted communications
    condition = {
        test      = "Bool"
        variable  = "aws:SecureTransport"
        values    = ["true"]
      }
  }
}

