provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  location = "eastus"
  name = "existing-rg-vnet"
}

module "existing_rg_vnet" {
  source = "../.."

  resource_group_name = azurerm_resource_group.main.name
  vnet_name          = "existing-rg-vnet"
  vnet_address_space = ["10.42.0.0/16"]
  subnets = {
    web = "10.42.0.0/24"
    db  = "10.42.1.0/24"
  }
  common_tags = {
    environment = "dev"
  }

  depends_on = [
    azurerm_resource_group.main
  ]
}