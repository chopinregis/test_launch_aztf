output "azure_linux_app" {
  value = local.linux_app_list
}

output "linux_app_names" {
  value = [for app in local.linux_app_list : app.name]
}

output "linux_app_os" {
  value = [for app in local.linux_app_list : app.os_type]
}

output "linux_app_sku" {
  value = [for app in local.linux_app_list : app.sku_name]
}
