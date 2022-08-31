variable "instance_type" {
  type = map(string)
  default = {
    "instance-1" = "t2.micro"
    "instance-2" = "t2.small"
    "instance-3" = "t2.medium"
  }
}

variable "key_name" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "region" {
  type = string
}