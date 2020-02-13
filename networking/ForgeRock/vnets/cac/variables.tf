variable "AzureGeoShortNames" {
  type = "map"

  default = {
    CanadaCentral = "CAC"
    CanadaEast    = "CAE"
    EastUS2       = "USE2"
    CentralUS     = "USC"
    EastAsia      = "EAS"
    SouthEastAsia = "SEA"
    JapanEast     = "JPE"
    JapanWest     = "JPW"
  }
}


variable "SubscriptionID" {
type    = "string"
description = "ForgeRock-POT Subscription"

}


variable "Resource-ID" {
  type        = "string"
  description = "The Resource ID from the CMDB"
}

variable "Environment" {
  type        = "string"
  description = "The environment the objects are in (ForgeRock-POT,PROD,NONPROD)"
}

variable "CostCenter" {
  type        = "string"
  description = "The Cost Center associated with the resource (for billing/usage purposes)."
}

variable "Service-Display-Name" {
  type        = "string"
  description = "The Display Name for the service."
}

variable "Cloud-Maturity-Level" {
  type        = "string"
  description = "The Cloud Maturity level for the resource (i.e. Cloud Legacy, Cloud Ready, Cloud Native)."
}

variable "Disaster-Recovery-Service-Tier" {
type = "string"
description = "Disaster Recovery tier"


}

variable "Location" {
  type        = "string"
  description = "The Azure location the deployment is going to (i.e. Canada Central)"
}

variable "Provisioner" {
  type        = "string"
  description = "Source of deployment eg. Terraform or Manual"
}

variable "Count" {
  type        = "string"
  description = "number of instances."
}

#Networking variables
variable "VNetForgeRock-POTAddressSpace" {
  type = "list"
}
/*
variable "ForgeRock-POTDNSServer" {
  type = "list"
}

variable "Azure-Recursive-Resolver" {
type = "list"

} 


variable "GatewayAddressPrefix" {
  type = "string"
}
*/

variable "PresentationAddressPrefix" {
  type = "string"
}

variable "ApplicationAddressPrefix" {
  type = "string"
}

variable "DatabaseAddressPrefix" {
  type = "string"
}



variable "VNetForgeRock-POTDMZAddressSpace" {
  type = "list"
}

variable "ForgeRock-POTExtPresentationAddressPrefix" {
  type = "string"
}


variable "ForgeRock-POTExtCollaborationAddressPrefix" {
  type = "string"
}

variable "VNetForgeRock-POTPaaSAddressSpace" {
  type = "list"
}

/*
variable "ForgeRock-POTPaaSGatewayAddressPrefix" {
  type = "string"
}
*/
variable "ForgeRock-POTAKS01AddressPrefix" {
  type = "string"
}

variable "ForgeRock-POTAKS02AddressPrefix" {
  type = "string"
}

variable "ForgeRock-POT-ServiceEndpoints" {
  type     = "list"
  description = "Array of Service Endpoints to enable for the ForgeRock-POT Subnets."
}

variable "ForgeRock-POTUDR-DisableBGPRoutePropagation" {
  type        = "string"
  description = "If you plan to associate the route table to a subnet in a virtual network that is connected to your on-premises network through a VPN gateway, and you disable BGP route propagation, your on-premises routes are not propagated to the network interfaces in the subnet."
}


variable "ForgeRock-POTUDR-AddressPrefix" {
  type        = "string"
  description = "The destination CIDR to which the route applies."
}

variable "ForgeRock-POTUDR-NextHopType" {
  type        = "string"
  description = "The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None."
}
/*
variable "ForgeRock-POTUDR-NextHopIPAddress" {
  type        = "string"
  description = "Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance."
}

*/
