resource "helm_release" "main" {
  chart                      = var.chart
  name                       = var.name
  namespace                  = var.namespace
  repository                 = var.repository
  version                    = var.chart_version
  timeout                    = var.timeout
  disable_webhooks           = var.disable_webhooks
  reuse_values               = var.reuse_values
  reset_values               = var.reset_values
  force_update               = var.force_update
  recreate_pods              = var.recreate_pods
  cleanup_on_fail            = var.cleanup_on_fail
  max_history                = var.max_history
  atomic                     = var.atomic
  skip_crds                  = var.skip_crds
  render_subchart_notes      = var.render_subchart_notes
  disable_openapi_validation = var.disable_openapi_validation
  wait                       = var.wait
  wait_for_jobs              = var.wait_for_jobs
  values                     = var.values
  replace                    = var.replace
  description                = var.description
  lint                       = var.lint
  create_namespace           = var.create_namespace

  dynamic "postrender" {
    for_each = var.postrender.binary_path == null ? [] : [1]
    content {
      binary_path = var.postrender.binary_path
      args        = var.postrender.args
    }
  }

  dynamic "set" {
    for_each = var.set
    content {
      name  = set.key
      value = set.value
    }
  }

  dynamic "set_sensitive" {
    for_each = var.set_sensitive
    content {
      name  = set_sensitive.key
      value = set_sensitive.value
    }
  }
}