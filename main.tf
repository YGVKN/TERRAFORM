terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ec2_example" {

  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = "aws_key"
  vpc_security_group_ids      = [aws_security_group.main.id]
  associate_public_ip_address = true


  user_data = file("scripts/script.sh")
  tags = {
    Name = "Terraform"
  }
  provisioner "local-exec" {
    command = "uname -a"
  }
  provisioner "remote-exec" {
    inline = [
      "touch /tmp/ygvkn",
      "uname -a >> /tmp/ygvkn",
    ]
  }
  # connection {
  #   type        = "ssh"
  #   host        = self.public_ip
  #   user        = "ubuntu"
  #   private_key = file("/Users/zhuzha/YGVKN/TERRA/.keys/aws_key")
  #   timeout     = "5m"
  # }
}


resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
}
resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKUIN3u3LsgrxnWGVmQRX6XN4IfCXkNoJYQgB6bA3J0SZM0UU4SNrGGjObeuhgJ3rJ89nn+wXxcHzR9LeNFY/KLH49zcAjkxa3cvI6ei1iAIUeQDUpL/IV8Mb/jCcyGSMn3C5k+PCXtsQs+SYBShDDFPfmQh1OYI1PpuThVox7HJP5+7lu6obfVLMcdwSf07URDoFbsSzG8Xzth5Zxl7G+m1AzfxQcDXj8gPlE0htf7/ALGF9QNvv1tuga5de5XbetTEH1SnvPjVcXmWbF4U+Ibew04cpu70FiWF8SVJeU7mS/FoigiN7Jc35Tt7KVC357y5M+iOl855x2G9q2TXUZ"
}

output "DNS" {
  value = aws_instance.ec2_example.public_dns
}
output "instance_ip" {
  description = "The public ip for ssh access"
  value       = aws_instance.ec2_example.public_ip
}
