resource "aws_route53_record" "roboshop" {
  count           = 5
  zone_id         = var.zone_id
  type            = "A"
  ttl             = 1
  allow_overwrite = true

    name = var.instances[count.index] == "frontend" ? var.domain_name : "${var.instances[count.index]}.${var.domain_name}"

  records = [
    var.instances[count.index] == "frontend" ?
    aws_instance.terraform[count.index].public_ip :
    aws_instance.terraform[count.index].private_ip
  ]
}




# resource "aws_route53_record" "roboshop" {
#   count = 4
#   zone_id = "${var.zone_id}"
#   name    = "${var.instances[count.index]}.${var.domain_name}" # mongodb.daws86s.fun
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.terraform[count.index].private_ip]
  
#   allow_overwrite = true
# }



#instance_type = var.environment == "dev" ? "t3.micro" : "t3.medium"


# resource "aws_route53_record" "roboshop" {
#   count           = 4
#   zone_id         = var.zone_id
#   name    = 
#    var.instances[count.index] == "frontend" ?
#    var.domain_name :
#     "${var.instances[count.index]}.${var.domain_name}"
  
  
#   type            = "A"
#   ttl             = 1
#   allow_overwrite = true

#   records = [
#     var.instances[count.index] == "frontend" ?
#     aws_instance.terraform[count.index].public_ip :
#     aws_instance.terraform[count.index].private_ip
#   ]
# }