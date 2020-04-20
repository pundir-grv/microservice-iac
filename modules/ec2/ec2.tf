resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC65kgG48th7bwG2KElSrCgOBnYhn9w3cn5BDF55wU4Tugltlfko78JtrVOQFhB5oMeZnwCTu1yU+zAFoeKD0oIOTsU8IqJ4v9VNTxQxkUAl0RhEdwhR4KUm0LJ7xYsHRZqxMistq0iJy8/vwUC4b9MTMsKJwS/ypiOt/bOAKJhVCEJVvPq0T2MTiTHyQJXMZ86sdMtqcsWryuJzBxv/S1zfk4JH8qGRewtJp0aXqB9lCa/70aJpiVndWbL78g99tg8ppw//9NEMlGS1wEBemPbyoVpimmtsmAOLq/OOF8jH8TWg3RrDL4LTyKmSUVqPwbNJ7nbuNeRfFMr5+g7/nGf root@itachi"
}

resource "aws_instance" "jump_host" {
  ami                           = "ami-0460ce78b2cf43489"
  availability_zone             = var.availability_zone_a
  key_name                      = aws_key_pair.deployer.key_name
  vpc_security_group_ids        = var.security_groups
  subnet_id                     = var.subnet_id_c
  associate_public_ip_address   = true
  instance_type             = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
