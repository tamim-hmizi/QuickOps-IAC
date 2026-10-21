# QuickOps IAC

QuickOps IAC is the Infrastructure as Code layer of QuickOps, a DevOps-as-a-Service platform. It uses Terraform with the Azure Stack Hub provider to provision the QuickOps platform VM, its network and the storage account that holds Terraform state. The VM is then configured by QuickOps-CAC to run the DevOps toolchain (Jenkins, SonarQube, Nexus, Prometheus, Grafana).

## Features

- **network** module: virtual network, subnet, static public IP and a network security group opening SSH (22), HTTP/HTTPS (80, 443), Jenkins (8080), Nexus (8081), SonarQube (9000), Prometheus (9090), Grafana (3000), the AI service (8001) and application ports (5000, 5050)
- **vm** module: Ubuntu Linux VM with SSH key authentication and a static private IP
- **storage** module: storage account and private `tfstate` container for remote Terraform state
- Root outputs: subnet ID, public and private IPs, NSG ID, storage account and container names
- Provider pinned to `hashicorp/azurestack` 1.0.0 with a committed `.terraform.lock.hcl`

## Tech stack

Terraform (>= 1.5), Azure Stack Hub (`hashicorp/azurestack` provider).

## Architecture

```
main.tf          Wires the network, vm and storage modules
provider.tf      azurestack provider (service principal credentials)
terraform.tf     Required Terraform and provider versions
variables.tf     Input variables
outputs.tf       Root outputs
modules/         network, vm, storage
```

## Related repositories

| Repository | Role |
|---|---|
| [QuickOps-Frontend](https://github.com/tamim-hmizi/QuickOps-Frontend) | React web console |
| [QuickOps-Backend](https://github.com/tamim-hmizi/QuickOps-Backend) | Express/MongoDB API and deployment orchestrator |
| [QuickOps-AI](https://github.com/tamim-hmizi/QuickOps-AI) | FastAPI + LLM deployment recommender |
| [QuickOps-IAC](https://github.com/tamim-hmizi/QuickOps-IAC) | Terraform for the QuickOps platform VM |
| [QuickOps-CAC](https://github.com/tamim-hmizi/QuickOps-CAC) | Ansible configuration of the DevOps toolchain |

## Getting started

### Prerequisites

- Terraform 1.5 or later
- An Azure Stack Hub subscription and a service principal

### Variables

Provide them in a `terraform.tfvars` file (git-ignored) or as `TF_VAR_*` environment variables:

| Variable | Purpose |
|---|---|
| `subscription_id`, `tenant_id`, `client_id`, `client_secret`, `object_id` | Service principal and subscription |
| `location`, `resource_group_name` | Target location and resource group |
| `quickops_admin_username`, `ssh_public_key` | VM admin account and SSH public key |

The Azure Stack Hub endpoint is set by `metadata_host` in `provider.tf`.

### Usage

```bash
terraform init
terraform fmt -check -recursive
terraform validate
terraform plan
terraform apply
```

## Project context

RFC final year project, 2025, by Tamim Hmizi: https://tamim-hmizi.github.io/Portfolio/
