resource "azurerm_kubernetes_cluster_node_pool1" "kube1nodepool" {
  for_each = azurerm_kubernetes_cluster.batchabcd
  name = "${each.key}"
  kubernetes_cluster_id = each.value.id
  vm_size = "Standard_DS2_v2"
  node_count = 1

  tags = {
	  Evironment = "Production"
  }
}
