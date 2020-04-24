resource "aws_route_table" "itachi_public_route_table1" {
  vpc_id = aws_vpc.itachi_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw1.id
  }
  tags = {
    Name = "itachi_public_route_table1"
  }
}

resource "aws_route_table_association" "public_a_rt_association" {
  subnet_id = aws_subnet.itachi_public_subnet_a.id
  route_table_id = aws_route_table.itachi_public_route_table1.id
  depends_on = [
    aws_subnet.itachi_public_subnet_a
  ]
}

resource "aws_route_table" "itachi_public_route_table2" {
  vpc_id = aws_vpc.itachi_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw2.id
  }
  tags = {
    Name = "itachi_public_route_table2"
  }
}

resource "aws_route_table_association" "public_b_rt_association" {
  subnet_id = aws_subnet.itachi_public_subnet_b.id
  route_table_id = aws_route_table.itachi_public_route_table2.id
  depends_on = [
    aws_subnet.itachi_public_subnet_b
  ]
}

resource "aws_route_table" "itachi_public_route_table3" {
  vpc_id = aws_vpc.itachi_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.itachi_igw.id
  }
  tags = {
    Name = "itachi_public_route_table3"
  }
}

resource "aws_route_table_association" "public_c_rt_association" {
  subnet_id = aws_subnet.itachi_public_subnet_c.id
  route_table_id = aws_route_table.itachi_public_route_table3.id
  depends_on = [
    aws_subnet.itachi_public_subnet_c
  ]
}

resource "aws_route_table_association" "public_d_rt_association" {
  subnet_id = aws_subnet.itachi_public_subnet_d.id
  route_table_id = aws_route_table.itachi_public_route_table3.id
  depends_on = [
    aws_subnet.itachi_public_subnet_d
  ]
}