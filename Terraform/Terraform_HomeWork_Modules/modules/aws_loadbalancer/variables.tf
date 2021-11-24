variable "region" {
  description = "Set region name"
  default     = "eu-central-1"
}

variable "env" {
  default = "staging"
}


variable "ami_latest" {
  description = "Set latest AMI Amazon Linux in current region"
  default     = "data.aws_ami.Latest_Amazon_Linux.id"
}

variable "security_groups" {
  default = "default"
}

variable "lb-vpc-id" {


}

variable "listener-default-action" {
  default = "forward"
}

variable "lb-listener-port" {
  default = "80"
}

variable "lb-type" {
  default = "application"
}

variable "lb_subnets" {
  default = [
    "subnet-08a1021bb010b1684",
    "subnet-08efec24a30231e3a"
  ]
}

variable "subnet_mapping" {

}

variable "lb_target_group_arn" {
  default = ""
}


#variable "target-group-arn" {}

variable "target_id" {
}


variable "target-group-port" {
  default = "80"
}

variable "target-protocol" {
  default = "HTTP"
}

variable "target-type" {
  default = "instance"
}

variable "target-group-attachment-port" {
  default = "80"
}


#variable "vpc_id" {}






