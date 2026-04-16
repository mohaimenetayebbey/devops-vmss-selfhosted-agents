output "gallery_name" {
  value = azurerm_shared_image_gallery.sig.name
}

output "gallery_id" {
  value = azurerm_shared_image_gallery.sig.id
}

output "image_definition_name" {
  value = azurerm_shared_image.agent_image.name
}

output "image_definition_id" {
  value = azurerm_shared_image.agent_image.id
}