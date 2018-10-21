# this creates an IAM Policy that grants lambda functions the write logs privilege

# ref: https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html

resource "aws_iam_policy" "lambda_write_logs" {
    name = "${var.policy_prefix}_lambda_write_logs"
    path = "/"
    description = "Allow lambda functions to write logs"
    policy  = "${data.aws_iam_policy_document.lambda_write_logs.json}"
}

data "aws_iam_policy_document" "lambda_write_logs" {
  statement {
    # sid *must* be alphanumberic
    sid       = "20181021"
    effect    = "Allow"
    resources = [ "arn:aws:logs:*:*:*" ]
    actions   = [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
    ]
    # enforce encrypted communications
    condition = {
        test      = "Bool"
        variable  = "aws:SecureTransport"
        values    = ["true"]
      }
  }

}

