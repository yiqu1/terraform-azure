# terraform {
#   backend "azurerm" {
#     storage_account_name = "storageaccont41111"      # Use your own unique name here
#     container_name       = "tf-storage-container-0" # Use your own container name here
#     key                  = "terraform.tfstate"      # Add a name to the state file
#     resource_group_name  = "terraform-sample"       # Use your own resource group name here
#   }
# }