resource "aws_security_group" "itachi_public_sg" {
  name = "itachi_public_sg"
  description = "Allowing http traffic"
  vpc_id = aws_vpc.itachi_vpc.id
  ingress {
      from_port = 0
      to_port = 65535
      protocol = "tcp"
      self = true
  }
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["106.51.109.225/32"]
      self = true
  }
  ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["106.51.109.225/32"]
      self = true
  }
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["106.51.109.225/32"]
      self = true
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Nmae = "itachi_public_sg"
  }

}
