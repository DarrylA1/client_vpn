terraform {
  backend "s3" {
    bucket = "da-client-vpn-tfstates-754892758347"
    key    = "github/portfolio/terraform/backend/clientvpn"
    dynamodb_table = "terraform-lock-clientvpn"
  }
}