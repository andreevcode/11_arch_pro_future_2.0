terraform {
  required_providers {
    yandex = { source = "yandex-cloud/yandex" }
  }

  backend "s3" {
    endpoint = "https://storage.yandexcloud.net"
    bucket   = "arch-pro-sp11-task2-tf-state-01"
    region   = "ru-central1"
    key      = "dev/terraform.tfstate" # Путь к файлу внутри бакета

    # Эти данные МЫ НЕ ХАРДКОДИМ, а передадим при init
    # access_key = "..."
    # secret_key = "..."

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
  }
}

provider "yandex" {
  # все загрузится из переменных окружения
}

# Вызываем наш модуль
module "my_dev_vm" {
  source = "../../modules/vm"

  # Пробрасываем переменные из окружения внутрь модуля
  env_name    = "dev"
  cores       = var.cores
  memory      = var.memory
  disk_size   = var.disk_size
  disk_type   = var.disk_type
  zone        = var.zone
  subnet_id   = var.subnet_id
  ssh_pub_key = var.ssh_pub_key
}

# Выводим IP-адрес в консоль, забирая его из модуля
output "dev_vm_ip" {
  value = module.my_dev_vm.external_ip
}