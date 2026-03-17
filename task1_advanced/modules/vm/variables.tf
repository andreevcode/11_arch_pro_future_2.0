variable "env_name" {
  description = "Имя окружения (dev, stage, prod)"
  type        = string
}

variable "cores" {
  description = "Количество ядер"
  type        = number
}

variable "memory" {
  description = "Объем RAM"
  type        = number
}

variable "disk_size" {
  description = "Объем диска в ГБ"
  type        = number
}

variable "disk_type" {
  description = "Тип диска"
  type        = string
}

variable "zone" {
  description = "Зона"
  type        = string
}

variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "ssh_pub_key" {
  description = "Публичный SSH ключ текстом"
  type        = string
}