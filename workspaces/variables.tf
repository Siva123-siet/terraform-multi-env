variable "project" {
  default = "Roboshop"
}

variable "common_tags" {
  default = {
    Project   = "roboshop"
    Terraform = "true"
  }
}

variable "sg_name" {
  default = "allow_all"
  
}

variable "sg_description" {
  default = "allowing all ports from all IP"
  
}

variable "instances" {
  default = ["mongodb" , "redis"]
}

variable "instance_type" {
  default = {
    dev = "t3.micro"
    prod = "t3.small"
  }
}

# variable "final-name" {
#     default = "${var.project}-${var.environment}-${var.Component}"

# }