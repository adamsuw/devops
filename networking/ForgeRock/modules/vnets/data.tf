/*data "azurerm_express_route_circuit" "Core-ExpressRoute" {
    provider              = "azurerm.core"
    name                  = "ER-${var.AzureGeoShortNames["${var.ERLocation}"]}-Core-${replace(var.CoreExpR-PeeringLocation, " ", "")}-${format("%02d", count.index+1)}"
    resource_group_name   = "${var.AzureGeoShortNames["${var.ERLocation}"]}-Core-Network"
}
*/