resource "azurerm_public_ip" "appgw_pip" {
  for_each            = var.application_gateway
  name                = each.value.public_ip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_application_gateway" "appgw" {
  for_each            = var.application_gateway
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "${each.value.name}-gateway-ip-config"
    subnet_id = data.azurerm_subnet.appgw_subnet[each.key].id
  }

  frontend_port {
    name = "${each.value.name}-frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "${each.value.name}-frontend-ip-config"
    public_ip_address_id = azurerm_public_ip.appgw_pip[each.key].id
  }

  backend_address_pool {
    name = "${each.value.name}-backend-pool"
  }

  backend_http_settings {
    name                  = "${each.value.name}-http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "${each.value.name}-listener"
    frontend_ip_configuration_name = "${each.value.name}-frontend-ip-config"
    frontend_port_name             = "${each.value.name}-frontend-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "${each.value.name}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${each.value.name}-listener"
    backend_address_pool_name  = "${each.value.name}-backend-pool"
    backend_http_settings_name = "${each.value.name}-http-settings"
    priority                   = 10
  }
}
