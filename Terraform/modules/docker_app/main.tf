# Pull the image from Docker Hub
resource "docker_image" "node_app" {
  name         = var.image_name
  keep_locally = false
}
# Pull the New Relic infra agent image
resource "docker_image" "newrelic_infra" {
  name         = "newrelic/infrastructure:latest"
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

# Run the New Relic agent — collects logs from all containers automatically
resource "docker_container" "newrelic_infra" {
  name       = "${var.container_name}-nr-agent"
  image      = docker_image.newrelic_infra.image_id
  restart    = "unless-stopped"
  privileged = true
  network_mode = "host"

  env = [
    "NRIA_LICENSE_KEY=${var.newrelic_license_key}",
    "NRIA_DISPLAY_NAME=${var.container_name}-host"
  ]

  # Give agent access to Docker socket and host filesystem
  mounts {
    target    = "/var/run/docker.sock"
    source    = "/var/run/docker.sock"
    type      = "bind"
    read_only = true
  }

  mounts {
    target    = "/host"
    source    = "/"
    type      = "bind"
    read_only = true
  }
}