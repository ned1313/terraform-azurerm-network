variable "resource_group_name" {
  description = "(Optional) The name of the resource group to create the VNet in. Defaults to VNet name."
  type        = string
  default     = null
}

variable "location" {
  type        = string
  description = "(Optional) Region for Azure resources, defaults to East US."
  default     = "eastus"
}

variable "vnet_name" {
  type        = string
  description = "(Required) The name of the virtual network."
}

variable "vnet_address_space" {
  type        = list(string)
  description = "(Optional) Address space for virtual network, defaults to 10.0.0.0/16."
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  type        = map(string)
  description = "(Optional) Name and address space for subnets, defaults to subnet1 and 10.0.0.0/24."
  default     = { subnet1 = "10.0.0.0/24" }
}

variable "common_tags" {
  type        = map(string)
  description = "(Optional) Tags to apply to all resources."
  default     = {}
}