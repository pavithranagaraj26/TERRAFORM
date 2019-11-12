output "project_id" {
  description = "The GCP project you want to enable APIs on"
  value       = var.enable_apis ? element([for v in google_project_service.project_services : v.project], 0) : var.project_id
}
