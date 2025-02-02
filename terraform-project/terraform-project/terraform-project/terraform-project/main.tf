# Configura o provider AWS
provider "aws" {
  region = "us-east-1"
}

# Gera um sufixo aleatório para garantir um nome único para o bucket
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

# Cria o bucket S3
resource "aws_s3_bucket" "meu_bucket" {
  # Concatena um prefixo com o sufixo aleatório para criar um nome único
  bucket = "meu-bucket-unico-${random_string.bucket_suffix.result}"

  # Configura o versionamento do bucket
  versioning {
    enabled = true
  }

  # Configura a criptografia padrão
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Tags para melhor organização
  tags = {
    Environment = "Production"
    CreatedBy   = "Terraform"
  }
}

# Bloqueia o acesso público ao bucket por segurança
resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.meu_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
