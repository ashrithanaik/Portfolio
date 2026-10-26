
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "portfolio" {
  ami                         = "ami-021aaf3749be66813"
  instance_type               = "t3.micro"
  subnet_id                   = "subnet-0dc7ace252940ed3a"
  vpc_security_group_ids      = ["sg-0f4ce8381f3d189c4"]
  key_name                    = "webserver"
  associate_public_ip_address = true

  root_block_device {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = false
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  lifecycle {
    prevent_destroy = true
  }
}
