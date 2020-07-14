variable app_disk_image {
  description = "Disk image for ruby application"
  default     = "reddit-app-base"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for ssh access"
}
variable subnet_id {
  description = "Subnet for modules"
}

variable db_url {
  description = "Data base url"
}