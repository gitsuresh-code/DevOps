variable "image_id" { 
	type = string
	default = "ami-09c813fb71547fc4f"
}
 
 
variable "type" { 
	type = string
	default = "t3.micro"
}



variable "ec2_tags" { 
    type = map

	default = {
		Name = "terraform"
		Project = "Roboshop"
		Environment = "Prod"
		Type_of_server = "database"
    }

}

variable "sg_name" { 
	type = string
	default = "allow-all"
	description = "security group attached to ec2 instance"

}
 
variable "ingress_from_port" { 
	type = number
	default = 0

}

variable "ingress_to_port" { 
	type = number
	default = 0

}

variable "ingress_protocol" { 
	type = string
	default = "-1"

}

variable "egress_protocol" { 
	type = string
	default = "-1"

}



variable "egress_from_port" { 
	type = number
	default = 0

}
 
variable "egress_to_port" { 
	type = number
	default = 0

}

variable "ingress_cidrblock" { 
	type = list
	default = ["0.0.0.0/0"]

}
 
variable "egress_cidrblock" { 
	type = list
	default = ["0.0.0.0/0"]

}
 