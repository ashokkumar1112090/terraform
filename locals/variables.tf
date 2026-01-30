variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

# variable "common-name" {                           #not worked bcz varb is referring another varb so use locals.tf
#     default = "${var.project}-${var.environment}"
# }


variable "ami_id" {
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "common-tags" {      # common-tags means you can give it to any resource
    type = map
    default = {
     
    Terraform = "true"
    project = "roboshop"
    environment = "dev"
    }
}

variable "sg_name" {
    type = string
    default = "allow-all"
    description = "why we kept name sg and its dependency to ec2 write description" #no functionality diff its optional
    }

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "ingress_from_port" {
    default = 0
}

variable "ingress_to_port" {
    default = 0
}

variable "egress_from_port" {
    default = 0
}

variable "egress_to_port" {
    default = 0
}

variable "protocol" {
    default = "-1"
}