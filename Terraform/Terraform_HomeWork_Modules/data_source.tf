data "aws_availability_zones" "av_zones" {}


data "aws_ami" "Latest_Amazon_Linux" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_lb" "lb_dns_name" {
  depends_on = [aws_lb.Balancer]
}


output "lb_dns_name" {
  value = data.aws_lb.lb_dns_name.dns_name
}


output "latest_amazon_linux_id" {
  value = data.aws_ami.Latest_Amazon_Linux.id
}

output "availability_zones" {
  value = data.aws_availability_zones.av_zones.names
}