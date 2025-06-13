variable "project" {
  default = "Roboshop"
}

variable "environment" {
  
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
  
}

# variable "final-name" {
#     default = "${var.project}-${var.environment}-${var.Component}"

# }