terraform {
  required_providers {
    yandex = { source = "yandex-cloud/yandex" }
  }
}

provider "yandex" {
  # все загрузится из переменных окружения
}

# Вызываем наш модуль
module "my_prod_vm" {
  source = "../../modules/vm"

  # Пробрасываем переменные из окружения внутрь модуля
  env_name    = "prod"
  cores       = var.cores
  memory      = var.memory
  disk_size   = var.disk_size
  disk_type   = var.disk_type
  zone        = var.zone
  subnet_id   = var.subnet_id
  ssh_pub_key = var.ssh_pub_key
}

# Выводим IP-адрес в консоль, забирая его из модуля
output "prod_vm_ip" {
  value = module.my_prod_vm.external_ip
}