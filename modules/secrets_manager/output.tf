output "rds_creds" {
  value = jsondecode(aws_secretsmanager_secret_version.rdscreds_version.secret_string)
}