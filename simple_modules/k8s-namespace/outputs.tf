output "name" {
  description = "Name of the namespace"
  value       = kubernetes_namespace_v1.main.metadata[0].name
}

output "resource_version" {
  description = "An opaque value that represents the internal version of this namespace that can be used by clients to determine when namespaces have changed"
  value       = kubernetes_namespace_v1.main.metadata[0].resource_version
}

output "generation" {
  description = "A sequence number representing a specific generation of the desired state"
  value       = kubernetes_namespace_v1.main.metadata[0].generation
}

output "uid" {
  description = "The unique in time and space value for this namespace"
  value       = kubernetes_namespace_v1.main.metadata[0].uid
}