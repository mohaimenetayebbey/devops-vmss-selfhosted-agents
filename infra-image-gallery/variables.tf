#####################################
# Variables
#####################################

variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "gallery_name" {
  type = string
}

variable "gallery_image_name" {
  type = string
}

variable "gallery_description" {
  type    = string
  default = "Shared image gallery for Azure DevOps self-hosted agents"
}

variable "gallery_image_publisher" {
  type    = string
  default = "custom"
}

variable "gallery_image_offer" {
  type    = string
  default = "azure-devops-selfhosted-agents"
}

variable "gallery_image_sku" {
  type    = string
  default = "ubuntu"
}

variable "location" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}