.PHONY: up down ps terraform-init terraform-apply logs clean

# Sobe os containers em background
up:
docker compose up -d

# Derruba os containers e limpa órfãos
down:
docker compose down --remove-orphans

# Mostra o status dos serviços e health checks
ps:
docker compose ps

# Inicializa o Terraform via Docker
terraform-init:
docker run --rm -v ${PWD}:/workspace -w /workspace hashicorp/terraform:latest init

# Aplica a infraestrutura simulada via Terraform
terraform-apply:
docker run --rm -v ${PWD}:/workspace -w /workspace hashicorp/terraform:latest apply -auto-approve

# Mostra os logs dos containers
logs:
docker compose logs -f

# Limpa o ambiente completamente (containers e volumes)
clean:
docker compose down -v --remove-orphans
