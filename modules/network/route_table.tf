resource "aws_route_table" "itachi_public_route_table" {
  vpc_id = aws_vpc.itachi_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.itachi_igw.id
  }
  tags = {
    Name = "itachi_public_route_table"
  }
}

resource "aws_route_table_association" "public_a_rt_association" {
  subnet_id = aws_subnet.itachi_public_subnet_a.id
  route_table_id = aws_route_table.itachi_public_route_table.id
  depends_on = [
    aws_subnet.itachi_public_subnet_a
  ]
}

resource "aws_route_table_association" "public_b_rt_association" {
  subnet_id = aws_subnet.itachi_public_subnet_b.id
  route_table_id = aws_route_table.itachi_public_route_table.id
  depends_on = [
    aws_subnet.itachi_public_subnet_b
  ]
}
