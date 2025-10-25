
variable "project"{
    default = "roboshop"
}

# variable "environment" {
#     type = map
#     default = {
#         dev = "dev"
#         prod = "prod"
#     }
# }

variable "ami_id" {
    type = string
    default     = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
    type = map
    default = {
        dev = "t3.micro"
        prod = "t3.small"
    }
}