output "subnet_ips" {
  value       = azurerm_virtual_network.vnet.subnet[*].address_prefixes
  description = "IPs of the subnets"
}