resource "null_resource" "placeholder" {
  count = var.module_enabled ? 1 : 0 # Only create if module_enabled is true

  triggers = {
    message = "This is a placeholder module. Resources to be defined."
  }
}
