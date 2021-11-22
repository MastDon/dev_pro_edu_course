resource "aws_security_group" "dp-security-group" {
  description = "Security group for my web server"
vpc_id = var.vpc_id


  dynamic "ingress" {

    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.ingress-protocol
      cidr_blocks = var.ingress-cidr
    }


  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = var.egress-cidr
  }

  tags = {
    Name = "${var.env} security group"
  }
}
