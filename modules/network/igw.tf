resource "aws_internet_gateway" "itachi_igw" {
  vpc_id = aws_vpc.itachi_vpc.id
  tags = {
      Name = "itachi_igw"
  }
}
