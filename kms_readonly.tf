# this creates an IAM Policy that grants read-only access to KMS
# you'll still need to grant access to individual keys

# ref: https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html

resource "aws_iam_policy" "kms_readonly" {
    name = "${var.policy_prefix}_kms_readonly"
    path = "/"
    description = "General read-only access to KMS. You will still need to grant access to specific keys"
    policy  = "${data.aws_iam_policy_document.kms_readonly.json}"
}

data "aws_iam_policy_document" "kms_readonly" {
  statement {
    # sid *must* be alphanumberic
    sid       = "20181021"
    effect    = "Allow"
    resources = [ "arn:aws:kms:*:*:key/*" ]
    actions   = [
                "kms:GetParametersForImport",
                "kms:ListKeyPolicies",
                "kms:GetKeyRotationStatus",
                "kms:ListRetirableGrants",
                "kms:GetKeyPolicy",
                "kms:DescribeKey",
                "kms:ListResourceTags",
                "kms:ListGrants"
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
                "kms:ListKeys",
                "kms:GenerateRandom",
                "kms:ListAliases",
                "kms:ReEncryptTo",
                "kms:ReEncryptFrom"
    ]
    # enforce encrypted communications
    condition = {
        test      = "Bool"
        variable  = "aws:SecureTransport"
        values    = ["true"]
      }
  }

}

