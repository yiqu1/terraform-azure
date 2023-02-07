terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.42.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
}

resource "azurerm_resource_group" "rg1" {
  name     = "rg1-resources"
  location = "East Us"
}

resource "azurerm_storage_account" "sa1" {
  name                     = "sa1storacc"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sc1" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.sc1.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "sb1" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.sa1.name
  storage_container_name = azurerm_storage_container.sc1.name
  type                   = "Block"
  source                 = "some-local-file.zip"
  size                   = "512"
}