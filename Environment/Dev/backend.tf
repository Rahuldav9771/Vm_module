terraform {
  backend "azurerm" {
    resource_group_name  = "backend_rg"
    storage_account_name = "backendstorage9771"
    container_name       = "backend-container"
    key                  = "terraform.tfstate"
    
  }
}