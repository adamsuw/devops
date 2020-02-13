# Configure Terraform Workspace
terraform {
  required_version = "0.11.14"

  backend "remote" {
    hostname     = "terraform.platform.manulife.io"
    organization = "MFC-Cloud-2-Networking"

    workspaces {
      name = "vnets-cac-ForgeRock-POT-6731"
    }
  }
}

# Configure Azure Provider
provider "azurerm" {
  version         = "~> 1.37.0"
  tenant_id       = "5d3e2773-e07f-4432-a630-1a0f68a28a05"
  subscription_id = "${var.SubscriptionID}"
  client_id       = "ed4e731b-970f-4cf0-b0cd-63214b3b784b"
  client_secret   = "kHmhabYAPSYGIMDXqLsoncmq2Wp8qTsKQNFCnjxYgnA="
}

/*
provider "azurerm" {
  alias           = "core"
   tenant_id       = "5d3e2773-e07f-4432-a630-1a0f68a28a05"
  subscription_id = "391e38fd-83c2-4f86-9b88-9513ed4f1add"
  client_id       = "ed4e731b-970f-4cf0-b0cd-63214b3b784b"
  client_secret   = "kHmhabYAPSYGIMDXqLsoncmq2Wp8qTsKQNFCnjxYgnA="


}
*/