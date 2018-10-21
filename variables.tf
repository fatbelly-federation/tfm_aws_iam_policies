################### VARIABLES ###################

variable "region" {
  description = "AWS region we are performing our actions in"
}

variable "policy_prefix" {
  description = "useful policy prefix identifier. Makes it easier to group/find our custom policies"
  default = "zzz"
}

