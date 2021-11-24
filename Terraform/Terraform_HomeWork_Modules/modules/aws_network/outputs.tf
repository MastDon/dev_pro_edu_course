output "vpc-id" {
  value = aws_vpc.vpc-from-module.id
}

output "vpc-cidr" {
  value = aws_vpc.vpc-from-module.cidr_block
}

output "public-subnet-ids" {
  value = aws_subnet.public-subnets[*].id
}

output "private-subnet-ids" {
  value = aws_subnet.private-subnets[*].id
}