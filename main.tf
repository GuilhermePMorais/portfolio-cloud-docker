# Configuração básica de Infraestrutura como Código (Terraform)
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.0"
    }
  }
}

provider "local" {}

# Simulando a criação de um recurso de infraestrutura (um arquivo de inventário de nuvem)
resource "local_file" "cloud_inventory" {
  filename = "cloud-inventory.yaml"
  content  = <<EOT
project: portfolio-cloud-docker
environment: production
cloud_architecture:
  orchestration: Docker Compose
  web_server: Nginx Alpine
  database: PostgreSQL 15
status: Active & Automated via Terraform & GitHub Actions
EOT
}

output "terraform_message" {
  value = "Infraestrutura simulada com Terraform gerada com sucesso!"
}
