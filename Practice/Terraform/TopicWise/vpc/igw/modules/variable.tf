# vpc tags
variable "vpc_cidr" {
    type = string
    
}

variable "project_name" {
    type = string
  
}

variable "environment" {
    type = string
  
}

variable "vpc_tags" {
    type = map
    default = {}
}



# igw tags
variable "igw_tags" {
    type = map
    default = {}
  
}
