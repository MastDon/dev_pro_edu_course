variable "region" {
  description = "Set region name"
  default     = "eu-central-1"
}


variable "instance_type" {
  description = "Set instance type"
  default     = "t2.micro"
}

variable "ami_latest" {
  description = "Set latest AMI Amazon Linux in current region"
  default = "data.aws_ami.Latest_Amazon_Linux.id"
}

variable "SecGroup_name" {
  description = "Security group name"
  default = "My webserver security group"
}

variable "zone_id" {
  default = "401eec6850d91255b248edf0e2ce60b8"
}
/**
variable "Avail_zone-A" {
  description = "Availability_zone-A in current region"
  default = "data.aws_availability_zones.av_zones.names[0]"

}

variable "Avail_zone-B" {
  description = "Availability_zone-B in current region"

  default = "data.aws_availability_zones.av_zones.names"

}
*/