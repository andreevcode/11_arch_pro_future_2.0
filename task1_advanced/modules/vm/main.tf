terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_disk" "vm_sp11_disk" {
  name     = "${var.env_name}-disk"
  type     = "${var.disk_type}"
  zone     = "${var.zone}"
  image_id = data.yandex_compute_image.ubuntu.image_id
  size     = var.disk_size
}

resource "yandex_compute_instance" "vm_sp11" {
  name        = "${var.env_name}-vm"
  zone        = "${var.zone}"
  platform_id = "standard-v3"

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.vm_sp11_disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_pub_key}"
  }
}