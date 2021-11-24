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
  default     = "data.aws_ami.Latest_Amazon_Linux.id"
}

variable "SecGroup_name" {
  description = "Security group name"
  default     = "My webserver security group"
}

variable "zone_id" {
  description = "Enter cloudflare zone ID: "

}

variable "cf_mail" {
  description = "Enter e-mail from cloudflare account: "
}

variable "cf_apikey" {
  description = "Enter cloudflare API key: "
}

variable "dp-nat-gw" {
  default = "dp-nat-gw"
}

variable "dp-igw-name" {
  default = "dp-internet-gw"
}

variable "dp-lb-name" {
  default = "dp-lb-edu"
}

variable "dp-lb-type" {
  default = "application"
}

variable "dp-lb-listener-port" {
  default = "80"
}