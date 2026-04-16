subscription_id       = "00000000-0000-0000-0000-000000000000"
location              = "westeurope"
resource_group_name   = "rg-selfhosted-agents-dev"

vnet_resource_group_name = "rg-network-dev"
vnet_name                = "vnet-shared-dev"
subnet_name              = "snet-agents"

gallery_name           = "sigselfhostedagentsdev"
gallery_image_name     = "ubuntu2404-agents"
gallery_image_version  = "latest"

vmss_name      = "vmss-selfhosted-dev"
vmss_sku       = "Standard_F2s_v2"
vmss_instances = 0

admin_username       = "azureuser"
admin_ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQ..."

tags = {
  project     = "selfhosted-agents"
  environment = "dev"
}