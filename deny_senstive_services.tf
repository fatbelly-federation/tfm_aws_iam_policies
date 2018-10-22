# Creates an IAM Policy that denies access to various senstive services
# this idea being we want to try to keep folks from shooting their foot off

# ref: https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html

resource "aws_iam_policy" "deny_sestive_services" {
    name = "${var.policy_prefix}_deny_sestive_services"
    path = "/"
    description = "Deny access to senstive services"
    policy  = "${data.aws_iam_policy_document.deny_sestive_services.json}"
}

data "aws_iam_policy_document" "deny_sestive_services" {
  # deny some billing bits
  statement {
    # sid *must* be alphanumberic
    sid       = "20180910"
    effect    = "Deny"
    resources = [ "*" ]
    actions   = [
                  "aws-portal:ModifyAccount",
                  "aws-portal:ModifyBilling",
                  "aws-portal:ModifyPaymentMethods",
                  "aws-portal:ViewBilling",
                  "aws-portal:ViewPaymentMethods"
                ]
  }

  # deny access to DirectoryServices
  statement {
    effect    = "Deny"
    resources = [ "*" ]
    actions   = [ "ds:*" ]
  }

  # deny some ec2 bits
  statement {
    effect    = "Deny"
    resources = [ "*" ]
    actions   = [
                  "ec2:AttachClassicLinkVpc",
                  "ec2:AttachVpnGateway",
                  "ec2:CreateCustomerGateway",
                  "ec2:CreateInternetGateway",
                  "ec2:CreateNatGateway",
                  "ec2:CreateVpc",
                  "ec2:CreateVpcPeeringConnection",
                  "ec2:CreateVpnConnection",
                  "ec2:CreateVpnConnectionRoute",
                  "ec2:CreateVpnGateway",
                  "ec2:DeleteCustomerGateway",
                  "ec2:DeleteDhcpOptions",
                  "ec2:DeleteInternetGateway",
                  "ec2:DeleteNatGateway",
                  "ec2:DeleteVpc",
                  "ec2:DeleteVpcPeeringConnection",
                  "ec2:DeleteVpnConnection",
                  "ec2:DeleteVpnConnectionRoute",
                  "ec2:DeleteVpnGateway",
                  "ec2:DetachInternetGateway",
                  "ec2:DetachVpnGateway",
                  "ec2:DisableVgwRoutePropagation",
                  "ec2:DisableVpcClassicLink",
                  "ec2:DisableVpcClassicLinkDnsSupport",
                  "ec2:EnableVpcClassicLink",
                  "ec2:EnableVpcClassicLinkDnsSupport",
                  "ec2:ModifyVpcAttribute",
                  "ec2:ModifyVpcPeeringConnectionOptions",
                  "ec2:MoveAddressToVpc",
                  "ec2:RejectVpcPeeringConnection"
                ]
  }

  # deny access to some IAM bits
  statement {
    effect    = "Deny"
    resources = [ "*" ]
    actions   = [
                  "iam:UpdateAssumeRolePolicy",
                  "iam:CreateLoginProfile",
                  "iam:CreateAccountAlias",
                  "iam:DeleteOpenIDConnectProvider",
                  "iam:RemoveClientIDFromOpenIDConnectProvider",
                  "iam:DeleteRole",
                  "iam:UpdateAccountPasswordPolicy",
                  "iam:CreateSAMLProvider",
                  "iam:CreateUser",
                  "iam:DeleteAccountAlias",
                  "iam:UpdateSAMLProvider",
                  "iam:DeleteAccountPasswordPolicy",
                  "iam:CreateOpenIDConnectProvider",
                  "iam:DeleteSAMLProvider"
                ]
  }
}


