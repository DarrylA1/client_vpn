resource "aws_ec2_client_vpn_endpoint" "daclientvpn" {
  description            = "terraform-clientvpn-project"
  server_certificate_arn = "arn:aws:acm:us-east-1:433649046701:certificate/223f7c5b-d104-4c19-a4d8-b92d715dd4ee"
  client_cidr_block      = "192.168.12.0/22"
  dns_servers            = ["10.0.1.224", "10.0.2.62"]
  split_tunnel           = true
  vpc_id                 = var.vpc_id
  security_group_ids     = var.sg_id
  self_service_portal    = "enabled"

  authentication_options {
    type                = "directory-service-authentication"
    active_directory_id = "d-90679331e0"
  }

  connection_log_options {
    enabled = false
  }
}


resource "aws_ec2_client_vpn_network_association" "subnet_association" {
  client_vpn_endpoint_id = "cvpn-endpoint-073f929e39d11d1e3"
  subnet_id              = "subnet-07c4c4a5150ba24e2"
}

resource "aws_ec2_client_vpn_authorization_rule" "da_authorization" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.daclientvpn.id
  target_network_cidr    = "10.0.0.0/16"
  authorize_all_groups   = true
}