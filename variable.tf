variable "subscription_id"{
  type=string
}

variable "client_id"{
  type=string
}
variable "client_secret"{
  type=string
}
variable "tenant_id"{
  type=string
}

variable "myresourcegroupname" {
  type = string
  default = "mcit420zz5um"
}





# Variable declaration
variable "regisconfigs" {
  description = "Path to the configuration files"
  type        = string
  # Provide a default or expect the user to specify it
}

# Resource group (Example, make sure this matches your actual needs)
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "batchabcd" {
  name                = "example-aks1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  # Ensure to configure the required properties for AKS here
}
