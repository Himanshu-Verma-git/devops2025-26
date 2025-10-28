
resource "azurerm_application_gateway" "main" {
  name                = "${var.resource_name_prefix}-agw"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = var.sku_capacity
  }

  gateway_ip_configuration {
    name      = "appgw-ip-config"
    subnet_id = var.subnet_id
  }

  frontend_port {
    # name = "frontendPort"
    name = var.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    # name                 = "appgw-frontend-ip"
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = var.agw_pip_id
  }

  backend_address_pool {
    # name = "vmss-backend-pool"
    name = var.backend_address_pool_name
  }

  backend_http_settings {
    # name                  = "http-settings"
    name                  = var.backend_http_settings_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
    # probe_name = "health-probe"
  }

  http_listener {
    # name                           = "appgw-http-listener"
    name                           = var.http_listener_name
    frontend_ip_configuration_name = var.frontend_ip_configuration_name
    # frontend_ip_configuration_id   = azurerm_application_gateway.main.frontend_ip_configuration[0].id
    frontend_port_name = var.frontend_port_name
    protocol           = "Http"
  }

  request_routing_rule {
    name                       = var.request_routing_rule_name
    priority = 100
    rule_type                  = "Basic"
    http_listener_name         = var.http_listener_name
    backend_address_pool_name  = var.backend_address_pool_name
    backend_http_settings_name = var.backend_http_settings_name
  }
  # probe {
  #   name                = "health-probe"
  #   protocol            = "Http"
  #   host                = "localhost"
  #   path                = "/"
  #   interval            = 30
  #   timeout             = 30
  #   unhealthy_threshold = 3
  #   match {
  #     status_codes = ["200-399"]
  #   }
  # }
  tags = var.tags
}

resource "azurerm_public_ip" "agw_pip" {
  name                = "${var.resource_name_prefix}-agw-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}