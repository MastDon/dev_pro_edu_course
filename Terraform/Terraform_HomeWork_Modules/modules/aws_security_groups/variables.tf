variable "region" {
  description = "Set region name"
  default     = "eu-central-1"
}

variable "env" {
  default = "staging"

}

variable "vpc_id" {

}


variable "security-group-name" {
  description = "Security group name"
  default     = " security group "
}

variable "ports" {

  default = ["80", "22", "443"]
}

variable "ingress-protocol" {
  default = "tcp"
}

variable "egress-cidr" {
  default = ["0.0.0.0/24"]
}

variable "ingress-cidr" {
  default = ["0.0.0.0/24"]
}
