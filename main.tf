resource "azurerm_resource_group" "main" {
  count    = var.resource_group_name == null ? 1 : 0
  name     = var.vnet_name
  location = var.location

  tags = var.common_tags

}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name == null ? var.vnet_name : var.resource_group_name

  depends_on = [
    azurerm_resource_group.main
  ]
}

resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  address_space = var.vnet_address_space

  tags = var.common_tags
}

resource "azurerm_subnet" "main" {
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [each.value]
}
