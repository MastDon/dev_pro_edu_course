data "aws_availability_zones" "zones" {
}

data "aws_ami" "Latest_Amazon_Linux" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

output "ami_id" {
  value = data.aws_ami.Latest_Amazon_Linux.id
}






output "zones" {
  value = length(data.aws_availability_zones.zones.names) - 1
}


data "aws_vpcs" "my-vpc" {}

output "my-vpcs" {
  value = length(data.aws_vpcs.my-vpc) + 1
}

#data "aws_instance" "ec2_id" {
#  filter {
#
#    values = ["data.aws_ami.Latest_Amazon_Linux.id"]
#    name = "ami"
#  }
#}
#
#output "ec2-id" {
#  value = data.aws_instance.ec2_id.id
#}

output "ec2-id" {
  value = aws_instance.dp-ec2[*].id
}