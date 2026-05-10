terraform {
  backend "azurerm" {
    resource_group_name  = "backend_rg"
    storage_account_name = "backend97716"
    container_name       = "backend"
    key                  = "terraform.tfstate"
    
  }
}
