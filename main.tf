terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  cloud {
    # The name of your Terraform Cloud organization.
    organization = "hanxgle"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "new-learn-lxgh"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "new-learn-lxgh"
  location = "westus2"
}

resource "azurerm_static_site" "swa" {
  name                = "new-lxgh-swa"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}
