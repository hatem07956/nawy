output "container_id" {
  description = "ID of the running Docker container"
  value       = docker_container.node_hello.id
}

output "container_name" {
  description = "Name of the running Docker container"
  value       = docker_container.node_hello.name
}

output "app_url" {
  description = "URL to access the running application"
  value       = "http://localhost:${var.host_port}"
}

output "image_id" {
  description = "ID of the pulled Docker image"
  value       = docker_image.node_hello.image_id
}
