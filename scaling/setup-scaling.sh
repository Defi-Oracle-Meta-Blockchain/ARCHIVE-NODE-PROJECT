#!/bin/bash

set -euo pipefail  # Exit on error, treat unset variables as errors, and fail on pipe errors

# Variables
RESOURCE_GROUP="BesuResourceGroup"
SCALE_SET_NAME="BesuScaleSet"
VM_SIZE="Standard_D4s_v3"
ADMIN_USERNAME="azureuser"
ADMIN_PASSWORD="P@ssw0rd123!"

# Step 1: Create VM Scale Set
echo "Creating VM Scale Set..."
az vmss create   --resource-group $RESOURCE_GROUP   --name $SCALE_SET_NAME   --image UbuntuLTS   --admin-username $ADMIN_USERNAME   --admin-password $ADMIN_PASSWORD   --instance-count 2   --vm-sku $VM_SIZE   --upgrade-policy-mode automatic   --custom-data cloud-init.txt

# Step 2: Configure Scaling Rules
echo "Configuring autoscaling rules..."
az monitor autoscale create   --resource $SCALE_SET_NAME   --resource-group $RESOURCE_GROUP   --name BesuAutoscale   --min-count 2   --max-count 10   --count 2

az monitor autoscale rule create   --resource-group $RESOURCE_GROUP   --autoscale-name BesuAutoscale   --scale out 1   --condition "Percentage CPU > 80 avg 5m"   --cooldown 5

az monitor autoscale rule create   --resource-group $RESOURCE_GROUP   --autoscale-name BesuAutoscale   --scale in 1   --condition "Percentage CPU < 30 avg 5m"   --cooldown 5

echo "Scaling setup complete."
