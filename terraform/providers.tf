terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }

  backend "azurerm" {
    resource_group_name = "backend-rg"
    # access_key           = "abcdefghijklmnopqrstuvwxyz0123456789..."  # Can also be set via `ARM_ACCESS_KEY` environment variable.
    storage_account_name = "midsem26211"                                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "terraform.tfstate"                   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  subscription_id = "81636ff2-7700-48a9-8aa6-9270d1bc92ae"
  features {}
}