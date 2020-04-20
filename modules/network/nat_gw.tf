resource "aws_eip" "natGw1" {
  vpc      = true
  tags     = {
      Name = "Eip for NAT gateway 1"
  }
}

resource "aws_nat_gateway" "gw1" {
  allocation_id = aws_eip.natGw1.id
  subnet_id     = aws_subnet.itachi_public_subnet_c.id
  depends_on    = [aws_internet_gateway.itachi_igw]
}

resource "aws_eip" "natGw2" {
  vpc      = true
  tags     = {
      Name = "Eip for NAT gateway 2"
  }
}

resource "aws_nat_gateway" "gw2" {
  allocation_id = aws_eip.natGw2.id
  subnet_id     = aws_subnet.itachi_public_subnet_c.id
  depends_on    = [aws_internet_gateway.itachi_igw]
}
