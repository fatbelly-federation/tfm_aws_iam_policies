# this creates an IAM Policy that grants read+write access to SQS

resource "aws_iam_policy" "sqs_read_write" {
    name = "${var.policy_prefix}_sqs_read_write"
    path = "/"
    description = "Allow reading of and writing to SQS queues"

    policy  = "${data.aws_iam_policy_document.sqs_read_write.json}"
}

data "aws_iam_policy_document" "sqs_read_write" {
  statement {
    # sid *must* be alphanumberic
    sid       = "20180909"
    effect    = "Allow"
    resources = [ "arn:aws:sqs:*:*:*" ]
    actions   = [
                  "sqs:DeleteMessage",
                  "sqs:GetQueueUrl",
                  "sqs:ChangeMessageVisibility",
                  "sqs:SendMessageBatch",
                  "sqs:UntagQueue",
                  "sqs:ReceiveMessage",
                  "sqs:SendMessage",
                  "sqs:GetQueueAttributes",
                  "sqs:ListQueueTags",
                  "sqs:TagQueue",
                  "sqs:ListDeadLetterSourceQueues",
                  "sqs:DeleteMessageBatch",
                  "sqs:PurgeQueue",
                  "sqs:DeleteQueue",
                  "sqs:CreateQueue",
                  "sqs:ChangeMessageVisibilityBatch",
                  "sqs:SetQueueAttributes"
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
    actions   = [ "sqs:ListQueues" ]
    # enforce encrypted communications
    condition = {
        test      = "Bool"
        variable  = "aws:SecureTransport"
        values    = ["true"]
      }
  }
}

