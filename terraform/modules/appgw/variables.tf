variable "resource_name_prefix" {
  description = "Prefix for all resources created"
  type        = string
}

variable "resource_group_name" {
  description = "resource group"
  type        = string
}

variable "location" {
  description = "Azure region for all resources"
  type        = string

}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {}

}

# variable "agw_pip_id" {
#   description = "PIP agw"
#   type        = string
# }

variable "sku_capacity" {
  description = "number of skus"
  type = number
}
variable "backend_address_pool_name" {
  description = "Name of the backend address pool"
  type        = string
}

variable "frontend_port_name"{
  description = "Name of the frontend port"
  type        = string
}

variable "frontend_ip_configuration_name"{
  description = "Name of the frontend ip configuration"
  type        = string
}

variable "backend_http_settings_name" {
  description = "value"
  type = string
}

# variable "frontend_port_name" {
#   description = "value"
#   type = string
# }

# variable "frontend_ip_configuration_name" {
#   description = "value"
#   type = string 
# }

variable "http_listener_name" {
  description = "value"
  type = string
}

variable "request_routing_rule_name" {
  description = "value"
  type = string
}

variable "priority" {
  description = "value"
  type = number
}

# variable "backend_http_settings_name" {
#   description = "value"
#   type = string
# }


