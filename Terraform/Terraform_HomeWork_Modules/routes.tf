resource "aws_route_table" "Public_Route_DP" {
  vpc_id = aws_vpc.DP-Edu.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW_DP.id
  }

  tags = {
    Name = "Public"
  }

}


resource "aws_route_table" "Private-A" {
  vpc_id = aws_vpc.DP-Edu.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT_DP.id
  }
}

resource "aws_route_table" "Private-B" {
  vpc_id = aws_vpc.DP-Edu.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT_DP.id
  }
}