resource "aws_db_instance" "itachi-rds" {
  identifier             = "itachi-rds"
  allocated_storage      = 10
  engine                 = var.engine
  engine_version         = lookup(var.engine_version, var.engine)
  instance_class         = "db.t2.micro"
  name                   = var.db_name
  username               = var.username
  password               = var.password
  publicly_accessible    = var.public_access
  vpc_security_group_ids = [var.sec_group_id]
  db_subnet_group_name   = aws_db_subnet_group.itachi-rds.id
}

resource "aws_db_subnet_group" "itachi-rds" {
  name        = "main_subnet_group"
  description = "Our main group of subnets"
  subnet_ids  = [var.subnet_group_id_1,var.subnet_group_id_2]
}