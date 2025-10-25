output "ec2-publicip" {
    value = module.my-ec2.public-ip
}

output "ec2-privateip" {
    value = module.my-ec2.private-ip
}