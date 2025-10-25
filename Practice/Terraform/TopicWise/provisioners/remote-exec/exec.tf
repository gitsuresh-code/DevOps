resource "aws_instance" "Suresh" {
    ami           = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.http_ssh.id]
    #key_name      = "my-key"
    tags = {
        Name = "Suresh"
    }

    connection {
      type        = "ssh"
      user        = "ec2-user"
      password = "DevOps321"
      #private_key = file("~/.ssh/my-key.pem")
      host        = self.public_ip
    }

    provisioner "local-exec" {
        command = "echo ${self.public_ip}"
    }

    provisioner "remote-exec" {
        inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx",
        #"echo 'Hello from Terraform' > /usr/share/nginx/html/index.html"
        "echo 'Hello from Terraform' | sudo tee /usr/share/nginx/html/index.html"
        ]
    }

    provisioner "remote-exec" {
        inline = [
        "sudo systemctl stop nginx",
        "sudo dnf remove nginx -y",
        #"echo 'NGINX is destroyed' > /usr/share/nginx/html/index.html"
        "echo 'Hello from Terraform' | sudo tee /usr/share/nginx/html/index.html"
        ]
        when = destroy
    }

}



resource "aws_security_group" "http_ssh" {
  name        = "http_ssh"
  description = "Allow SSH and HTTP inbound"

    egress {
                from_port   = 0
                to_port     = 0
                protocol    = "-1"
                cidr_blocks = ["0.0.0.0/0"]
    }


    dynamic "ingress" {
        for_each = toset(var.dynamic_ports)
        content {
            from_port   = ingress.value.from_port
            to_port     = ingress.value.to_port
            protocol    = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
        }
    
    }

  tags = {
    Name = "http_ssh"
  }
  
}