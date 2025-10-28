# GLOBAL
resource_name_prefix = "dev"
location = "Central India"
resource_group_name = "rg-dev-01"
tags = {
  environment = "dev"
  pipeline = "try"
  project     = "midsem-project"
}
environment = "dev"


# NETWORKING
vnet_address_space = "10.0.0.0/16"
public_subnet_prefixes = ["10.0.1.0/24"]
private_subnet_prefixes = ["10.0.2.0/24"]
# agw_subnet_prefixes = "10.0.3.0/24"

# COMPUTE
admin_username = "azureuser"
admin_password = "pass@1234"
docker_image = "nginx:latest"
instance_count = 2
source_image = {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "18.04-LTS"
  version   = "latest"
}

# APPLICATION - GATEWAY
sku_capacity = 2
frontend_port_name = "appGatewayFrontendPort"
frontend_ip_configuration_name = "appGatewayFrontendIP"
backend_address_pool_name = "appGatewayBackendPool"
backend_http_settings_name = "appGatewayBackendHttpSettings"
http_listener_name = "appGatewayHttpListener"
request_routing_rule_name = "appGatewayRequestRoutingRule"
priority = 100

# BACKEND
backend_resource_group_name  = "backend-rg"
backend_storage_account_name = "midsem26211"
backend_container_name       = "tfstate"
backend_key                  = "terraform.tfstate"