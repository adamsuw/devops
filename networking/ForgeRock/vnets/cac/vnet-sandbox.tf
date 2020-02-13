
resource "azurerm_resource_group" "ForgeRock-POTNetworking" {
  name     = "${var.AzureGeoShortNames["${var.Location}"]}-ForgeRock-POT-Network"
  location = "${var.Location}"

  tags {
    Resource-ID                    = "${var.Resource-ID}"
    Environment                    = "${var.Environment}"
    CostCenter                     = "${var.CostCenter}"
    Service-Display-Name           = "${var.Service-Display-Name}"
    Cloud-Maturity-Level           = "${var.Cloud-Maturity-Level}"
    Provisioner                    = "${var.Provisioner}"
    Disaster-Recovery-Service-Tier = "${var.Disaster-Recovery-Service-Tier}"
  }
}

// ForgeRock-POT Core VNETs modules 


module "ForgeRock-POT-CoreVNETs" {

source = "../../modules/vnets"

//source = "terraform.platform.manulife.io/modules/networking-ForgeRock-POT/azurerm"

    Resource-ID                             = "${var.Resource-ID}"
    Environment                             = "${var.Environment}"
    CostCenter                              = "${var.CostCenter}"
    Service-Display-Name                    = "${var.Service-Display-Name}"
    Cloud-Maturity-Level                    = "${var.Cloud-Maturity-Level}"
    Provisioner                             = "${var.Provisioner}"
    
    ForgeRock-POTNetwork-ResourceGroup-Name      =  "${azurerm_resource_group.ForgeRock-POTNetworking.name}"
    ForgeRock-POTNetwork-ResourceGroup-Location  = "${azurerm_resource_group.ForgeRock-POTNetworking.location}"
    
    AzureGeoShortName   = "${var.AzureGeoShortNames[var.Location]}"
    Count               = "${var.Count}"

   # ForgeRock-POT Virtual Network 
    VNetForgeRock-POTAddressSpace   = ["${var.VNetForgeRock-POTAddressSpace}"]
    //ForgeRock-POTDNSServer          = ["${var.ForgeRock-POTDNSServer}"]
    
  //GatewayAddressPrefix	              = "${var.GatewayAddressPrefix}"
  ApplicationAddressPrefix	          = "${var.ApplicationAddressPrefix}"
  PresentationAddressPrefix	          = "${var.PresentationAddressPrefix}"
  DatabaseAddressPrefix	              = "${var.DatabaseAddressPrefix}"
  
  
# ForgeRock-POT DMZ Virtual  Network
  
VNetForgeRock-POTDMZAddressSpace            = "${var.VNetForgeRock-POTDMZAddressSpace}"        
ForgeRock-POTExtPresentationAddressPrefix   = "${var.ForgeRock-POTExtPresentationAddressPrefix}"
ForgeRock-POTExtCollaborationAddressPrefix  = "${var.ForgeRock-POTExtCollaborationAddressPrefix}"


# ForgeRock-POT PaaS Virtual Network

VNetForgeRock-POTPaaSAddressSpace           = "${var.VNetForgeRock-POTPaaSAddressSpace}"
//ForgeRock-POTPaaSGatewayAddressPrefix       = "${var.ForgeRock-POTPaaSGatewayAddressPrefix}"
ForgeRock-POTAKS01AddressPrefix             = "${var.ForgeRock-POTAKS01AddressPrefix}"
ForgeRock-POTAKS02AddressPrefix             = "${var.ForgeRock-POTAKS02AddressPrefix}"


  ForgeRock-POT-ServiceEndpoints        =  ["${var.ForgeRock-POT-ServiceEndpoints}"]

  ForgeRock-POTUDR-AddressPrefix        =  "${var.ForgeRock-POTUDR-AddressPrefix}"
  ForgeRock-POTUDR-NextHopType          = "${var.ForgeRock-POTUDR-NextHopType}"
  //ForgeRock-POTUDR-NextHopIPAddress     = "${var.ForgeRock-POTUDR-NextHopIPAddress}"
  ForgeRock-POTUDR-DisableBGPRoutePropagation =  "${var.ForgeRock-POTUDR-DisableBGPRoutePropagation}"

}

// ForgeRock-POT Core NSGs
/*
module "ForgeRock-POT-NSGs" {
 source = "../../modules/nsgs/cac"


Resource-ID                                 = "${var.Resource-ID}"
    Environment                             = "${var.Environment}"
    CostCenter                              = "${var.CostCenter}"
    Service-Display-Name                    = "${var.Service-Display-Name}"
    Cloud-Maturity-Level                    = "${var.Cloud-Maturity-Level}"
    Provisioner                             = "${var.Provisioner}"
    
    ForgeRock-POTNetwork-ResourceGroup-Name       =  "${azurerm_resource_group.ForgeRock-POTNetworking.name}"
    ForgeRock-POTNetwork-ResourceGroup-Location   = "${azurerm_resource_group.ForgeRock-POTNetworking.location}"
    
    AzureGeoShortName   = "${var.AzureGeoShortNames[var.Location]}"

   

  ForgeRock-POTApplication-NSG-Name             = "${module.ForgeRock-POT-CoreVNETs.ForgeRock-POTApplication-NSG-Name}"
  ForgeRock-POTDatabase-NSG-Name                = "${module.ForgeRock-POT-CoreVNETs.ForgeRock-POTDatabase-NSG-Name}"
  ForgeRock-POTPresentation-NSG-Name            = "${module.ForgeRock-POT-CoreVNETs.ForgeRock-POTPresentation-NSG-Name}"
  ForgeRock-POTExtPresentation-NSG-Name         =  "${module.ForgeRock-POT-CoreVNETs.ForgeRock-POTExtPresentation-NSG-Name}"
  ForgeRock-POTExtCollaboration-NSG-Name        =  "${module.ForgeRock-POT-CoreVNETs.ForgeRock-POTExtCollaboration-NSG-Name}"
  ForgeRock-POTAKS01-NSG-Name                   =  "${module.ForgeRock-POT-CoreVNETs.ForgeRock-POTAKS01-NSG-Name}"
  ForgeRock-POTAKS02-NSG-Name                   =  "${module.ForgeRock-POT-CoreVNETs.ForgeRock-POTAKS02-NSG-Name}"


}
*/