variable "name" {
  description = "Name of AWS IAM Role"
  type        = string
  nullable    = false
}

variable "aws_iam_openid_connect_provider_arn" {
  description = "AWS IAM OpenIP connect provider ARN"
  type        = string
  nullable    = false
}

variable "aws_iam_openid_connect_provider_url" {
  description = "AWS IAM OpenIP connect provider URL"
  type        = string
  nullable    = false
}

variable "k8s_serviceaccount" {
  description = "Kubernetes service account name"
  type        = string
  nullable    = false
}

variable "k8s_namespace" {
  description = "Kubernetes namespace name with service account"
  type        = string
  nullable    = false
}

variable "polices" {
  description = "AWS IAM Polices"
  type = map(object({
    actions  = list(string)
    effect   = string
    resource = string
  }))
}