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







# Resource group (Example, make sure this matches your actual needs)
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "batchabcd" {
  name                = "example-aks-cluster"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "example-aks"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_DS2_v2"
  }

  # Other necessary configurations like identity, network profile etc.
}


variable "regisconfigs" {
  description = "Path to the configuration files"
  type        = string
  default     = "path/to/configs"
}
