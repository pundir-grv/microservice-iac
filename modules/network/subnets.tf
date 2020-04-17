resource "aws_subnet" "itachi_public_subnet_a" {
  vpc_id = aws_vpc.itachi_vpc.id
  cidr_block = var.cidr_block_public_a
  availability_zone = var.availability_zone_a
  tags = {
      Name = "itachi_public_subnet_b"
  }
}

resource "aws_subnet" "itachi_public_subnet_b" {
  vpc_id = aws_vpc.itachi_vpc.id
  cidr_block = var.cidr_block_public_b
  availability_zone = var.availability_zone_b
  tags = {
      Name = "itachi_public_subnet_a"
  }
}