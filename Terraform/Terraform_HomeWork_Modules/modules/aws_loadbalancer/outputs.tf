#data "aws_lb_listener" "listener-arn" {}


#data "aws_lb" "lb-arn" {}


output "dns-name" {
  value = aws_lb.lb-dp.dns_name
}

output "lb-vpc" {
  value = aws_lb.lb-dp.vpc_id
}

output "ls" {
  value = aws_lb.lb-dp.subnet_mapping
}

#output "listener-arn" {
#  value = data.aws_lb_listener.listener-arn.arn
#}


#data "aws_instance" "ec2-id" {}

#output "ec2-d" {
#  value = data.aws_instance.ec2-id.id
#}

#output "lb-arn" {
#  value = data.aws_lb.lb-arn.arn
#}