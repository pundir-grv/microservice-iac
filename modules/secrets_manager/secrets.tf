resource "aws_secretsmanager_secret" "rdscreds" {
  name = "rdscreds"
}

resource "aws_secretsmanager_secret_version" "rdscreds_version" {
  secret_id     = aws_secretsmanager_secret.rdscreds.id
  secret_string = jsonencode({"username":var.rds_username,"password":var.rds_password})
}