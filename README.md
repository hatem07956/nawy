# DevOps Assignment — Node.js App with CI/CD

A containerized Node.js app, automatically built and pushed via GitHub Actions, and deployed locally with Terraform.

---

## What's Inside

├── node-hello-master/
│   ├── index.js          # App
│   ├── Dockerfile        # Container definition
│   └── .eslintrc.json    # Lint rules
├── terraform/
│   ├── main.tf
│   └── modules/docker_app/
└── .github/workflows/
    └── ci.yml            # CI/CD pipeline

---

## Requirements

- Docker
- Terraform v1.3+
- Node.js v22+

---

## CI/CD Pipeline

Runs automatically on push/PR to main.

- Pull request → runs lint only
- Push to main → lint → build → push to Docker Hub

### Setup GitHub Secrets

In your repo: Settings → Secrets → Actions, add:

| Secret            | Value                      |
|-------------------|---------------------------|
| DOCKER_USERNAME   | Your Docker Hub username   |
| DOCKER_PASSWORD   | Your Docker Hub access token |

---

## Run with Docker

docker build -t node-hello ./node-hello-master
docker run -p 3000:3000 node-hello

App runs at http://localhost:3000

---

## Deploy with Terraform

cd terraform
terraform init
terraform plan
terraform apply

App runs at http://localhost:3000

To stop:
terraform destroy

---

## Lint Locally

cd node-hello-master
npm install
npx eslint .

---

## Assumptions

- No cloud deployment — deploying to ECS would require VPC, subnets, IAM roles, task

## Delivery

- GitHub Repository: https://github.com/hatem07956/nawy
- Docker Hub Image: https://hub.docker.com/repository/docker/hatem95/node-hello