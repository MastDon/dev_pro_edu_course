resource "aws_vpc" "DP-Edu" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "DP_Edu"
  }
}


