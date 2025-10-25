 

 module "my-ec2" {
    source = "./modules/ec2"
    ami_id = "ami-09c813fb71547fc4f"
    instance_name = "Suresh"
    instance_type = ""
    environment = "prod"
}

