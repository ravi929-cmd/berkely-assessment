resource "random_string" "this" {
  length  = 6
  lower   = true
  numeric = true
  special = false
  upper   = false
}


resource "aws_key_pair" "generated" {
  depends_on = [tls_private_key.default]
  key_name   = "ec2keypair_${random_string.this.result}"
  public_key = tls_private_key.default.public_key_openssh
}


resource "aws_secretsmanager_secret" "pem" {
  name        = "ec2keypair_${random_string.this.result}"
  description = "private key for key pair ec2keypair_${random_string.this.result} "
}

resource "aws_secretsmanager_secret_version" "pem" {
  secret_id     = aws_secretsmanager_secret.pem.id
  secret_string = tls_private_key.default.private_key_pem
}

resource "tls_private_key" "default" {
  algorithm = "RSA"
}