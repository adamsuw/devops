
SubscriptionID                         ="2c48d1b1-f747-45ea-9131-4c93a78f5d32"
Resource-ID                            = "TBD"
Environment                            = "POT"
CostCenter                             = "6731"
Service-Display-Name                   = "Azure"
ProdNetworking-Service-Display-Name    = "Azure"
NonProdNetworking-Service-Display-Name = "Azure"
Cloud-Maturity-Level                   = "Cloud Native"
Provisioner                            = "Terraform"
Disaster-Recovery-Service-Tier         = "Tier-3"
Location                               = "CanadaCentral"
Count                                  = "1"



# Networking variables
# ForgeRock-POT
//ForgeRock-POTDNSServer                      = ["10.180.240.4","10.180.240.5","10.182.240.4","10.182.240.5"]
//Azure-Recursive-Resolver           = ["168.63.129.16"]


VNetForgeRock-POTAddressSpace             = ["10.181.96.0/22"]
//GatewayAddressPrefix                = ""
ApplicationAddressPrefix            = "10.181.96.0/24"
DatabaseAddressPrefix               = "10.181.97.0/24"
PresentationAddressPrefix           = "10.181.98.0/24"


# ForgeRock-POT DMZ VNET variables

VNetForgeRock-POTDMZAddressSpace             = ["10.181.100.0/24"]
ForgeRock-POTExtPresentationAddressPrefix    = "10.181.100.0/25"
ForgeRock-POTExtCollaborationAddressPrefix   = "10.181.100.128/25"




# ForgeRock-POT PaaS VNET Variables
VNetForgeRock-POTPaaSAddressSpace           = ["10.181.104.0/21"]
//ForgeRock-POTPaaSGatewayAddressPrefix       = ""
ForgeRock-POTAKS01AddressPrefix             = "10.181.104.0/24"
ForgeRock-POTAKS02AddressPrefix             = "10.181.105.0/24"





# Service Endpoints
ForgeRock-POT-ServiceEndpoints       = ["Microsoft.AzureActiveDirectory", "Microsoft.AzureCosmosDB", "Microsoft.ContainerRegistry", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.Web"]


ForgeRock-POTUDR-DisableBGPRoutePropagation = "false"

ForgeRock-POTUDR-AddressPrefix    = "0.0.0.0/0"
ForgeRock-POTUDR-NextHopType      = "Internet"
//ForgeRock-POTUDR-NextHopIPAddress = "10.180.253.149" # This is the IP Address of the NVA