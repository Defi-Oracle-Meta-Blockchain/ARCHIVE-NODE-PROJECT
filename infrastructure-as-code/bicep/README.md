# Bicep Deployment Guide

## Overview
This directory contains Bicep templates for deploying infrastructure required for the Archive Node Project.

## Usage
1. Install the Bicep CLI if not already installed:
   ```bash
   az bicep install
   ```

2. Deploy the template:
   ```bash
   az deployment group create --resource-group BesuResourceGroup --template-file main.bicep
   ```

3. Verify the deployed resources.

## Notes
- Customize the `main.bicep` template to match your deployment requirements.
