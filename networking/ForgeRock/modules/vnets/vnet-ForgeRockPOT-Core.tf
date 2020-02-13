### NSG CODE (Pre-AzureRM 2.0 Provider)
resource "azurerm_network_security_group" "ForgeRock-POTApplication" {
  name                = "NSG-${var.AzureGeoShortName}-ForgeRock-POT-Application"
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



resource "azurerm_network_security_group" "ForgeRock-POTPresentation" {
  name                = "NSG-${var.AzureGeoShortName}-ForgeRock-POT-Presentation"
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

resource "azurerm_network_security_group" "ForgeRock-POTDatabase" {
  name                = "NSG-${var.AzureGeoShortName}-ForgeRock-POT-Database"
  location            = "${var.ForgeRock-POTNetwork-ResourceGroup-Location}"
  resource_group_name = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"

  tags {
    Resource-ID                    = "${var.Resource-ID}"
    Environment                    = "${var.Environment}"
    Service-Display-Name           = "${var.Service-Display-Name}"
    Cloud-Maturity-Level           = "${var.Cloud-Maturity-Level}"
    //Provisioner                    = "${var.Provisioner}"
    //Disaster-Recovery-Service-Tier = "${var.Disaster-Recovery-Service-Tier}"
  }
}

###




resource "azurerm_virtual_network" "ForgeRock-POTVNET" {
  count               = "${var.Count}"
  name                = "VNET-${var.AzureGeoShortName}-ForgeRock-POT-${format("%02d", count.index + 1)}"
  resource_group_name = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"
  address_space       = ["${var.VNetForgeRock-POTAddressSpace}"]
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
resource "azurerm_subnet" "Gateway" {
  name                 = "GatewaySubnet"
  address_prefix       = "${var.GatewayAddressPrefix}"
  resource_group_name  = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"
  virtual_network_name = "${azurerm_virtual_network.ForgeRock-POTVNET.name}"
}
*/

resource "azurerm_subnet" "Application" {
  name                      = "Application"
  address_prefix            = "${var.ApplicationAddressPrefix}"
  resource_group_name       = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"
  virtual_network_name      = "${azurerm_virtual_network.ForgeRock-POTVNET.name}"
  network_security_group_id = "${azurerm_network_security_group.ForgeRock-POTApplication.id}"
  service_endpoints         = ["${var.ForgeRock-POT-ServiceEndpoints}"]
  route_table_id            = "${azurerm_route_table.UDR-ForgeRock-POT.id}"
  //depends_on = ["azurerm_route_table.UDR-ForgeRock-POT"]

}

resource "azurerm_subnet_route_table_association" "Application-Subnet-RouteTable" { 
  subnet_id      = "${azurerm_subnet.Application.id}"
  route_table_id = "${azurerm_route_table.UDR-ForgeRock-POT.id}"

   }


resource "azurerm_subnet" "Presentation" {
  name                      = "Presentation"
  address_prefix            = "${var.PresentationAddressPrefix}"
  resource_group_name       = "${var.ForgeRock-POTNetwork-ResourceGroup-Name}"
  virtual_network_name      = "${azurerm_virtual_network.ForgeRock-POTVNET.name}"
 network_security_group_id = "${azurerm_network_security_group.ForgeRock-POTPresentation.id}"
  service_endpoints         = ["${var.ForgeRock-POT-ServiceEndpoints}"]
  route_table_id = "${azurerm_route_table.UDR-ForgeRock-POT.id}"
   //depends_on = ["azurerm_route_table.UDR-ForgeRock-POT"]
}

resource "azurerm_subnet_route_table_association" "Presentation-Subnet-RouteTable" {
  subnet_id      = "${azurerm_subnet.Presentation.id}"
  route_table_id = "${azurerm_route_table.UDR-ForgeRock-POT.id}"
  //depends_on = ["azurerm_subnet.Presentation"]
  
}


resource "azurerm_subnet" "Database" {
  name                      = "Database"
  address_prefix            = "${var.DatabaseAddressPrefix}"
  resource_group_name       = "${azurerm_virtual_network.ForgeRock-POTVNET.resource_group_name}"
  virtual_network_name      = "${azurerm_virtual_network.ForgeRock-POTVNET.name}"
 network_security_group_id = "${azurerm_network_security_group.ForgeRock-POTDatabase.id}"
  service_endpoints         = ["${var.ForgeRock-POT-ServiceEndpoints}"]
  route_table_id = "${azurerm_route_table.UDR-ForgeRock-POT.id}"
   //depends_on = ["azurerm_route_table.UDR-ForgeRock-POT"]
}


resource "azurerm_subnet_route_table_association" "Database-Subnet-RouteTable" {
  subnet_id      = "${azurerm_subnet.Database.id}"
  route_table_id = "${azurerm_route_table.UDR-ForgeRock-POT.id}"
  //depends_on = ["azurerm_subnet.Database"]
}


resource "azurerm_route_table" "UDR-ForgeRock-POT" {
  name                          = "UDR-${var.AzureGeoShortName}-ForgeRock-POT-RouteTable"
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
