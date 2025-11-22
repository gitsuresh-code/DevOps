module "ec2_instance" {
    source = "../common_code"
    ami_id = "ami-09c813fb71547fc4f"
    type = "t3.micro"
    tags = {
        Name = "Suresh"
    }
  
}

output "pub_ip" {
value = module.ec2_instance.public_ip
}

output "pri_ip" {
value = module.ec2_instance.private_ip
}


output "instance_id" {
value = module.ec2_instance.instance_id
}