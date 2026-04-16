data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_shared_image_gallery" "sig" {
  name                = var.gallery_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  description         = var.gallery_description

  tags = var.tags
}

resource "azurerm_shared_image" "agent_image" {
  name                = var.gallery_image_name
  gallery_name        = azurerm_shared_image_gallery.sig.name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  os_type             = "Linux"

  identifier {
    publisher = var.gallery_image_publisher
    offer     = var.gallery_image_offer
    sku       = var.gallery_image_sku
  }

  tags = var.tags
}