output "status" {
  description = "Module status."
  value       = var.module_enabled ? "Module resources would be created if not placeholder" : "Module disabled or placeholder"
}
