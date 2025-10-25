resource "aws_route53_record" "Expense" {
    for_each = aws_instance.Expense
    zone_id = "${var.myzone_id}"
    name = ${each.key}.${var.mydomain_name}
    type = "A"
    ttl = 1
    records = [each.value.private_ip]
    allow_overwrite = true
}

