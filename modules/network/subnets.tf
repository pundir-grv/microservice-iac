resource "aws_subnet" "itachi_public_subnet" {
  vpc_id = aws_vpc.itachi_vpc.id
  cidr_block = var.cidr_block_public
  availability_zone = var.availability_zone
  tags = {
      Name = "itachi_public_subnet"
  }
}

# resource "aws_subnet" "itachi_private_subnet" {
#   vpc_id = aws_vpc.itachi_vpc.id
#   cidr_block = var.cidr_block_private
#   availability_zone = var.availability_zone
#   tags {
#       Name = "itachi_private_subnet"
#   }
# }