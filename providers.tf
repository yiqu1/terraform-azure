terraform {
  required_providers { # define the required providers
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {  # no additional configuration options specified
  features {}
}