resource "aws_directory_service_directory" "bar" {
  name     = "da.clientvpn.com"
  password = "SuperSecretPassw0rd"
  size     = "Small"

  vpc_settings {
    vpc_id     = aws_vpc.main.id
    subnet_ids = [aws_subnet.privatea.id, aws_subnet.privateb.id]
  }

  tags = {
    Project = project_name.id
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "privatea" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.1.0/24"
}

resource "aws_subnet" "privateb" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-2b"
  cidr_block        = "10.0.2.0/24"
}