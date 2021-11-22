provider "aws" {
  region = var.region
}


resource "aws_instance" "Public_1" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.Latest_Amazon_Linux.id
  vpc_security_group_ids = [aws_security_group.SG_WEB.id]
  subnet_id              = aws_subnet.Public_subnet_A.id
  #key_name               = "devpro_edu2.pem"
  #depends_on             = [aws_security_group.WEB]
  user_data              = file("tm.sh")
  tags                   = {
    Name = "Webserver TF"
  }
}

resource "aws_instance" "Private_A" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.Latest_Amazon_Linux.id
  vpc_security_group_ids = [aws_security_group.SG_WEB.id]
  subnet_id              = aws_subnet.Private_subnet-A.id
  #key_name               = "devpro_edu2.pem"
  #depends_on             = [aws_security_group.WEB]
  user_data              = file("tm.sh")
  tags                   = {
    Name = "Webserver Private A"
  }
}

resource "aws_instance" "Private_B" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.Latest_Amazon_Linux.id
  vpc_security_group_ids = [aws_security_group.SG_WEB.id]
  subnet_id              = aws_subnet.Private_subnet-B.id
  #key_name               = "devpro_edu2.pem"
  #depends_on             = [aws_security_group.WEB]
  user_data              = file("tm.sh")
  tags                   = {
    Name = "Webserver Private A"
  }
}

resource "aws_instance" "Back-A" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.Latest_Amazon_Linux.id
  vpc_security_group_ids = [aws_security_group.SG_WEB.id]
  subnet_id              = aws_subnet.Private_subnet-A.id
  #key_name               = "devpro_edu2.pem"
  #depends_on             = [aws_security_group.WEB]
  user_data              = file("backend.sh")
  tags                   = {
    Name = "Backend A"
  }
}

resource "aws_instance" "Back-B" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.Latest_Amazon_Linux.id
  vpc_security_group_ids = [aws_security_group.SG_WEB.id]
  subnet_id              = aws_subnet.Private_subnet-B.id
  #key_name               = "devpro_edu2.pem"
  #depends_on             = [aws_security_group.WEB]
  user_data              = file("backend.sh")
  tags                   = {
    Name = "Backend B"
  }
}