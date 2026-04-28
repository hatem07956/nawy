# Terraform Docker Deployment — hatem95/node-hello

Deploy `hatem95/node-hello` locally using Terraform and the Docker provider.

## Prerequisites

| Tool        | Install                                       |
|-------------|-----------------------------------------------|
| Docker      | https://docs.docker.com/get-docker/           |
| Terraform   | https://developer.hashicorp.com/terraform/install |

---

## Project Structure

```
terraform-docker/
├── main.tf        # Docker provider, image pull, container run
├── variables.tf   # All configurable values
├── outputs.tf     # Container ID, name, and app URL
└── README.md
```

---

## Quick Start

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Preview the plan
```bash
terraform plan
```

### 3. Apply (deploy the container)
```bash
terraform apply
```
Type `yes` when prompted.

### 4. Access your app
```
http://localhost:3000
```

### 5. Destroy (stop & remove the container)
```bash
terraform destroy
```

---

## Customization

Override any variable at apply time without editing files:

```bash
# Use a specific image tag
terraform apply -var="image_name=hatem95/node-hello:v2"

# Change the exposed host port
terraform apply -var="host_port=8080"

# Change the container name
terraform apply -var="container_name=my-hello-app"
```

Or create a `terraform.tfvars` file:
```hcl
image_name     = "hatem95/node-hello:latest"
container_name = "node-hello-app"
container_port = 3000
host_port      = 3000
```

---

## Useful Commands

```bash
# Check container status
docker ps -f name=node-hello-app

# View container logs
docker logs node-hello-app

# Show Terraform outputs
terraform output
```
