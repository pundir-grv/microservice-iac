output "vpc_id" {
  value = "aws_vpc.itachi_vpc.id"
}

output "subnet_id" {
  value = "aws_subnet.itachi_public_subnet.id"
}

output "security_group_id" {
  value = "aws_security_group.itachi_public_sg.id"
}

