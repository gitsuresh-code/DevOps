output "instance-id" {
  value = aws_instance.this.id
}

output "public-ip" {
  value = aws_instance.this.public_ip
}

output "private-ip" {
  value = aws_instance.this.private_ip
}