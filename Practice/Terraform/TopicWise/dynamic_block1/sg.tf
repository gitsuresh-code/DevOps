
resource "aws_security_group" "dynamic_sg" {
    name = "dynamic_sg"

    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

      
    dynamic "ingress" {
      
    for_each = toset(var.dynamic_ports)  
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            
        }
    }



    tags = {
        Name="dynamic_sg"
    }
}