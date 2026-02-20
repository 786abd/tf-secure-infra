output "public_ip" {
  value = aws_instance.demo-ec2.public_ip
}

output "privat_ip" {
  value = aws_instance.demo-ec2.private_ip
}