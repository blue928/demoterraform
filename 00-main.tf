# Terraform settings block
## Specify existing remote storage for Terraform State Files
terraform {
  # Required version of terraform
  required_version = ">=1.1.4"
  # Required terraform providers
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = "~>2.93.1"
    }
    azuread = {
      source = "hashicorp/azuread"
      #version = "~>2.15.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      #version = "~> 2.7.1"
    }
    helm = {
      source = "hashicorp/helm"
    }
    random = {
      source = "hashicorp/random"
      #version = "~>3.1.0"
    }
  }

  # Setup terraform to use Azure storage bucket
  # to store terraform.tfstate files. 
  backend "azurerm" {
    #subscription_id      = "0bfe77a8-517e-450b-a955-92f03bb4c40c"
    resource_group_name  = "DEV-Lift_Stihl-Dev_CentralUS"
    storage_account_name = "stihldevliftstac"
    container_name       = "stihldevlifttfstate"
    key                  = "stihldevlift.tfstate"
  }
}
