resource "aws_s3_bucket" "client_vpn_project_bucket" {
  bucket = "da-client-vpn-tfstates-754892758347"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = var.s3_backend_bucket_name
    Environment = "Test"
  }
}

resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = aws_s3_bucket.client_vpn_project_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform-lock-clientvpn"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "terraform-lock-clientvpn"
  }
}