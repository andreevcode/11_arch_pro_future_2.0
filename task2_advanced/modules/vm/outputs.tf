output "vm_id" {
  value = yandex_compute_instance.vm_sp11.id
}

output "external_ip" {
  value = yandex_compute_instance.vm_sp11.network_interface.0.nat_ip_address
}