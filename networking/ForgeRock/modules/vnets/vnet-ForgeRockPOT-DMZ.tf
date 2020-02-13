### NSG CODE (Pre-AzureRM 2.0 Provider)
resource "azurerm_network_security_group" "ForgeRock-POTExternal-Collaboration" {
  name                = "NSG-${var.AzureGeoShortName}-ForgeRock-POT-External-Collaboration"
  location            = "${var.ForgeRock-POTNetwork-ResourceGroup-Location}"
  resource_group_name = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"

  tags {
    Resource-ID                    = "${var.Resource-ID}"
    Environment                    = "${var.Environment}"
    CostCenter                     = "${var.CostCenter}"
    Service-Display-Name           = "${var.Service-Display-Name}"
    Cloud-Maturity-Level           = "${var.Cloud-Maturity-Level}"
    Provisioner                    = "${var.Provisioner}"
    //Disaster-Recovery-Service-Tier = "${var.Disaster-Recovery-Service-Tier}"
  }
}


resource "azurerm_network_security_group" "ForgeRock-POTExternal-Presentation" {
  name                = "NSG-${var.AzureGeoShortName}-ForgeRock-POT-External-Presentation"
  location            = "${var.ForgeRock-POTNetwork-ResourceGroup-Location}"
  resource_group_name = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"

  tags {
    Resource-ID                    = "${var.Resource-ID}"
    Environment                    = "${var.Environment}"
    CostCenter                     = "${var.CostCenter}"
    Service-Display-Name           = "${var.Service-Display-Name}"
    Cloud-Maturity-Level           = "${var.Cloud-Maturity-Level}"
    Provisioner                    = "${var.Provisioner}"
    //Disaster-Recovery-Service-Tier = "${var.Disaster-Recovery-Service-Tier}"
  }
}


###




resource "azurerm_virtual_network" "ForgeRock-POTDMZVNET" {
  count               = "${var.Count}"
  name                = "VNET-${var.AzureGeoShortName}-ForgeRock-POT-DMZ-${format("%02d", count.index + 1)}"
  resource_group_name = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"
  address_space       = ["${var.VNetForgeRock-POTDMZAddressSpace}"]
  location            = "${var.ForgeRock-POTNetwork-ResourceGroup-Location}"
  //dns_servers         = ["${var.ForgeRock-POTDNSServer}"]

  tags {
    Resource-ID                    = "${var.Resource-ID}"
    Environment                    = "${var.Environment}"
    CostCenter                     = "${var.CostCenter}"
    Service-Display-Name           = "${var.Service-Display-Name}"
    Cloud-Maturity-Level           = "${var.Cloud-Maturity-Level}"
    Provisioner                    = "${var.Provisioner}"
    //Disaster-Recovery-Service-Tier = "${var.Disaster-Recovery-Service-Tier}"
  }
}



resource "azurerm_subnet" "External-Presentation" {
  name                      = "External-Presentation"
  address_prefix            = "${var.ForgeRock-POTExtPresentationAddressPrefix}"
  resource_group_name       = "${azurerm_virtual_network.ForgeRock-POTVNET.resource_group_name}"
  virtual_network_name      = "${azurerm_virtual_network.ForgeRock-POTDMZVNET.name}"
  network_security_group_id = "${azurerm_network_security_group.ForgeRock-POTExternal-Presentation.id}"
  service_endpoints         = ["${var.ForgeRock-POT-ServiceEndpoints}"]
  route_table_id            = "${azurerm_route_table.UDR-ForgeRock-POT-DMZ.id}"
  //depends_on = ["azurerm_route_table.UDR-ForgeRock-POT"]

}

resource "azurerm_subnet_route_table_association" "External-Presentation-Subnet-RouteTable" { 
  subnet_id      = "${azurerm_subnet.External-Presentation.id}"
  route_table_id = "${azurerm_route_table.UDR-ForgeRock-POT-DMZ.id}"

   }


resource "azurerm_subnet" "External-Collaboration" {
  name                      = "External-Collaboration"
  address_prefix            = "${var.ForgeRock-POTExtCollaborationAddressPrefix}"
  resource_group_name       = "${azurerm_virtual_network.ForgeRock-POTVNET.resource_group_name}"
  virtual_network_name      = "${azurerm_virtual_network.ForgeRock-POTDMZVNET.name}"
 network_security_group_id = "${azurerm_network_security_group.ForgeRock-POTExternal-Collaboration.id}"
  service_endpoints         = ["${var.ForgeRock-POT-ServiceEndpoints}"]
  route_table_id = "${azurerm_route_table.UDR-ForgeRock-POT-DMZ.id}"
   //depends_on = ["azurerm_route_table.UDR-ForgeRock-POT"]
}

resource "azurerm_subnet_route_table_association" "External-Collaboration-Subnet-RouteTable" {
  subnet_id      = "${azurerm_subnet.External-Collaboration.id}"
  route_table_id = "${azurerm_route_table.UDR-ForgeRock-POT-DMZ.id}"
  //depends_on = ["azurerm_subnet.Presentation"]
  
}


resource "azurerm_route_table" "UDR-ForgeRock-POT-DMZ" {
  name                          = "UDR-${var.AzureGeoShortName}-ForgeRock-POT-DMZ-RouteTable"
  location                      = "${var.ForgeRock-POTNetwork-ResourceGroup-Location}"
  resource_group_name           =  "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"
  disable_bgp_route_propagation = "${var.ForgeRock-POTUDR-DisableBGPRoutePropagation}"


tags = {
    Resource-ID                    = "${var.Resource-ID}"
    Environment                    = "${var.Environment}"
    CostCenter                     = "${var.CostCenter}"
    Service-Display-Name           = "${var.Service-Display-Name}"
    Cloud-Maturity-Level           = "${var.Cloud-Maturity-Level}"
    Provisioner                    = "${var.Provisioner}"
  }

  route {
    name                   = "Default-Route" 
    address_prefix         = "${var.ForgeRock-POTUDR-AddressPrefix}"
    next_hop_type          = "${var.ForgeRock-POTUDR-NextHopType}"
    //next_hop_in_ip_address = "${var.ForgeRock-POTUDR-NextHopIPAddress}"
  }
  
}
