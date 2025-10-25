
variable "project"{
    default = "roboshop"
}

variable "environment" {
    type = string
}

variable "ami_id" {
    type = string
    default     = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
    type = string
}

locals {
  common_name = "${var.project}-${var.environment}"
  common_tags = {
    Project = var.project
    Terraform = "true"
  }
}