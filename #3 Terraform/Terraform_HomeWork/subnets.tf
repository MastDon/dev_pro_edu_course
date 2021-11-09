resource "aws_subnet" "Public_subnet_A" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.DP-Edu.id
  availability_zone       = data.aws_availability_zones.av_zones.names[0]
  map_public_ip_on_launch = true



  tags = {
    Name = "Public"
  }
}

resource "aws_subnet" "Public_subnet_B" {
  cidr_block              = "10.0.2.0/24"
  vpc_id                  = aws_vpc.DP-Edu.id
  availability_zone       = data.aws_availability_zones.av_zones.names[1]
  map_public_ip_on_launch = true
  tags                    = {
    Name = "Public"
  }
}

resource "aws_subnet" "Private_subnet-A" {
  cidr_block        = "10.0.3.0/24"
  vpc_id            = aws_vpc.DP-Edu.id
  availability_zone = data.aws_availability_zones.av_zones.names[0]
  tags              = {
    Name = "Private_subnet-A"
  }

}

resource "aws_subnet" "Private_subnet-B" {
  cidr_block        = "10.0.4.0/24"
  vpc_id            = aws_vpc.DP-Edu.id
  availability_zone = data.aws_availability_zones.av_zones.names[1]
  tags              = {
    Name = "Private_subnet-B"
  }

}

resource "aws_subnet" "Private_subnet_DB" {
  cidr_block        = "10.0.30.0/24"
  vpc_id            = aws_vpc.DP-Edu.id
  availability_zone = data.aws_availability_zones.av_zones.names[2]
  tags              = {
    Name = "Private_subnet_DB"
  }

}