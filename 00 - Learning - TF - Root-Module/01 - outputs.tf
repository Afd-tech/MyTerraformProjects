 #$Output variable definitions

output "root_resource_group_id" {
  description = "resource group id"
  value       = module.Azure-Website.resource_group_id
}
output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.Azure-Website.resource_group_name
}
output "resource_group_location" {
  description = "resource group location"
  value       = module.Azure-Website.resource_group_location
}
output "storage_account_id" {
  description = "storage account id"
  value       = module.Azure-Website.storage_account_id
}
output "storage_account_name" {
  description = "storage account name"
  value       = module.Azure-Website.storage_account_name
}
