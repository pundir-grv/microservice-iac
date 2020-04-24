output "vpc_id" {
  value = aws_vpc.itachi_vpc.id
}

output "subnet_id_private_a" {
  value = aws_subnet.itachi_public_subnet_a.id
}

output "subnet_id_private_b" {
  value = aws_subnet.itachi_public_subnet_b.id
}

output "subnet_id_pub_c" {
  value = aws_subnet.itachi_public_subnet_c.id
}

output "subnet_id_pub_d" {
  value = aws_subnet.itachi_public_subnet_d.id
}

output "security_group_id" {
  value = aws_security_group.itachi_public_sg.id
}

