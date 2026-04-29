# Pull the image from Docker Hub
resource "docker_image" "node_app" {
  name         = var.image_name
  keep_locally = false
}

# Run the container
resource "docker_container" "node_app" {
  name  = var.container_name
  image = docker_image.node_app.image_id

  restart = "unless-stopped"

  ports {
    internal = var.container_port
    external = var.host_port
  }

  labels {
    label = "app"
    value = "node-app"
  }

}
