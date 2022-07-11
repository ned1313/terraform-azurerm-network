output "resource_group_name" {
  description = "Returns the resource group name"
  value       = data.azurerm_resource_group.main.name
}

output "virtual_network_name" {
  description = "Returns the name of the virtual network."
  value       = azurerm_virtual_network.main.name
}

output "virtual_network_id" {
  description = "Returns the ID of the virtual network."
  value       = azurerm_virtual_network.main.id
}

output "subnet_ids" {
  description = "Returns a map of the subnet names to the subnet IDs."
  value       = { for subnet in keys(var.subnets) : subnet => azurerm_subnet.main[subnet].id }
}