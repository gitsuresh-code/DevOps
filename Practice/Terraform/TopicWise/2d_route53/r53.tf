resource "aws_route53_record" "Expense" {
    count=length(var.instances) #calling and looping list of values
    zone_id = var.zid # calling the zone id from variables
    name = "${var.instances[count.index]}.${var.zname}" #interpolation as calling different variables
    type = "A"
    ttl = 1
    records = [aws_instance.myinstnace[count.index].private_ip]
    allow_overwrite = true #enabling over writing the details

}

 