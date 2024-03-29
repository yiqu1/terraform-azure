resource "azurerm_public_ip" "frontend" {
  name                = "tf-public-ip"
  location            = azurerm_resource_group.terraform_sample.location
  resource_group_name = azurerm_resource_group.terraform_sample.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "frontend" {
  name                = "tf-lb"
  location            = azurerm_resource_group.terraform_sample.location
  resource_group_name = azurerm_resource_group.terraform_sample.name
  frontend_ip_configuration {
    name                          = "default"
    public_ip_address_id          = azurerm_public_ip.frontend.id
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_lb_probe" "port80" {
  name            = "tf-lb-probe-80"
  loadbalancer_id = azurerm_lb.frontend.id
  protocol        = "Http"
  request_path    = "/"
  port            = 80
}

resource "azurerm_lb_rule" "port80" {
  name                           = "tf-lb-rule-80"
  loadbalancer_id                = azurerm_lb.frontend.id
  backend_address_pool_ids       = ["${azurerm_lb_backend_address_pool.frontend.id}"]
  probe_id                       = azurerm_lb_probe.port80.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "default"
}

# route incoming traffic to the backend pool of the load balancer
resource "azurerm_lb_backend_address_pool" "frontend" { # load balancer sends traffic to
  name            = "tf-lb-pool"
  loadbalancer_id = azurerm_lb.frontend.id
}

# network interfaces are the backend resources that will receive the traffic
resource "azurerm_network_interface_backend_address_pool_association" "frontend" {
  count                   = var.arm_frontend_instances
  network_interface_id    = azurerm_network_interface.frontend[count.index].id
  ip_configuration_name   = "tf-ip-${count.index}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.frontend.id
}
