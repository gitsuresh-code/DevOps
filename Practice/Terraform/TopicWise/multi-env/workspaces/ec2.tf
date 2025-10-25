resource "aws_instance" "terraform" {
    ami = var.ami_id
    instance_type = lookup(var.instance_type, terraform.workspace )  #if terraform.workspace=dev ==> then t3.micro, else t3.small
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = merge(
      local.common_tags,
      {
        Name = "${local.common_name}-workspace"
      }
    )
}

resource "aws_security_group" "allow_all" {
  name   = "${local.common_name}-workspace"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge(
      local.common_tags,
      {
        Name = "${local.common_name}-workspace"
      }
  )

}