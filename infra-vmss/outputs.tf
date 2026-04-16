output "vmss_name" {
  value = azurerm_linux_virtual_machine_scale_set.vmss.name
}

output "vmss_id" {
  value = azurerm_linux_virtual_machine_scale_set.vmss.id
}

output "vmss_image_id" {
  value = data.azurerm_shared_image_version.agent_image_version.id
}