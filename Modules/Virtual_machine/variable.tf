variable "virtual_machine" {
    type = map(object({
      name                 = string
      resource_group_name  = string
      location             = string
      nic_name           = string
      size              = string
      admin_username    = string
      admin_password    = string
    }))
  
}