param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("up", "down", "ps", "terraform-init", "terraform-apply", "logs", "clean")]
    [string]$Task
)

switch ($Task) {
    "up" { docker compose up -d }
    "down" { docker compose down --remove-orphans }
    "ps" { docker compose ps }
    "terraform-init" { docker run --rm -v "${PWD}:/workspace" -w /workspace hashicorp/terraform:latest init }
    "terraform-apply" { docker run --rm -v "${PWD}:/workspace" -w /workspace hashicorp/terraform:latest apply -auto-approve }
    "logs" { docker compose logs -f }
    "clean" { docker compose down -v --remove-orphans }
}
