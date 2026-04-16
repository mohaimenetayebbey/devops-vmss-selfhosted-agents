# 🚀 Azure DevOps Private Self-Hosted Agents on VMSS

This repository provides a complete implementation of **fully private Azure DevOps self-hosted agents** using:

- Azure Virtual Machine Scale Sets (VMSS)
- Azure Compute Gallery (Shared Image Gallery)
- Packer for image creation
- Terraform for infrastructure deployment
- Azure DevOps pipelines for automation

--
## 📖 Full Article

👉 [Read the full article](#)

This repository accompanies the article and provides all the code used in the implementation.

---

## 🎯 Goal

The goal of this repository is to demonstrate how to build a **secure, scalable, and reproducible DevOps agent platform** where:

- All compute runs inside your **private Azure network**
- Agents are **built from custom images**
- Infrastructure is fully managed as code
- Pipelines run on **controlled and versioned environments**

This approach removes the limitations of Microsoft-hosted agents and enables:
- Private resource access (VNet, private endpoints, on-prem)
- Full control over tooling and runtime
- Improved security and compliance

---

## 🧱 Repository content

### 🏗️ Infrastructure (Terraform)

- Azure Compute Gallery
- Image definitions and versions
- Virtual Machine Scale Set (VMSS)
- Supporting resources (networking, identities if needed)

---

### ⚙️ Image build (Packer)

- Packer templates for building custom agent images
- Pre-installed tools (Terraform, kubectl, Docker, etc.)
- Integration with Azure Compute Gallery

---

### 🔄 Pipelines (Azure DevOps)

#### Image build pipeline
- Runs Packer to build and publish images
- Uses a service principal (SPN) for authentication

#### Infrastructure deployment pipeline
- Runs Terraform `plan` and `apply`
- Deploys VMSS and related resources
- Links infrastructure to image versions

##### `pipelines/deploy-sig.yml` and `pipelines/deploy-vmss.yml` optional improvement

Add a Terraform install step before the AzureCLI task if you do not want to depend on agent image contents.

Example:

```yaml
- script: |
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update
    sudo apt-get install -y terraform
  displayName: Install Terraform
---

## 🔁 High-level flow

```text
Packer → Azure Compute Gallery → VMSS → Azure DevOps Agent Pool → Pipelines