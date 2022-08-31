locals {
  ec2_instance = [{
    ami  = "ami-08d4ac5b634553e16"
    size = "t2.medium"
    name = "EC2-1"
    },
    {
      ami  = "ami-05fa00d4c63e32376"
      size = "t2.micro"
      name = "EC2-2"
    },
    {
      ami  = "ami-0729e439b6769d6ab"
      size = "t2.small"
      name = "EC2-3"
    }

  ]
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "instance" {
  for_each = {
    for index, i in local.ec2_instance :
    i.ami => i
  }

  ami           = each.value.ami
  instance_type = each.value.size

  tags = {
    "Name" = "Terraform-${each.value.name}"
  }
  key_name        = var.key_name
  security_groups = var.security_groups
}
