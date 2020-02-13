### NSG CODE (Pre-AzureRM 2.0 Provider)
resource "azurerm_network_security_group" "ForgeRock-POTAKS01" {
  name                = "NSG-${var.AzureGeoShortName}-ForgeRock-POT-AKS01"
  location            = "${var.ForgeRock-POTNetwork-ResourceGroup-Location}"
  resource_group_name = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"

  tags {
    Resource-ID                    = "${var.Resource-ID}"
    Environment                    = "${var.Environment}"
    Service-Display-Name           = "${var.Service-Display-Name}"
    Cloud-Maturity-Level           = "${var.Cloud-Maturity-Level}"
    Provisioner                    = "${var.Provisioner}"
    //Disaster-Recovery-Service-Tier = "${var.Disaster-Recovery-Service-Tier}"
  }
}



resource "azurerm_network_security_group" "ForgeRock-POTAKS02" {
  name                = "NSG-${var.AzureGeoShortName}-ForgeRock-POT-AKS02"
  location            = "${var.ForgeRock-POTNetwork-ResourceGroup-Location}"
  resource_group_name = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"

  tags {
    Resource-ID                    = "${var.Resource-ID}"
    Environment                    = "${var.Environment}"
    Service-Display-Name           = "${var.Service-Display-Name}"
    Cloud-Maturity-Level           = "${var.Cloud-Maturity-Level}"
    Provisioner                    = "${var.Provisioner}"
    //Disaster-Recovery-Service-Tier = "${var.Disaster-Recovery-Service-Tier}"
  }
}


###




resource "azurerm_virtual_network" "ForgeRock-POTPaaSVNET" {
  count               = "${var.Count}"
  name                = "VNET-${var.AzureGeoShortName}-ForgeRock-POT-PaaS-${format("%02d", count.index + 1)}"
  resource_group_name = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"
  address_space       = ["${var.VNetForgeRock-POTPaaSAddressSpace}"]
  location            = "${var.ForgeRock-POTNetwork-ResourceGroup-Location}"
  //dns_servers         = ["${var.ForgeRock-POTDNSServer}"]

  tags {
    Resource-ID                    = "${var.Resource-ID}"
    Environment                    = "${var.Environment}"
    Service-Display-Name           = "${var.Service-Display-Name}"
    Cloud-Maturity-Level           = "${var.Cloud-Maturity-Level}"
    Provisioner                    = "${var.Provisioner}"
    //Disaster-Recovery-Service-Tier = "${var.Disaster-Recovery-Service-Tier}"
  }
}



/*
resource "azurerm_subnet" "ForgeRock-POTPaaSGateway" {
  name                 = "GatewaySubnet"
  address_prefix       =  "${var.ForgeRock-POTPaaSGatewayAddressPrefix}"
  resource_group_name  = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"
  virtual_network_name = "${azurerm_virtual_network.ForgeRock-POTPaaSVNET.name}"
}
*/
resource "azurerm_subnet" "AKS01" {
  name                      = "AKS01"
  address_prefix            = "${var.ForgeRock-POTAKS01AddressPrefix}"
  resource_group_name       = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"
  virtual_network_name      = "${azurerm_virtual_network.ForgeRock-POTPaaSVNET.name}"
  network_security_group_id = "${azurerm_network_security_group.ForgeRock-POTAKS01.id}"
  service_endpoints         = ["${var.ForgeRock-POT-ServiceEndpoints}"]
  route_table_id            = "${azurerm_route_table.UDR-ForgeRock-POT-PaaS.id}"
  //depends_on = ["azurerm_route_table.UDR-ForgeRock-POT"]

}

resource "azurerm_subnet_route_table_association" "AKS01-Subnet-RouteTable" { 
  subnet_id      = "${azurerm_subnet.AKS01.id}"
  route_table_id = "${azurerm_route_table.UDR-ForgeRock-POT-PaaS.id}"

   }


resource "azurerm_subnet" "AKS02" {
  name                      = "AKS02"
  address_prefix            = "${var.ForgeRock-POTAKS02AddressPrefix}"
  resource_group_name       = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"
  virtual_network_name      = "${azurerm_virtual_network.ForgeRock-POTPaaSVNET.name}"
 network_security_group_id = "${azurerm_network_security_group.ForgeRock-POTAKS02.id}"
  service_endpoints         = ["${var.ForgeRock-POT-ServiceEndpoints}"]
  route_table_id = "${azurerm_route_table.UDR-ForgeRock-POT-PaaS.id}"
   //depends_on = ["azurerm_route_table.UDR-ForgeRock-POT"]
}



resource "azurerm_subnet_route_table_association" "AKS02-Subnet-RouteTable" {
  subnet_id      = "${azurerm_subnet.AKS02.id}"
  route_table_id = "${azurerm_route_table.UDR-ForgeRock-POT-PaaS.id}"
  //depends_on = ["azurerm_subnet.Presentation"]
  
}





resource "azurerm_route_table" "UDR-ForgeRock-POT-PaaS" {
  name                          = "UDR-${var.AzureGeoShortName}-ForgeRock-POT-PaaS-RouteTable"
  location                      = "${var.ForgeRock-POTNetwork-ResourceGroup-Location}"
  resource_group_name           =  "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"
  disable_bgp_route_propagation = "${var.ForgeRock-POTUDR-DisableBGPRoutePropagation}"


tags = {
    Resource-ID                    = "${var.Resource-ID}"
    Environment                    = "${var.Environment}"
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
