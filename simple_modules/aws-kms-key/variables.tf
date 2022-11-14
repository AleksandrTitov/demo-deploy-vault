variable "name" {
  description = "Name of KMS key"
  type        = string
  nullable    = false
}

variable "key_usage" {
  description = "Specifies the intended use of the key"
  type        = string
  default     = "ENCRYPT_DECRYPT"
  validation {
    condition     = contains(["ENCRYPT_DECRYPT", "SIGN_VERIFY"], var.key_usage)
    error_message = "Valid values: 'ENCRYPT_DECRYPT' or 'SIGN_VERIFY'."
  }
}

variable "customer_master_key_spec" {
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports"
  type        = string
  default     = "SYMMETRIC_DEFAULT"
  validation {
    condition     = contains(["SYMMETRIC_DEFAULT", "RSA_2048", "RSA_3072", "RSA_4096", "ECC_NIST_P256", "ECC_NIST_P384", "ECC_NIST_P521", "ECC_SECG_P256K1"], var.customer_master_key_spec)
    error_message = "Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1."
  }
}

variable "deletion_window_in_days" {
  description = "The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key"
  type        = string
  default     = "7"
  validation {
    condition     = var.deletion_window_in_days >= 7 && var.deletion_window_in_days <= 30 ? true : false
    error_message = "If you specify a value, it must be between 7 and 30, inclusive."
  }
}

variable "multi_region" {
  description = "Indicates whether the KMS key is a multi-Region (true) or regional (false) key."
  type        = bool
  default     = false
}

variable "kms_aliases_list" {
  description = "List of aliases for the KMS key"
  type        = list(string)
  default     = []
}
