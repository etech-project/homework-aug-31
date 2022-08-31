variable "key_name" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "region" {
  type = string
}

variable "bucket" {
  type = string
}