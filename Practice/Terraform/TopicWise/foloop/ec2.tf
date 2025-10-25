resource "aws_instance" "Expense" {
    for_each = toset(var.instances)
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.Allow_All.id]
    tags = {
        Name = each.value
        Terraform = true
    }

}

resource "aws_security_group" "Allow_All" {
    name = "Allow_All"
    tags {
        name = "Allow_All"
    }

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}