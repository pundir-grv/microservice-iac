resource "aws_security_group" "itachi_public_sg" {
  name = "itachi_public_sg"
  description = "Allowing http traffic"
  vpc_id = aws_vpc.itachi_vpc.id
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self = true
  }

  ingress {
      from_port = 8000
      to_port = 8100
      protocol = "tcp"
      self = true
  }

  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
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
