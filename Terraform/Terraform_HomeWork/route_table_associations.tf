resource "aws_route_table_association" "Public_A_Route" {


  route_table_id = aws_route_table.Public_Route_DP.id
  subnet_id      = aws_subnet.Public_subnet_A.id

}

resource "aws_route_table_association" "Private_A_Route" {
  route_table_id = aws_route_table.Private-A.id
  subnet_id      = aws_subnet.Private_subnet-A.id
}


resource "aws_route_table_association" "Private_B_Route" {
  route_table_id = aws_route_table.Private-B.id
  subnet_id      = aws_subnet.Private_subnet-B.id
}

