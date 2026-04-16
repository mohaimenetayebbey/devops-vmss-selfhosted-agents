subscription_id     = "00000000-0000-0000-0000-000000000000"
location            = "westeurope"
resource_group_name = "rg-selfhosted-agents-dev"

gallery_name              = "sigselfhostedagentsdev"
gallery_image_name        = "ubuntu2404-agents"
gallery_description       = "Shared image gallery for Azure DevOps self-hosted agents"
gallery_image_publisher   = "custom"
gallery_image_offer       = "azure-devops-selfhosted-agents"
gallery_image_sku         = "ubuntu"

tags = {
  project     = "selfhosted-agents"
  environment = "dev"
}