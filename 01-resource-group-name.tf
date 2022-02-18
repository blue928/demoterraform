# Import the existing DevLift rg to to work with
# This is the resource group information
#az group show --name DEV-Lift_Stihl-Dev_CentralUS
#{
#  "id": "/subscriptions/578e0f86-0491-4137-9a4e-3a3c0ff28e91/resourceGroups/DEV-Lift_Stihl-Dev_CentralUS",
#  "location": "eastus",
#  "managedBy": null,
#  "name": "DEV-Lift_Stihl-Dev_CentralUS",
#  "properties": {
#    "provisioningState": "Succeeded"
#  },
#  "tags": {},
#  "type": "Microsoft.Resources/resourceGroups"
#}

resource "azurerm_resource_group" "k8s" {
  name     = var.resource_group_name
  location = var.location


  tags = {
    environment = var.environment
  }
}