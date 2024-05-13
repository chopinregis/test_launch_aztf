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
  dns_prefix          = "exampleaks"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_DS2_v2"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  # Make sure no `identity` block is defined
}


resource "azurerm_kubernetes_cluster_node_pool" "kube1nodepool" {
  for_each = { for cluster in azurerm_kubernetes_cluster.batchabcd : cluster.name => cluster }

  name                  = each.key
  kubernetes_cluster_id = each.value.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1
}




variable "regisconfigs" {
  description = "Path to the configuration files"
  type        = string
  default     = "path/to/configs"
}
