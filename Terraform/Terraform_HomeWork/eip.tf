resource "aws_eip" "DP_NAT" {
  depends_on = [aws_internet_gateway.IGW_DP]



}

