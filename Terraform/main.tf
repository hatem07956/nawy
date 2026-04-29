module "node_hello" {
  source = "./modules/docker_app"

  # Override defaults or omit to use the defaults in the module
  image_name     = "hatem95/node-hello:latest"
  container_name = "node-hello-app"
  container_port = 3000
  host_port      = 3000   # ← change host port here without touching the module
}