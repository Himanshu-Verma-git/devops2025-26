resource_group_name = var.backend_resource_group_name
storage_account_name = var.backend_storage_account_name
container_name       = var.backend_container_name
key                  = var.backend_key
# resource_group_name = "backend-rg"
# storage_account_name = "midsem26211"                                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
# container_name       = "tfstate"                                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
# key                  = "terraform.tfstate"  
# access_key           = "abcdefghijklmnopqrstuvwxyz0123456789..."  # Can also be set via `ARM_ACCESS_KEY` environment variable.

resource_group_name  = "rg-${var.environment}-tfstate"
storage_account_name = "tfstate${var.environment}store"
container_name       = "tfstate"
key                  = "${var.environment}.terraform.tfstate"
