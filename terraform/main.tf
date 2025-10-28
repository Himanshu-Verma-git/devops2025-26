resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "networking" {
  source                  = "./modules/networking"
  resource_name_prefix    = var.resource_name_prefix
  location                = var.location
  resource_group_name     = var.resource_group_name
  tags                    = var.tags
  vnet_address_space      = var.vnet_address_space
  public_subnet_prefixes  = var.public_subnet_prefixes
  private_subnet_prefixes = var.private_subnet_prefixes
  # agw_subnet_prefixes = var.agw_subnet_prefixes
}

module "application-gateway" {
  source               = "./modules/appgw"
  resource_name_prefix = var.resource_name_prefix
  location             = var.location
  resource_group_name  = var.resource_group_name
  subnet_id            = module.networking.public_subnet_ids[0]
  sku_capacity = var.sku_capacity
  frontend_port_name = var.frontend_port_name
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  backend_address_pool_name = var.backend_address_pool_name
  backend_http_settings_name = var.backend_http_settings_name
  http_listener_name = var.http_listener_name
  request_routing_rule_name = var.request_routing_rule_name
  # subnet_id = module.networking.azurerm_subnet.public[0].id
  tags                 = var.tags
  agw_pip_id = module.appgw.agw_pip.id
  priority = var.priority
}

module "compute" {
  source                                       = "./modules/compute"
  resource_name_prefix                         = var.resource_name_prefix
  location                                     = var.location
  resource_group_name                          = var.resource_group_name
  subnet_id                                    = module.networking.private_subnet_ids[0]
  tags                                         = var.tags
  environment                                  = var.environment
  admin_username                               = var.admin_username
  admin_password                               = var.admin_password
  application_gateway_backend_address_pool_ids = module.application-gateway.agw_backend_address_pool_id
  docker_image                                 = var.docker_image
  instance_count = var.instance_count
  source_image = var.source_image
}
