# Terraform Deployment Guide

## Overview
This directory contains Terraform configurations for deploying the infrastructure required for the Archive Node Project.

## Usage
1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Customize variables in `terraform.tfvars` or pass them as CLI arguments.

3. Plan and apply the deployment:
   ```bash
   terraform plan
   terraform apply
   ```

4. Verify the deployed resources.

## Example Variables File (`terraform.tfvars`)
```
resource_group_name = "BesuResourceGroup"
location            = "eastus"
vm_size             = "Standard_D4s_v3"
```

## Notes
- Ensure your Azure CLI is authenticated before running Terraform commands.
