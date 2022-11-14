variable "name" {
  description = "Name of the namespace, must be unique"
  type        = string
  nullable    = false
}

variable "annotations" {
  description = "An unstructured key value map stored with the namespace that may be used to store arbitrary metadata"
  type        = map(string)
  default     = {}
}

variable "labels" {
  description = "Map of string keys and values that can be used to organize and categorize (scope and select) namespaces"
  type        = map(string)
  default     = {}
}