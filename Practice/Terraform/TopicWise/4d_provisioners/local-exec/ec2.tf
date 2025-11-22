resource "aws_instance" "suresh" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    #vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = {
        Name = "suresh"
        Terraform = "true"
    }

    provisioner "local-exec"{
      #command = "echo ${self.private_ip}"
      command = "echo ${self.private_ip} > inventory.ini"
      #on_failure = continue
     }

     provisioner "local-exec"{
      #command = "echo ${self.private_ip}"
      command = "echo Instance is getting destroyed"
      when = destroy
     }
   
}

# resource "null_resource" "run_ansible" {
#   provisioner "local-exec" {
#     command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${aws_instance.suresh.public_ip},' playbook.yml"
#   }
# }

