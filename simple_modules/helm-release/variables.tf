variable "name" {
  description = "Release name"
  type        = string
  nullable    = false
}

variable "chart" {
  description = "Chart name to be installed"
  type        = string
  nullable    = false
}

variable "repository" {
  description = "Repository URL where to locate the requested chart"
  type        = string
}

variable "chart_version" {
  description = "Specify the exact chart version to install"
  type        = string
}

variable "namespace" {
  description = "The namespace to install the release into"
  type        = string
  nullable    = false
}

variable "create_namespace" {
  description = "Create the namespace if it does not yet exist"
  type        = bool
  default     = false
}

variable "timeout" {
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
  default     = 300
}

variable "disable_webhooks" {
  description = "Prevent hooks from running"
  type        = bool
  default     = false
}

variable "reuse_values" {
  description = "When upgrading, reuse the last release's values and merge in any overrides (if 'reset_values' is specified, this is ignored)"
  type        = bool
  default     = false
}

variable "reset_values" {
  description = "When upgrading, reset the values to the ones built into the chart"
  type        = bool
  default     = false
}

variable "force_update" {
  description = "Force resource update through delete/recreate if needed"
  type        = bool
  default     = false
}

variable "recreate_pods" {
  description = "Perform pods restart during upgrade/rollback"
  type        = bool
  default     = false
}

variable "cleanup_on_fail" {
  description = "Allow deletion of new resources created in this upgrade when upgrade fails"
  type        = bool
  default     = false
}

variable "max_history" {
  description = "Maximum number of release versions stored per release, 0 - no limit"
  type        = number
  default     = 0
}

variable "atomic" {
  description = "If set, installation process purges chart on fail"
  type        = bool
  default     = false
}

variable "skip_crds" {
  description = "If set, no CRDs will be installed"
  type        = bool
  default     = false
}

variable "render_subchart_notes" {
  description = "If set, render subchart notes along with the parent"
  type        = bool
  default     = true
}

variable "disable_openapi_validation" {
  description = "If set, the installation process will not validate rendered templates against the Kubernetes OpenAPI Schema"
  type        = bool
  default     = false
}

variable "wait" {
  description = "Will wait until all resources are in a ready state before marking the release as successful, it will wait for as long as 'timeout'"
  type        = bool
  default     = true
}

variable "wait_for_jobs" {
  description = "If wait is enabled, will wait until all Jobs have been completed before marking the release as successful, it will wait for as long as timeout"
  type        = bool
  default     = false
}

variable "values" {
  description = "List of values in raw yaml to pass to helm"
  type        = list(string)
  default     = []
}

variable "set" {
  description = "Value block with custom values to be merged with the values yaml"
  type        = map(string)
  default     = {}
}

variable "set_sensitive" {
  description = "Value block with custom sensitive values to be merged with the values yaml that won't be exposed in the plan's diff"
  type        = map(string)
  default     = {}
}

variable "replace" {
  description = "Re-use the given name, only if that name is a deleted release which remains in the history"
  type        = bool
  default     = false
}

variable "description" {
  description = "Set release description attribute (visible in the history)"
  type        = string
  default     = null
}

variable "postrender" {
  description = " Configure a command to run after helm renders the manifest which can alter the manifest contents"
  type = object({
    binary_path = string
    args        = optional(string)
  })
  default = {
    binary_path = null
  }
}

variable "lint" {
  description = "Run the helm chart linter during the plan"
  type        = bool
  default     = false
}
