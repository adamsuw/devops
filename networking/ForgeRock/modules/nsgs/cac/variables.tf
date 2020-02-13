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



variable "SandboxNetwork-ResourceGroup-Name" {
  type        = "string"
  description = "This is the Resource Group name containing the Sandbox Networking resources."
}

variable "SandboxNetwork-ResourceGroup-Location" {
  type        = "string"
  description = "This is the location of the Resource Group containing the Sandbox Networking resources."
}

variable "SandboxApplication-NSG-Name" {
  type     = "string"
  description = "This is the name of the NSG"
}

variable "SandboxDatabase-NSG-Name" {
  type     = "string"
  description = "This is the name of the NSG"
}

variable "SandboxPresentation-NSG-Name" {
  type     = "string"
  description = "This is the name of the NSG"
}

variable "SandboxExtPresentation-NSG-Name" {
  type     = "string"
  description = "This is the name of the NSG"
}



variable "SandboxExtCollaboration-NSG-Name" {
  type     = "string"
  description = "This is the name of the NSG"
}

variable "SandboxAKS01-NSG-Name" {
  type     = "string"
  description = "This is the name of the NSG"
}

variable "SandboxAKS02-NSG-Name" {
  type     = "string"
  description = "This is the name of the NSG"
}



/*
variable "ApplicationAddressPrefix" {
  type = "string"
}

variable "DatabaseAddressPrefix" {
  type = "string"
}

variable "PresentationAddressPrefix" {
  type = "string"
}

*/