variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vnet_resource_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "gallery_name" {
  type = string
}

variable "gallery_image_name" {
  type = string
}

variable "gallery_image_version" {
  type = string
}

variable "vmss_name" {
  type = string
}

variable "vmss_sku" {
  type    = string
  default = "Standard_F2s_v2"
}

variable "vmss_instances" {
  type    = number
  default = 0
}

variable "location" {
  type = string
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "disable_password_authentication" {
  type    = bool
  default = true
}

variable "admin_ssh_public_key" {
  type = string
}

variable "os_disk_storage_account_type" {
  type    = string
  default = "StandardSSD_LRS"
}

variable "upgrade_mode" {
  type    = string
  default = "Manual"
}

variable "tags" {
  type    = map(string)
  default = {}
}

