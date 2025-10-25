 
 module "my-ec2" {
    source = "./modules/ec2"
    ami_id = "ami-09c813fb71547fc4f"
    instance_name = "Suresh"
    instance_type = "t3.micro"
    environment = "prod"
 }

provider "aws" {
  region = "us-east-1"
}





