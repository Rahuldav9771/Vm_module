terraform {
  backend "azurerm" {
    resource_group_name  = "backend_rg"
    storage_account_name = "backend9771"
    container_name       = "backend"
    key                  = "terraform.tfstate"
    
  }
}