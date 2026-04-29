variable "image_name" {
  description = "Docker Hub image to deploy"
  type        = string
  default     = "hatem95/node-hello:latest"
}

variable "container_name" {
  description = "Name for the Docker container"
  type        = string
  default     = "node-hello-app"
}

variable "container_port" {
  description = "Port the app listens on inside the container"
  type        = number
  default     = 3000
}

variable "host_port" {
  description = "Port exposed on the host machine"
  type        = number
  default     = 3000
}

variable "newrelic_license_key" {
  description = "New Relic license key for log and infra monitoring"
  type        = string
  sensitive   = true
}