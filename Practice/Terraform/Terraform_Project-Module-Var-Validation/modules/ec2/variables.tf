variable "ami_id" {
    type = string
    description = "AMI ID for EC2 instance"
  
}

variable "instance_type" {
    type = string
    description = "Ec2-instance-type"
    validation {
      condition = contains (["t3.micro","t2.micro","t4.micro"],var.instance_type)
      error_message = "Please pass the mentined t3.micro or t4.micro or t2.micro for Dev Environment"
    }
}


# variable "instance_type" {
#     type = string
#     description = "Ec2-instance-type"
#     check_list = ["t3.micro","t2.micro","t4.micro"]
#     validation {
#       condition = contains (["t3.micro","t2.micro"],instance_type)
#       error_message = "Please pass the mentined t3.micro or t4.micro or t2.micro for Dev Environment"
#     }
# }

variable "instance_name" {
    type = string
    description = "EC2-instance-name"
}

variable "environment" {
    type = string
    description = "EC2-Environment"
  
}

