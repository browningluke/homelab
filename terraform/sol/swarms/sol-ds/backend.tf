terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-rg"
    storage_account_name = "browninglukehlsa"
    container_name       = "tfstate"
    key                  = "sol/swarms/sol-ds.terraform.tfstate"
  }
}
