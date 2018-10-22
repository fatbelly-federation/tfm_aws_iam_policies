# this defines an assume policy used with users authenticated within the account

# get the aws account of the caller
# ${data.aws_caller_identity.current.account_id}  will give you the account_id
data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "account_assume_policy" {
    statement {
        effect = "Allow"
        actions = [ "sts:AssumeRole" ]
        principals {
          type  = "AWS"
          identifiers = [ "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root" ]
        }
    }
}

