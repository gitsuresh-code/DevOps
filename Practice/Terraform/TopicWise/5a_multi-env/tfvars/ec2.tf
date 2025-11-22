resource "aws_instance" "suresh" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = merge(
      local.common_tags,
      {
        Name = "${local.common_name}-tfvars-multi-env"
      }
    )
}


resource "aws_security_group" "allow_all" {
  name   = "${local.common_name}-tfvars-multi-env"

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
            Name = "${local.common_name}-tfvars-multi-env"
        }
    )

}