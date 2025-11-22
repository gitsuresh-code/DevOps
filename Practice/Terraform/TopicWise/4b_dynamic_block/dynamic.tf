variable "ingress_rules" {
  default = [
    {from_port = 22, to_port = 22, cidr_blocks = ["0.0.0.0/0"] },
    {from_port = 80, to_port = 80, cidr_blocks = ["0.0.0.0/0"] }
  ]
}

resource "aws_security_group" "dynamic_sg" {
  name = "sg_names"
  
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}
