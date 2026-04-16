data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_resource_group_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = var.vnet_resource_group_name
}

data "azurerm_shared_image_gallery" "sig" {
  name                = var.gallery_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_shared_image" "agent_image" {
  name                = var.gallery_image_name
  gallery_name        = data.azurerm_shared_image_gallery.sig.name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_shared_image_version" "agent_image_version" {
  name                = var.gallery_image_version
  image_name          = data.azurerm_shared_image.agent_image.name
  gallery_name        = data.azurerm_shared_image_gallery.sig.name
  resource_group_name = data.azurerm_resource_group.rg.name
}


resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = var.vmss_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  sku                 = var.vmss_sku
  instances           = var.vmss_instances
  admin_username      = var.admin_username

  disable_password_authentication = var.disable_password_authentication
  upgrade_mode                    = var.upgrade_mode
  overprovision                   = false

  source_image_id = data.azurerm_shared_image_version.agent_image_version.id

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_public_key
  }

  os_disk {
    storage_account_type = var.os_disk_storage_account_type
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "${var.vmss_name}-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = data.azurerm_subnet.subnet.id
    }
  }

  boot_diagnostics {}

  tags = var.tags
}