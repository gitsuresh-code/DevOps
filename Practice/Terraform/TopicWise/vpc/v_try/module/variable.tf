variable "vpc_cidr" {
    type = string
    
}

#Project_name-Environment-resource_name
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

