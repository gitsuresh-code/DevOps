variable "list" {
    default = ["Suresh","Ramesh","Rajesh"]
}

output "fun_output" {
    value = length(var.list)
}

#==============================

variable "a" {
    default = 10
}

variable "b" {
    default = 15
}

variable "c" {
    default = 17
}

output "min_function" {
    value = min(var.a,var.b,var.c)
}

output "max_function" {
    value = max(var.a,var.b,var.c)
}


#======================================

variable "Name" {
  default = ["Siva","Kumar", "M"]
}

output "join_output" {
  value=join(" ",var.Name)
}

#======================================
variable "s_name" {
  default = "Shiva Kumar M"
}

output "split_output" {
  value = split(" ",var.s_name)
}

#=====================================
variable "common_tags" {
    default = {
        Project="roboshop"
        Environment="dev"

    }
  
}

locals {
  local_tags={
    Topic="interesting"
    Environment="prod"
  }
}

output "merge_fun" {
    value = merge(var.common_tags,local.local_tags)
  
}

#============================================


