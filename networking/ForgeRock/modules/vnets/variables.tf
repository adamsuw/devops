variable "AzureGeoShortNames" {
  type = "map"

  default = {
    CanadaCentral = "CAC"
    CanadaEast    = "CAE"
    EastUS2       = "USE2"
    CentralUS     = "USC"
    EastAsia      = "EAS"
    SouthEastAsia = "SEA"
  }
}


variable "Resource-ID" {
  type        = "string"
  description = "The Resource ID from the CMDB"
}

variable "Environment" {
  type        = "string"
  description = "The environment the objects are in (CORE,PROD,NONPROD)"
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

variable "Provisioner" {
  type        = "string"
  description = "Source of deployment eg. Terraform or Manual"
}


variable "AzureGeoShortName" {
  type        = "string"
  description = "The Azure location the deployment is going to, in shortform per the naming standards (i.e. Canada Central = CAC)"
}

variable "Count" {
  type        = "string"
  description = "number of instances"
}


variable "ForgeRock-POTNetwork-ResourceGroup-Name" {
  type        = "string"
  description = "This is the Resource Group name containing the ForgeRock-POT Networking resources."
}

variable "ForgeRock-POTNetwork-ResourceGroup-Location" {
  type        = "string"
  description = "This is the location of the Resource Group containing the ForgeRock-POT Networking resources."
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

variable "ApplicationAddressPrefix" {
  type = "string"
}

variable "DatabaseAddressPrefix" {
  type = "string"
}

variable "PresentationAddressPrefix" {
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

variable "ForgeRock-POTUDR-DisableBGPRoutePropagation" {
  type = "string"
}



variable "ForgeRock-POT-ServiceEndpoints" {
  type        = "list"
  description = "Array of Service Endpoints to enable for the Core Subnets."
  
}
