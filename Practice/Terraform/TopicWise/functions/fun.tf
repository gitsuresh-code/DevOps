variable "list" {
    default = ["Suresh","Ramesh","Rajesh"]
}

output "fun_output" {
    value = length(var.list)
}



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



