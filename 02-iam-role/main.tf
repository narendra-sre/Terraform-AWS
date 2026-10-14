terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-2"
}

resource "aws_iam_role" "ec2_s3_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "read_objects" {
  name = "read-objects-from-one-bucket"
  role = aws_iam_role.ec2_s3_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["s3:GetObject"]
      Resource = "arn:aws:s3:::${var.bucket_name}/*"
    }]
  })
}


resource "aws_iam_instance_profile" "ec2_S3_reader" {
  name = "${var.role_name}-profile"
  role = aws_iam_role.ec2_s3_role.name
}

resource "aws_security_group" "instance_security_group" {
  name        = "instance-sg"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "HTTPS"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "s3_read_instance" {
  tags = {
    Name = "Dev"
  }
  ami                         = "ami-045ef538ace2cebbd"
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.instance_security_group.id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_S3_reader.name
  user_data_replace_on_change = true
  user_data                   = <<-EOF
  #!/usr/bin/env bash
  sudo apt update -y
  sudo apt install -y awscli
  EOF
}