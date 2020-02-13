
#Appliction Subnet NSGs

resource "azurerm_network_security_rule" "SandboxApplicationNSGRule_RDPIn" {
  name                                       = "Allow_RDP_Inbound"
  priority                                   = 180
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  destination_port_ranges                    = ["3389", "22"]
  source_address_prefix                      = "VirtualNetwork" 
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxApplication-NSG-Name}"
  description                                = "Allow RDP in"
}


resource "azurerm_network_security_rule" "SandboxApplicationNSGRule_CoreServicesIn" {
  name                                       = "Allow_CoreServices_Inbound"
  priority                                   = 185
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.240.0/22"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxApplication-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxApplicationNSGRule_SubnettoSubnet" {
  name                                       = "Subnet_to_Subnet_Inbound"
  priority                                   = 190
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxApplication-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxApplicationNSGDefaultOverrideInbound" {
  name                                       = "Default_Rule_65000_Overide_Inbound"
  priority                                   = 3000
  direction                                  = "Inbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxApplication-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxApplicationTrafficCathcer" {
  name                                       = "Traffic_Catcher_Inbound"
  priority                                   = 3005
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "AzureLoadBalancer"
  destination_port_range                     = "*"
  destination_address_prefix                 = "*"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxApplication-NSG-Name}"
  description                                = "Traffic Catcher Inbound"
}

resource "azurerm_network_security_rule" "SandboxApplicationNSGRule_CoreServicesout" {
  name                                       = "Allow_CoreServices_Outbound"
  priority                                   = 185
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.240.0/22"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxApplication-NSG-Name}"
  description                                = "Allow CoreServices Outbound"

}


resource "azurerm_network_security_rule" "SandboxApplicationNSGRule_SubnettoSubnetout" {
  name                                       = "Subnet_to_Subnet_Outbound"
  priority                                   = 190
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxApplication-NSG-Name}"
  description                                = "Allow Subnet to Subnet Outbound"

}

resource "azurerm_network_security_rule" "SandboxApplicationNSGDefaultOverrideOutbound" {
  name                                       = "Default_Rule_65000_Overide_Outbound"
  priority                                   = 3000
  direction                                  = "Outbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxApplication-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxApplicationNSGAllowInternetOutbound" {
  name                                       = "Allow_Internet_Outbound"
  priority                                   = 4000
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "Internet"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxApplication-NSG-Name}"
  description                                = "Allow Internet traffic"

}


## Database Subnet NSGs

resource "azurerm_network_security_rule" "SandboxDatabaseNSGRule_RDPIn" {
  name                                       = "Allow_RDP_Inbound"
  priority                                   = 180
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  destination_port_ranges                    = ["3389", "22"]
  source_address_prefix                      = "VirtualNetwork" 
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxDatabase-NSG-Name}"
  description                                = "Allow RDP in"
}



resource "azurerm_network_security_rule" "SandboxDatabaseNSGRule_CoreServicesIn" {
  name                                       = "Allow_CoreServices_Inbound"
  priority                                   = 185
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.240.0/22"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxDatabase-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxDatabaseNSGRule_SubnettoSubnet" {
  name                                       = "Subnet_to_Subnet_Inbound"
  priority                                   = 190
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxDatabase-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxDatabaseNSGDefaultOverrideInbound" {
  name                                       = "Default_Rule_65000_Overide_Inbound"
  priority                                   = 3000
  direction                                  = "Inbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxDatabase-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxDatabaseTrafficCathcer" {
  name                                       = "Traffic_Catcher_Inbound"
  priority                                   = 3005
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "AzureLoadBalancer"
  destination_port_range                     = "*"
  destination_address_prefix                 = "*"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxDatabase-NSG-Name}"
  description                                = "Traffic Catcher Inbound"
}

resource "azurerm_network_security_rule" "SandboxDatabaseNSGRule_CoreServicesout" {
  name                                       = "Allow_CoreServices_Outbound"
  priority                                   = 185
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.240.0/22"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxDatabase-NSG-Name}"
  description                                = "Allow CoreServices Outbound"

}


resource "azurerm_network_security_rule" "SandboxDatabaseNSGRule_SubnettoSubnetout" {
  name                                       = "Subnet_to_Subnet_Outbound"
  priority                                   = 190
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxDatabase-NSG-Name}"
  description                                = "Allow Subnet to Subnet Outbound"

}

resource "azurerm_network_security_rule" "SandboxDatabaseNSGDefaultOverrideOutbound" {
  name                                       = "Default_Rule_65000_Overide_Outbound"
  priority                                   = 3000
  direction                                  = "Outbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxDatabase-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxDatabaseNSGAllowInternetOutbound" {
  name                                       = "Allow_Internet_Outbound"
  priority                                   = 4000
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "Internet"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxDatabase-NSG-Name}"
  description                                = "Allow Internet traffic"

}

resource "azurerm_network_security_rule" "SandboxPresentationNSGRule_RDPIn" {
  name                                       = "Allow_RDP_Inbound"
  priority                                   = 180
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  destination_port_ranges                    = ["3389", "22"]
  source_address_prefix                      = "VirtualNetwork" 
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxPresentation-NSG-Name}"
  description                                = "Allow RDP in"
}


resource "azurerm_network_security_rule" "SandboxPresentationNSGRule_CoreServicesIn" {
  name                                       = "Allow_CoreServices_Inbound"
  priority                                   = 185
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.240.0/22"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxPresentation-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxPresentationNSGRule_SubnettoSubnet" {
  name                                       = "Subnet_to_Subnet_Inbound"
  priority                                   = 190
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxPresentation-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxPresentationNSGDefaultOverrideInbound" {
  name                                       = "Default_Rule_65000_Overide_Inbound"
  priority                                   = 3000
  direction                                  = "Inbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxPresentation-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxPresentationTrafficCathcer" {
  name                                       = "Traffic_Catcher_Inbound"
  priority                                   = 3005
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "AzureLoadBalancer"
  destination_port_range                     = "*"
  destination_address_prefix                 = "*"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxPresentation-NSG-Name}"
  description                                = "Traffic Catcher Inbound"
}

resource "azurerm_network_security_rule" "SandboxPresentationNSGRule_CoreServicesout" {
  name                                       = "Allow_CoreServices_Outbound"
  priority                                   = 185
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.240.0/22"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxPresentation-NSG-Name}"
  description                                = "Allow CoreServices Outbound"

}


resource "azurerm_network_security_rule" "SandboxPresentationNSGRule_SubnettoSubnetout" {
  name                                       = "Subnet_to_Subnet_Outbound"
  priority                                   = 190
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxPresentation-NSG-Name}"
  description                                = "Allow Subnet to Subnet Outbound"

}

resource "azurerm_network_security_rule" "SandboxPresentationNSGDefaultOverrideOutbound" {
  name                                       = "Default_Rule_65000_Overide_Outbound"
  priority                                   = 3000
  direction                                  = "Outbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxPresentation-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxPresentationNSGAllowInternetOutbound" {
  name                                       = "Allow_Internet_Outbound"
  priority                                   = 4000
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "Internet"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxPresentation-NSG-Name}"
  description                                = "Allow Internet traffic"

}

resource "azurerm_network_security_rule" "SandboxExtPresentationNSGRule_RDPIn" {
  name                                       = "Allow_RDP_Inbound"
  priority                                   = 180
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  destination_port_ranges                    = ["3389", "22"]
  source_address_prefix                      = "VirtualNetwork" 
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtPresentation-NSG-Name}"
  description                                = "Allow RDP in"
}


resource "azurerm_network_security_rule" "SandboxExtPresentationNSGRule_CoreServicesIn" {
  name                                       = "Allow_CoreServices_Inbound"
  priority                                   = 185
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.240.0/22"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtPresentation-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxExtPresentationNSGRule_SubnettoSubnet" {
  name                                       = "Subnet_to_Subnet_Inbound"
  priority                                   = 190
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtPresentation-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxExtPresentationNSGDefaultOverrideInbound" {
  name                                       = "Default_Rule_65000_Overide_Inbound"
  priority                                   = 3000
  direction                                  = "Inbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtPresentation-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxExtPresentationTrafficCathcer" {
  name                                       = "Traffic_Catcher_Inbound"
  priority                                   = 3005
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "AzureLoadBalancer"
  destination_port_range                     = "*"
  destination_address_prefix                 = "*"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtPresentation-NSG-Name}"
  description                                = "Traffic Catcher Inbound"
}

resource "azurerm_network_security_rule" "SandboxExtPresentationNSGRule_CoreServicesout" {
  name                                       = "Allow_CoreServices_Outbound"
  priority                                   = 185
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.240.0/22"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtPresentation-NSG-Name}"
  description                                = "Allow CoreServices Outbound"

}


resource "azurerm_network_security_rule" "SandboxExtPresentationNSGRule_SubnettoSubnetout" {
  name                                       = "Subnet_to_Subnet_Outbound"
  priority                                   = 190
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtPresentation-NSG-Name}"
  description                                = "Allow Subnet to Subnet Outbound"

}

resource "azurerm_network_security_rule" "SandboxExtPresentationNSGDefaultOverrideOutbound" {
  name                                       = "Default_Rule_65000_Overide_Outbound"
  priority                                   = 3000
  direction                                  = "Outbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtPresentation-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxExtPresentationNSGAllowInternetOutbound" {
  name                                       = "Allow_Internet_Outbound"
  priority                                   = 4000
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "Internet"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtPresentation-NSG-Name}"
  description                                = "Allow Internet traffic"

}

resource "azurerm_network_security_rule" "SandboxExtCollaborationNSGRule_RDPIn" {
  name                                       = "Allow_RDP_Inbound"
  priority                                   = 180
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  destination_port_ranges                    = ["3389", "22"]
  source_address_prefix                      = "VirtualNetwork" 
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtCollaboration-NSG-Name}"
  description                                = "Allow RDP in"
}


resource "azurerm_network_security_rule" "SandboxExtCollaborationNSGRule_CoreServicesIn" {
  name                                       = "Allow_CoreServices_Inbound"
  priority                                   = 185
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.240.0/22"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtCollaboration-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxExtCollaborationNSGRule_SubnettoSubnet" {
  name                                       = "Subnet_to_Subnet_Inbound"
  priority                                   = 190
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtCollaboration-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxExtCollaborationNSGDefaultOverrideInbound" {
  name                                       = "Default_Rule_65000_Overide_Inbound"
  priority                                   = 3000
  direction                                  = "Inbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtCollaboration-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxExtCollaborationTrafficCathcer" {
  name                                       = "Traffic_Catcher_Inbound"
  priority                                   = 3005
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "AzureLoadBalancer"
  destination_port_range                     = "*"
  destination_address_prefix                 = "*"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtCollaboration-NSG-Name}"
  description                                = "Traffic Catcher Inbound"
}

resource "azurerm_network_security_rule" "SandboxExtCollaborationNSGRule_CoreServicesout" {
  name                                       = "Allow_CoreServices_Outbound"
  priority                                   = 185
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.240.0/22"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtCollaboration-NSG-Name}"
  description                                = "Allow CoreServices Outbound"

}


resource "azurerm_network_security_rule" "SandboxExtCollaborationNSGRule_SubnettoSubnetout" {
  name                                       = "Subnet_to_Subnet_Outbound"
  priority                                   = 190
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtCollaboration-NSG-Name}"
  description                                = "Allow Subnet to Subnet Outbound"

}

resource "azurerm_network_security_rule" "SandboxExtCollaborationNSGDefaultOverrideOutbound" {
  name                                       = "Default_Rule_65000_Overide_Outbound"
  priority                                   = 3000
  direction                                  = "Outbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtCollaboration-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxExtCollaborationNSGAllowInternetOutbound" {
  name                                       = "Allow_Internet_Outbound"
  priority                                   = 4000
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "Internet"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxExtCollaboration-NSG-Name}"
  description                                = "Allow Internet traffic"

}

resource "azurerm_network_security_rule" "SandboxAKS01NSGRule_RDPIn" {
  name                                       = "Allow_RDP_Inbound"
  priority                                   = 180
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  destination_port_ranges                    = ["3389", "22"]
  source_address_prefix                      = "VirtualNetwork" 
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS01-NSG-Name}"
  description                                = "Allow RDP in"
}


resource "azurerm_network_security_rule" "SandboxAKS01NSGRule_CoreServicesIn" {
  name                                       = "Allow_CoreServices_Inbound"
  priority                                   = 185
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.240.0/22"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS01-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxAKS01NSGRule_SubnettoSubnet" {
  name                                       = "Subnet_to_Subnet_Inbound"
  priority                                   = 190
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS01-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxAKS01NSGDefaultOverrideInbound" {
  name                                       = "Default_Rule_65000_Overide_Inbound"
  priority                                   = 3000
  direction                                  = "Inbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS01-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxAKS01TrafficCathcer" {
  name                                       = "Traffic_Catcher_Inbound"
  priority                                   = 3005
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "AzureLoadBalancer"
  destination_port_range                     = "*"
  destination_address_prefix                 = "*"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS01-NSG-Name}"
  description                                = "Traffic Catcher Inbound"
}

resource "azurerm_network_security_rule" "SandboxAKS01NSGRule_CoreServicesout" {
  name                                       = "Allow_CoreServices_Outbound"
  priority                                   = 185
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.240.0/22"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS01-NSG-Name}"
  description                                = "Allow CoreServices Outbound"

}


resource "azurerm_network_security_rule" "SandboxAKS01NSGRule_SubnettoSubnetout" {
  name                                       = "Subnet_to_Subnet_Outbound"
  priority                                   = 190
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS01-NSG-Name}"
  description                                = "Allow Subnet to Subnet Outbound"

}

resource "azurerm_network_security_rule" "SandboxAKS01NSGDefaultOverrideOutbound" {
  name                                       = "Default_Rule_65000_Overide_Outbound"
  priority                                   = 3000
  direction                                  = "Outbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS01-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxAKS01NSGAllowInternetOutbound" {
  name                                       = "Allow_Internet_Outbound"
  priority                                   = 4000
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "Internet"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS01-NSG-Name}"
  description                                = "Allow Internet traffic"

}

resource "azurerm_network_security_rule" "SandboxAKS02NSGRule_RDPIn" {
  name                                       = "Allow_RDP_Inbound"
  priority                                   = 180
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  destination_port_ranges                    = ["3389", "22"]
  source_address_prefix                      = "VirtualNetwork" 
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS02-NSG-Name}"
  description                                = "Allow RDP in"
}


resource "azurerm_network_security_rule" "SandboxAKS02NSGRule_CoreServicesIn" {
  name                                       = "Allow_CoreServices_Inbound"
  priority                                   = 185
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.240.0/22"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS02-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxAKS02NSGRule_SubnettoSubnet" {
  name                                       = "Subnet_to_Subnet_Inbound"
  priority                                   = 190
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS02-NSG-Name}"
  description                                = "Allow CoreServices Inbound"

}

resource "azurerm_network_security_rule" "SandboxAKS02NSGDefaultOverrideInbound" {
  name                                       = "Default_Rule_65000_Overide_Inbound"
  priority                                   = 3000
  direction                                  = "Inbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS02-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxAKS02TrafficCathcer" {
  name                                       = "Traffic_Catcher_Inbound"
  priority                                   = 3005
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "AzureLoadBalancer"
  destination_port_range                     = "*"
  destination_address_prefix                 = "*"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS02-NSG-Name}"
  description                                = "Traffic Catcher Inbound"
}

resource "azurerm_network_security_rule" "SandboxAKS02NSGRule_CoreServicesout" {
  name                                       = "Allow_CoreServices_Outbound"
  priority                                   = 185
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.240.0/22"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS02-NSG-Name}"
  description                                = "Allow CoreServices Outbound"

}


resource "azurerm_network_security_rule" "SandboxAKS02NSGRule_SubnettoSubnetout" {
  name                                       = "Subnet_to_Subnet_Outbound"
  priority                                   = 190
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "10.180.128.0/18"
  destination_port_range                     = "*"
  destination_address_prefix                 = "10.180.128.0/18"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS02-NSG-Name}"
  description                                = "Allow Subnet to Subnet Outbound"

}

resource "azurerm_network_security_rule" "SandboxAKS02NSGDefaultOverrideOutbound" {
  name                                       = "Default_Rule_65000_Overide_Outbound"
  priority                                   = 3000
  direction                                  = "Outbound"
  access                                     = "Deny"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "VirtualNetwork"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS02-NSG-Name}"
  description                                = "Default_Rule_65000_Overide"

}

resource "azurerm_network_security_rule" "SandboxAKS02NSGAllowInternetOutbound" {
  name                                       = "Allow_Internet_Outbound"
  priority                                   = 4000
  direction                                  = "Outbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  source_address_prefix                      = "VirtualNetwork"
  destination_port_range                     = "*"
  destination_address_prefix                 = "Internet"
  resource_group_name                        = "${var.SandboxNetwork-ResourceGroup-Name}"
  network_security_group_name                = "${var.SandboxAKS02-NSG-Name}"
  description                                = "Allow Internet traffic"

}







