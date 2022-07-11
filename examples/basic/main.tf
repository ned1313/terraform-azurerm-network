provider "azurerm" {
  features {}
}

module "basic_vnet" {
  source = "../.."

  vnet_name          = "basic-vnet"
  vnet_address_space = ["10.42.0.0/16"]
  subnets = {
    web = "10.42.0.0/24"
    db  = "10.42.1.0/24"
  }
  common_tags = {
    environment = "dev"
  }
}