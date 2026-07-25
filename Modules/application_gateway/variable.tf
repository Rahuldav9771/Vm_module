variable "application_gateway" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    subnet_name          = string
    virtual_network_name = string
    public_ip_name       = string
  }))
}
