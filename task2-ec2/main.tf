provider "aws" {
  region = var.AWS_REGION
}

resource "aws_security_group" "windows_sg" {
  name        = "windows-server-sg"
  description = "Allow RDP, HTTP, and HTTPS traffic"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "windows-server-sg"
  }
}

resource "aws_instance" "windows_server" {
  ami             = var.windows_ami
  instance_type   = var.instance_type
  subnet_id       = var.public_subnets[0]
  security_groups = [aws_security_group.windows_sg.id]
  key_name        = aws_key_pair.generated.key_name

  root_block_device {
    encrypted   = true
    volume_size = 50
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125
    tags = {
      root_volume = "windows-server-root-volume"
    }
  }

  ebs_block_device {
    device_name = "xvdf"
    volume_size = 50
    volume_type = "gp3"
    encrypted   = true
    iops        = 1000
    throughput  = 125
  }

  tags = {
    Name = "windows-server-instance"
  }
  lifecycle {
    ignore_changes = [disable_api_termination, ebs_optimized, hibernation, security_groups, credit_specification, network_interface, ephemeral_block_device]
  }
}