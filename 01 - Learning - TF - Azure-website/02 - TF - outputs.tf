# Output variable definitions
output "resource_group_id" {
  description = "resource group id"
  value       = data.azurerm_resource_group.tfexistingRG.id
}
output "resource_group_name" {
  description = "The name of the resource group"
  value       = data.azurerm_resource_group.tfexistingRG.name
}
output "resource_group_location" {
  description = "resource group location"
  value       = data.azurerm_resource_group.tfexistingRG.location
}
output "storage_account_id" {
  description = "storage account id"
  value       = azurerm_storage_account.tfrsta.id
}
output "storage_account_name" {
  description = "storage account name"
  value       = azurerm_storage_account.tfrsta.name
}
