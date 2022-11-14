variable "release_name" {
  description = "Release name"
  type        = string
  default     = "vault"
}

variable "namespace" {
  description = "K8s namespace name"
  type        = string
  default     = "vault"
}

variable "chart_version" {
  description = "Helm Chart version"
  type        = string
  default     = "0.22.0"
}

variable "high_availability_mode" {
  description = "Enable multi-server mode for high availability"
  type        = bool
  default     = true
}

variable "ui_enabled" {
  description = "Enable Vault UI"
  type        = bool
  default     = true
}

variable "disable_mlock" {
  description = "Disables the server from executing the mlock syscall, is strongly recommended if using integrated storage"
  type        = bool
  default     = true
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "aws_iam_role_name" {
  description = "AWS IAM Role name"
  type        = string
  default     = "vault"
}

variable "aws_iam_openid_connect_provider_arn" {
  description = "AWS EKS OpenID connect provider ARN"
  type        = string
  nullable    = false
}

variable "aws_iam_openid_connect_provider_url" {
  description = "AWS EKS openid connect provider URL"
  type        = string
  nullable    = false
}
