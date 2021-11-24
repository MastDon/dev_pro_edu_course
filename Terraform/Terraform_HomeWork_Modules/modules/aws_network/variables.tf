variable "region" {
  description = "Set region name"
  default     = "eu-central-1"
}

variable "env" {
  default = "staging"
}


variable "vpc-cidr" {
  default = "10.0.0.0/16"
}
variable "vpc-name" {
  default = "vpc-mod"
}

variable "subnet_public_ip_on_launch" {
  default = true
}

variable "public-subnets-cidr" {
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "private-subnets-cidr" {
  default = [
    "10.0.100.0/24",
    "10.0.200.0/24"
  ]

}

variable "instance_type" {
  description = "Set instance type"
  default     = "t2.micro"
}

variable "ami_latest" {
  description = "Set latest AMI Amazon Linux in current region"
  default     = "data.aws_ami.Latest_Amazon_Linux.id"
}


variable "dp-nat-gw" {
  default = "dp-nat-gw"
}

variable "dp-igw-name" {
  default = "dp-internet-gw"
}

