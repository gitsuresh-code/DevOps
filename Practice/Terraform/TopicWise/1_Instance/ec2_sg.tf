resource "aws_instance" "my_ec2_instance" {
    ami           = "ami-09c813fb71547fc4f" # Replace with a valid AMI ID for your region
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.ssh.id]
    tags = {
        Name      = "Suresh"
        Terraform = true
        Project   = "Sample"
    }  
}

resource "aws_security_group" "ssh" {
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

     ingress {
        from_port = 22
        to_port = 22
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {
    Name = "ssh connection"
    Description = "allowing ssh to ec2 instance"
        
    }
}  

