# Creates an IAM Policy that grants full access to SES.
# Used primarily in IAM role attached to servers

# ref: https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html

resource "aws_iam_policy" "ses_send_mail" {
    name = "${var.policy_prefix}_ses_send_mail"
    path = "/"
    description = "Allow sending of email thru SES"
    policy  = "${data.aws_iam_policy_document.ses_send_mail.json}"

}

data "aws_iam_policy_document" "ses_send_mail" {
  statement {
    # sid *must* be alphanumberic
    sid       = "20180909"
    effect    = "Allow"
    resources = [ "*" ]

    actions = [ 
                "ses:ListTemplates",
                "ses:ListCustomVerificationEmailTemplates",
                "ses:VerifyEmailIdentity",
                "ses:GetIdentityPolicies",
                "ses:GetSendQuota",
                "ses:DescribeConfigurationSet",
                "ses:ListReceiptFilters",
                "ses:GetIdentityMailFromDomainAttributes",
                "ses:VerifyDomainDkim",
                "ses:VerifyDomainIdentity",
                "ses:SendEmail",
                "ses:ListConfigurationSets",
                "ses:SendTemplatedEmail",
                "ses:SendCustomVerificationEmail",
                "ses:GetIdentityDkimAttributes",
                "ses:DescribeReceiptRuleSet",
                "ses:ListReceiptRuleSets",
                "ses:GetTemplate",
                "ses:ListIdentities",
                "ses:VerifyEmailAddress",
                "ses:GetCustomVerificationEmailTemplate",
                "ses:SendRawEmail",
                "ses:GetSendStatistics",
                "ses:SendBounce",
                "ses:GetIdentityVerificationAttributes",
                "ses:GetIdentityNotificationAttributes",
                "ses:ListIdentityPolicies",
                "ses:DescribeReceiptRule",
                "ses:DescribeActiveReceiptRuleSet",
                "ses:GetAccountSendingEnabled",
                "ses:SendBulkTemplatedEmail",
                "ses:ListVerifiedEmailAddresses"
            ]
    # enforce encrypted communications
    condition = {
        test      = "Bool"
        variable  = "aws:SecureTransport"
        values    = ["true"]
      }
  }
}

