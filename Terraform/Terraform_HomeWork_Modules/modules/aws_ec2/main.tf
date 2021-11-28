resource "aws_instance" "dp-ec2" {

  count                  = var.env == "Front" ? length(data.aws_availability_zones.zones.names) - 1 : length(data.aws_availability_zones.zones.names) - 2
  ami                    = data.aws_ami.Latest_Amazon_Linux.id
  instance_type          = var.inst-type
  key_name               = var.key
  subnet_id              = var.subnet_id
  security_groups = [] #mod
  #vpc_security_group_ids = [var.vpc_security_group_ids]
  user_data              = var.env == "Front" ? file(var.user_data_front) : file(var.user_data_back)
  tags                   = {
    Name = " ${var.env} server # ${count.index + 1}",
    env  = var.env
  }

}


