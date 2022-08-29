terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state"
    key = "global/s3/terraform.tfstate"
    region = "use-east-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
  }
}


provider "aws" {
  region = "us-east-2"
}


resource "aws_s3_bucket" "terraform_state" {

  bucket = var.bucket_name

  // 테스팅에만 쓰고 운영환경에서는 쓰지말 것
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    state = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.terraform_state.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
  
}

resource "aws_dynamodb_table" "terraform_locks" {
  name = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}


