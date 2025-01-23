terraform {
  required_version = ">=1.10.4"

  cloud {

    organization = "flcdrg"

    workspaces {
      name = "terraform-azure-sql-db-replica"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}