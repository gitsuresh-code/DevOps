data "aws_instance" "myaws" {
  filter {
    name   = "tag:Name"
    values = ["terraform"]
  }
  depends_on = [aws_instance.terraform]
}

  output  "instance_output" {
  value  = data.aws_instance.myaws.public_ip
  }

# data "aws_security_group" "mysg" {
#   filter {
#     name   = "tag:Name"
#     values = ["allow_all"]
#   }
#   depends_on = [aws_security_group.allow_all]

# }

  output  "sg_output" {
  value  = aws_security_group.allow_all.id
  }