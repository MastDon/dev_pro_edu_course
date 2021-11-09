resource "aws_internet_gateway" "IGW_DP" {
  vpc_id = aws_vpc.DP-Edu.id

  tags = {

    Name = "IGW_DP"
  }
}

resource "aws_nat_gateway" "NAT_DP" {
  subnet_id = aws_subnet.Public_subnet_A.id
  allocation_id = aws_eip.DP_NAT.id
  tags      = {
    Name = "NAT_DP_Edu"
  }
}