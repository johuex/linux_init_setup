#!/usr/bin/bash

# yes, installing only specific version of terraform and terragrunt

echo "Terraform"
wget https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_linux_amd64.zip
unzip unzip terraform_1.1.9_linux_amd64.zip
chmod +x terraform
sudo mv terraform /usr/local/bin

echo "Terragrunt"
wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.36.6/terragrunt_linux_amd64
mv terragrunt_linux_amd64 terragrunt
chmod +x terragrunt
sudo mv terragrunt /usr/local/bin

