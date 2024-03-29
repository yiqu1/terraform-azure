resource "azurerm_resource_group" "terraform_sample" { # as a logical container for resources
  name     = "terraform-sample"
  location = var.arm_region
}

resource "azurerm_virtual_network" "my_vn" {
  name                = "tf-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terraform_sample.location
  resource_group_name = azurerm_resource_group.terraform_sample.name
}

resource "azurerm_subnet" "my_subnet_frontend" {
  name                 = "frontend"
  resource_group_name  = azurerm_resource_group.terraform_sample.name
  virtual_network_name = azurerm_virtual_network.my_vn.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "my_subnet_backend" {
  name                 = "backend"
  resource_group_name  = azurerm_resource_group.terraform_sample.name
  virtual_network_name = azurerm_virtual_network.my_vn.name
  address_prefixes     = ["10.0.2.0/24"]
}
