data "aws_availability_zones" "avail-zones" {}


resource "aws_vpc" "vpc-from-module" {

  cidr_block = var.vpc-cidr
  tags       = {
    Name = "${var.env} vpc"
  }
}

resource "aws_internet_gateway" "igw-main" {
  vpc_id = aws_vpc.vpc-from-module.id
  tags   = {
    Name = "${var.env} igw"
  }

}
resource "aws_subnet" "public-subnets" {
  count                   = length(var.public-subnets-cidr)
  vpc_id                  = aws_vpc.vpc-from-module.id
  cidr_block              = element(var.public-subnets-cidr, count.index, )
  availability_zone       = data.aws_availability_zones.avail-zones.names[count.index]
  map_public_ip_on_launch = true
  tags                    = {
    Name = "${var.env} - public - ${count.index + 1}"
  }
}

resource "aws_subnet" "private-subnets" {
  count             = length(var.private-subnets-cidr)
  vpc_id            = aws_vpc.vpc-from-module.id
  cidr_block        = element(var.private-subnets-cidr, count.index )
  availability_zone = data.aws_availability_zones.avail-zones.names[count.index]

  tags = {
    Name = "${var.env} - private - ${count.index + 1}"
  }

}

resource "aws_eip" "nat" {
  count = length(var.private-subnets-cidr)
  vpc   = true
  tags  = {
    Name = "${var.env} nat-gw-ip ${count.index +1}"
  }
}

resource "aws_nat_gateway" "nat-gw" {
  count         = length(var.private-subnets-cidr)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = element(aws_subnet.public-subnets[*].id, count.index)
  tags          = {
    Name = "${var.env} nat-gw ${count.index + 1}"
  }
}


resource "aws_route_table" "route-public" {
  vpc_id = aws_vpc.vpc-from-module.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-main.id
  }

  tags = {
    Name = "${var.env} route public subnets"
  }
}


resource "aws_route_table_association" "public-routes" {
  count          = length(aws_subnet.public-subnets[*].id)
  route_table_id = aws_route_table.route-public.id
  subnet_id      = element(aws_subnet.public-subnets[*].id, count.index)
}

resource "aws_route_table" "route-private" {
  count  = length(var.private-subnets-cidr)
  vpc_id = aws_vpc.vpc-from-module.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw[count.index].id
  }

  tags = {
    Name = "${var.env} route private sudnets ${count.index + 1 }"
  }

}


resource "aws_route_table_association" "private-route" {
  count          = length(aws_subnet.private-subnets[*].id)
  route_table_id = aws_route_table.route-private[count.index].id
  subnet_id      = element(aws_subnet.private-subnets[*].id, count.index )
}

