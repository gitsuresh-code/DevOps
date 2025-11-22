resource "aws_instance" "this" {
    ami = var.ami_id
    instance_type = var.type
    tags = var.tags
}

