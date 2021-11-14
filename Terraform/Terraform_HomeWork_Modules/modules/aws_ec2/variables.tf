variable "type" {
  default = [
    "prod",
    "back"

  ]
}

variable "inst-type" {
  default = "t2.micro"
}

variable "env" {
  default = "Front"
}

variable "subnet_id" {
  default = "subnet-094e57ecd932abac7"
}

variable "key_name" {
  default = "devpro_edu2.pem"
}

variable "user_data_front" {
  default = "tm.sh"
}

variable "user_data_back" {

}

variable "key" {
  default = "devpro_edu2"
}

#variable "vpc_security_group_ids" {
#  default = "sg-0de93ee6f1d03d3d2"
#}

variable "security-groups" {

}